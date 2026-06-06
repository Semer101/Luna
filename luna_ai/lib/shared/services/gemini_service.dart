import 'dart:async';
import 'dart:convert';

import 'package:google_generative_ai/google_generative_ai.dart';
import 'package:luna_ai/core/config/app_config.dart';
import 'package:luna_ai/core/constants/app_enums.dart';
import 'package:luna_ai/shared/models/ai_suggestion_model.dart';
import 'package:luna_ai/shared/models/schedule_model.dart';
import 'package:luna_ai/shared/models/wellness_model.dart';
import 'package:uuid/uuid.dart';

const _systemPrompt = '''
You are Luna AI, a cycle-aware wellness assistant AND a smart scheduling assistant.

## Mode A — Wellness / Emotional support
Help the user with productivity, wellness, and wellbeing according to their menstrual cycle.
You may generate task suggestions but NEVER create tasks directly — always require user approval.
Use cycle phase when generating recommendations.
Be warm, supportive, and concise.

When suggesting tasks or detecting emotional content, append a JSON block:
```json
{"tasks":[{"title":"...","description":"...","priority":"low|medium|high","suggested_date":"ISO8601","reasoning":"..."}],"journal":{"mood":"happy|calm|neutral|anxious|stressed|sad|energetic|null","energy":1-10,"stress":1-10}}
```
Only include tasks when actionable items are mentioned. Only include journal for emotional content.

## Mode B — Schedule generation (time blocks)
When the user describes their day with activities and times
(e.g. "I wake up at 7, study from 9 to 12, gym at 5", "plan my day: 8 breakfast, 10 deep work, 6 yoga"),
you MUST output a time-blocked schedule in this exact format:

```schedule
{"date":"YYYY-MM-DD","intro":"Short warm intro","tasks":[{"time":"07:00","activity":"Wake up"},{"time":"09:00","activity":"Study"},{"time":"17:00","activity":"Gym"}]}
```

Schedule rules:
- Always infer missing times logically (e.g. "study from 9 to 12" → 09:00 Study with duration 180)
- Use 24-hour HH:mm format
- Keep activities short and clear (max ~5 words)
- Keep blocks in chronological order
- If the user says "today" use the current date
- Do not include explanations outside the JSON block in this mode
''';

class GeminiResponse {
  GeminiResponse({
    required this.text,
    this.tasks = const [],
    this.journal,
    this.schedule,
  });

  final String text;
  final List<AiSuggestionModel> tasks;
  final JournalEntryModel? journal;
  final ScheduleModel? schedule;
}

class GeminiService {
  GeminiService({String? userId}) : _userId = userId ?? 'demo-user';

  final String _userId;
  final _uuid = const Uuid();

  GenerativeModel? get _model {
    if (!AppConfig.hasGemini) return null;
    return GenerativeModel(
      model: AppConfig.geminiModel,
      apiKey: AppConfig.geminiApiKey,
      systemInstruction: Content.system(_systemPrompt),
    );
  }

  Stream<String> streamChat({
    required List<ChatMessage> history,
    required String userMessage,
    String? cyclePhase,
    Map<String, dynamic>? wellnessContext,
  }) async* {
    final contextPrefix = cyclePhase != null
        ? '[Cycle phase: $cyclePhase] '
        : '';
    final fullMessage = '$contextPrefix$userMessage';

    if (_model == null) {
      yield* _demoStream(fullMessage, cyclePhase);
      return;
    }

    final chat = _model!.startChat(
      history: history
          .where((m) => m.role != 'system')
          .map((m) => Content(
                m.role == 'assistant' ? 'model' : 'user',
                [TextPart(m.content)],
              ))
          .toList(),
    );

    final response = chat.sendMessageStream(Content.text(fullMessage));
    await for (final chunk in response) {
      final text = chunk.text;
      if (text != null && text.isNotEmpty) yield text;
    }
  }

  Future<GeminiResponse> sendMessage({
    required List<ChatMessage> history,
    required String userMessage,
    String? cyclePhase,
  }) async {
    final buffer = StringBuffer();
    await for (final chunk in streamChat(
      history: history,
      userMessage: userMessage,
      cyclePhase: cyclePhase,
    )) {
      buffer.write(chunk);
    }
    return parseResponse(buffer.toString(), userMessage: userMessage);
  }

  GeminiResponse parseResponse(String fullText, {String? userMessage}) {
    final cleaned = _stripAllJsonBlocks(fullText);

    // Schedule branch (preferred when present)
    final scheduleMap = _extractJsonBlock(fullText, lang: 'schedule');
    final schedule = scheduleMap != null ? _parseSchedule(scheduleMap) : null;

    // Wellness branch
    final wellnessMap = schedule == null
        ? _extractJsonBlock(fullText, lang: 'json')
        : null;

    final tasks = <AiSuggestionModel>[];
    JournalEntryModel? journal;

    final sourceMap = wellnessMap ??
        (schedule == null ? _demoExtractTasks(userMessage ?? fullText) : null);

    if (sourceMap != null && schedule == null) {
      final taskList = sourceMap['tasks'] as List<dynamic>? ?? [];
      for (final t in taskList) {
        final map = t as Map<String, dynamic>;
        tasks.add(AiSuggestionModel(
          id: _uuid.v4(),
          userId: _userId,
          title: map['title'] as String? ?? 'Task',
          description: map['description'] as String? ?? '',
          priority: _parsePriority(map['priority'] as String?),
          reasoning: map['reasoning'] as String? ?? '',
          suggestedDate: map['suggested_date'] != null
              ? DateTime.tryParse(map['suggested_date'] as String)
              : null,
        ));
      }

      final journalData = sourceMap['journal'] as Map<String, dynamic>?;
      if (journalData != null && journalData['mood'] != null) {
        journal = JournalEntryModel(
          id: _uuid.v4(),
          userId: _userId,
          mood: journalData['mood'] as String?,
          energy: journalData['energy'] as int?,
          stress: journalData['stress'] as int?,
          message: cleaned,
        );
      }
    }

    // Final demo schedule fallback (only if no LLM schedule and the prompt looks like a plan)
    final finalSchedule = schedule ??
        (userMessage != null ? _demoExtractSchedule(userMessage) : null);

    return GeminiResponse(
      text: finalSchedule != null
          ? (finalSchedule.intro.isNotEmpty
              ? finalSchedule.intro
              : "Here's your plan for the day:")
          : cleaned.trim(),
      tasks: tasks,
      journal: journal,
      schedule: finalSchedule,
    );
  }

  ScheduleModel? _parseSchedule(Map<String, dynamic> map) {
    try {
      final tasksRaw = map['tasks'] as List<dynamic>? ?? const [];
      if (tasksRaw.isEmpty) return null;

      final blocks = <ScheduleBlock>[];
      for (final t in tasksRaw) {
        final entry = t as Map<String, dynamic>;
        final time = entry['time']?.toString();
        final activity = entry['activity']?.toString();
        if (time == null || activity == null) continue;
        final normalized = _normalizeTime(time);
        if (normalized == null) continue;
        blocks.add(ScheduleBlock(
          time: normalized,
          activity: activity,
          durationMinutes: (entry['duration_minutes'] as num?)?.toInt() ?? 60,
        ));
      }
      if (blocks.isEmpty) return null;
      blocks.sort(
        (a, b) => _timeToMinutes(a.time).compareTo(_timeToMinutes(b.time)),
      );

      DateTime date;
      final dateStr = map['date']?.toString();
      if (dateStr != null && dateStr.isNotEmpty) {
        date = DateTime.tryParse(dateStr) ?? DateTime.now();
      } else {
        date = DateTime.now();
      }

      return ScheduleModel(
        date: date,
        blocks: blocks,
        intro: (map['intro'] as String?) ?? '',
      );
    } catch (_) {
      return null;
    }
  }

  Stream<String> _demoStream(String message, String? phase) async* {
    final lower = message.toLowerCase();
    await Future<void>.delayed(const Duration(milliseconds: 300));

    if (_looksLikeScheduleRequest(lower)) {
      final schedule = _demoExtractSchedule(message);
      if (schedule != null) {
        yield "Here's your plan for the day:";
        return;
      }
    }

    if (lower.contains('exam') || lower.contains('study')) {
      yield 'I understand you have an exam coming up! ';
      await Future<void>.delayed(const Duration(milliseconds: 200));
      yield 'During your ${phase ?? 'current'} phase, ';
      yield 'I recommend focused study sessions with regular breaks. ';
      yield "I've prepared some task suggestions for you to review.";
      return;
    }

    if (lower.contains('exhausted') ||
        lower.contains('tired') ||
        lower.contains('stressed')) {
      yield 'I hear you — rest is essential, especially during the ${phase ?? 'luteal'} phase. ';
      yield 'Your body is signaling it needs care. ';
      yield 'Would you like me to suggest some gentle wellness tasks?';
      return;
    }

    if (lower.contains('gym') || lower.contains('exercise')) {
      yield 'Great goal! ';
      yield 'Based on your cycle phase, I can suggest an optimal workout schedule. ';
      yield 'Check your AI Suggested Actions for personalized tasks.';
      return;
    }

    if (lower.contains('water') || lower.contains('hydrat')) {
      yield "Staying hydrated is wonderful for your wellness! ";
      yield "I'll add a hydration reminder to your suggestions.";
      return;
    }

    yield "I'm here to support your wellness journey. ";
    yield 'Tell me about your goals, how you\'re feeling, or what you need help with today.';
  }

  String _stripAllJsonBlocks(String text) {
    final scheduleRegex = RegExp(r'```schedule[\s\S]*?```');
    final jsonRegex = RegExp(r'```json[\s\S]*?```');
    return text
        .replaceAll(scheduleRegex, '')
        .replaceAll(jsonRegex, '')
        .trim();
  }

  Map<String, dynamic>? _extractJsonBlock(String text, {required String lang}) {
    final regex = RegExp('```$lang\\s*([\\s\\S]*?)\\s*```');
    final match = regex.firstMatch(text);
    if (match == null) return null;
    try {
      final decoded = jsonDecode(match.group(1)!);
      if (decoded is Map<String, dynamic>) return decoded;
      return null;
    } catch (_) {
      return null;
    }
  }

  Map<String, dynamic>? _demoExtractTasks(String text) {
    final lower = text.toLowerCase();
    final tasks = <Map<String, dynamic>>[];
    Map<String, dynamic>? journal;

    if (lower.contains('exam') || lower.contains('study')) {
      tasks.addAll([
        {
          'title': 'Create study schedule',
          'description': 'Break down exam topics into daily study blocks',
          'priority': 'high',
          'suggested_date':
              DateTime.now().add(const Duration(days: 1)).toIso8601String(),
          'reasoning': 'Structured studying reduces exam anxiety',
        },
        {
          'title': 'Review biology notes',
          'description': 'Focus on key chapters for 45 minutes',
          'priority': 'high',
          'suggested_date':
              DateTime.now().add(const Duration(days: 2)).toIso8601String(),
          'reasoning': 'Active recall improves retention',
        },
      ]);
    }

    if (lower.contains('gym') || lower.contains('exercise')) {
      tasks.add({
        'title': 'Gym session',
        'description': '45-minute workout — strength or cardio',
        'priority': 'medium',
        'suggested_date':
            DateTime.now().add(const Duration(days: 1)).toIso8601String(),
        'reasoning': 'Regular exercise supports cycle-phase wellness',
      });
    }

    if (lower.contains('water') ||
        lower.contains('hydrat') ||
        lower.contains('drink')) {
      tasks.add({
        'title': 'Drink water',
        'description': 'Drink a glass of water every 2 hours',
        'priority': 'low',
        'suggested_date': DateTime.now().toIso8601String(),
        'reasoning': 'Hydration supports energy and reduces bloating',
      });
    }

    if (lower.contains('exhausted') ||
        lower.contains('tired') ||
        lower.contains('stressed') ||
        lower.contains('anxious')) {
      journal = {
        'mood': lower.contains('anxious') ? 'anxious' : 'stressed',
        'energy': 3,
        'stress': 7,
      };
    }

    if (tasks.isEmpty && journal == null) return null;
    return {'tasks': tasks, 'journal': journal};
  }

  /// Heuristic local schedule parser used as a fallback in demo mode.
  /// Recognises patterns like:
  ///   "I wake up at 7", "wake at 7am"
  ///   "study from 9 to 12"  → 09:00 Study (180 min)
  ///   "gym at 5", "gym at 5pm"
  ///   "breakfast at 8", "lunch at 1"
  ///   "plan my day", "schedule my day", "make a plan"
  ScheduleModel? _demoExtractSchedule(String text) {
    if (!_looksLikeScheduleRequest(text.toLowerCase())) return null;

    final blocks = <ScheduleBlock>[];

    // "from X to Y" — single block with computed duration
    final rangeRegex = RegExp(
      r'(study|work|exercise|gym|class|meeting|sleep|rest)\s+from\s+(\d{1,2})(?:\s*([ap]m))?\s+to\s+(\d{1,2})(?:\s*([ap]m))?',
      caseSensitive: false,
    );
    for (final m in rangeRegex.allMatches(text)) {
      final activity = _capitalize(m.group(1)!);
      final startH = _to24(m.group(2)!, m.group(3));
      final endH = _to24(m.group(4)!, m.group(5));
      if (startH == null || endH == null || endH <= startH) continue;
      blocks.add(ScheduleBlock(
        time: _fmt(startH, 0),
        activity: activity,
        durationMinutes: (endH - startH) * 60,
      ));
    }

    // "at H" / "at Ham/pm" single blocks
    final atRegex = RegExp(
      r'(wake|wake up|breakfast|lunch|dinner|gym|exercise|run|yoga|meditation|meeting|class|shower|coffee|tea|nap|sleep|start work|end work|relax|reading|read|walk|study)\s+at\s+(\d{1,2})(?:\s*([ap]m))?',
      caseSensitive: false,
    );
    for (final m in atRegex.allMatches(text)) {
      final raw = m.group(1)!.toLowerCase();
      final activity = _activityLabel(raw);
      final h = _to24(m.group(2)!, m.group(3));
      if (h == null) continue;
      blocks.add(ScheduleBlock(
        time: _fmt(h, 0),
        activity: activity,
        durationMinutes: _defaultDuration(raw),
      ));
    }

    if (blocks.isEmpty) {
      // "plan my day" with no specifics → give a sensible default
      return ScheduleModel(
        date: DateTime.now(),
        blocks: const [
          ScheduleBlock(time: '07:00', activity: 'Wake up'),
          ScheduleBlock(time: '08:00', activity: 'Breakfast'),
          ScheduleBlock(time: '09:00', activity: 'Deep work'),
          ScheduleBlock(time: '12:00', activity: 'Lunch'),
          ScheduleBlock(time: '13:00', activity: 'Deep work'),
          ScheduleBlock(time: '17:00', activity: 'Exercise'),
          ScheduleBlock(time: '19:00', activity: 'Dinner'),
          ScheduleBlock(time: '21:00', activity: 'Wind down'),
        ],
        intro: "Here's a balanced day to get you started:",
      );
    }

    // Dedupe by time, keep the first occurrence
    final seen = <String>{};
    final unique = <ScheduleBlock>[];
    for (final b in blocks) {
      if (seen.add(b.time)) unique.add(b);
    }
    unique.sort(
      (a, b) => _timeToMinutes(a.time).compareTo(_timeToMinutes(b.time)),
    );

    return ScheduleModel(
      date: DateTime.now(),
      blocks: unique,
      intro: "Here's your plan for the day:",
    );
  }

  bool _looksLikeScheduleRequest(String lower) {
    const triggers = [
      'plan my day',
      'plan my schedule',
      'schedule my day',
      'make a plan',
      'make a schedule',
      'daily schedule',
      'time block',
      'time-block',
      'wake up at',
      'wake at',
      ' i wake',
      'study from',
      'work from',
      'gym at',
      'lunch at',
      'breakfast at',
      'dinner at',
    ];
    return triggers.any(lower.contains);
  }

  String _activityLabel(String raw) {
    switch (raw) {
      case 'wake':
      case 'wake up':
        return 'Wake up';
      case 'gym':
      case 'exercise':
      case 'run':
      case 'yoga':
        return 'Workout';
      case 'breakfast':
        return 'Breakfast';
      case 'lunch':
        return 'Lunch';
      case 'dinner':
        return 'Dinner';
      case 'coffee':
      case 'tea':
        return 'Coffee break';
      case 'shower':
        return 'Shower';
      case 'meditation':
        return 'Meditation';
      case 'nap':
        return 'Nap';
      case 'sleep':
        return 'Sleep';
      case 'meeting':
        return 'Meeting';
      case 'class':
        return 'Class';
      case 'start work':
        return 'Start work';
      case 'end work':
        return 'End work';
      case 'relax':
        return 'Relax';
      case 'reading':
      case 'read':
        return 'Reading';
      case 'walk':
        return 'Walk';
      case 'study':
        return 'Study';
      default:
        return _capitalize(raw);
    }
  }

  int _defaultDuration(String raw) {
    switch (raw) {
      case 'wake':
      case 'wake up':
      case 'shower':
        return 30;
      case 'breakfast':
      case 'lunch':
      case 'dinner':
        return 45;
      case 'coffee':
      case 'tea':
      case 'nap':
        return 20;
      case 'gym':
      case 'exercise':
      case 'run':
      case 'yoga':
      case 'workout':
        return 60;
      case 'meditation':
      case 'walk':
      case 'relax':
        return 30;
      case 'meeting':
      case 'class':
      case 'study':
        return 90;
      case 'reading':
      case 'read':
        return 45;
      default:
        return 60;
    }
  }

  String _capitalize(String s) =>
      s.isEmpty ? s : s[0].toUpperCase() + s.substring(1).toLowerCase();

  /// Convert a 12-hour hour + am/pm into a 24-hour hour. Returns null on failure.
  int? _to24(String hourStr, String? meridian) {
    final h = int.tryParse(hourStr.trim());
    if (h == null || h < 0 || h > 23) return null;
    if (meridian == null) return h;
    final m = meridian.toLowerCase();
    if (m == 'am') {
      if (h == 12) return 0;
      return h;
    }
    if (m == 'pm') {
      if (h == 12) return 12;
      return h + 12;
    }
    return h;
  }

  String _fmt(int hour, int minute) =>
      '${hour.toString().padLeft(2, '0')}:${minute.toString().padLeft(2, '0')}';

  int _timeToMinutes(String hhmm) {
    final parts = hhmm.split(':');
    if (parts.length != 2) return 0;
    final h = int.tryParse(parts[0]) ?? 0;
    final m = int.tryParse(parts[1]) ?? 0;
    return h * 60 + m;
  }

  /// Normalise any of "7", "7:00", "7:00am", "07:00" to "HH:mm".
  String? _normalizeTime(String raw) {
    final trimmed = raw.trim().toLowerCase();
    final match = RegExp(r'^(\d{1,2})(?::(\d{1,2}))?\s*(am|pm)?$').firstMatch(trimmed);
    if (match == null) return null;
    final h = _to24(match.group(1)!, match.group(3));
    if (h == null) return null;
    final mm = int.tryParse(match.group(2) ?? '0') ?? 0;
    return _fmt(h, mm);
  }

  TaskPriority _parsePriority(String? value) => switch (value?.toLowerCase()) {
        'high' => TaskPriority.high,
        'low' => TaskPriority.low,
        _ => TaskPriority.medium,
      };
}
