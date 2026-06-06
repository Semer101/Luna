import 'dart:async';
import 'dart:convert';

import 'package:google_generative_ai/google_generative_ai.dart';
import 'package:luna_ai/core/config/app_config.dart';
import 'package:luna_ai/core/constants/app_enums.dart';
import 'package:luna_ai/shared/models/ai_suggestion_model.dart';
import 'package:luna_ai/shared/models/wellness_model.dart';
import 'package:uuid/uuid.dart';

const _systemPrompt = '''
You are Luna AI, a cycle-aware wellness assistant.
You help users manage productivity, wellness, and wellbeing according to their menstrual cycle.
You may generate task suggestions but NEVER create tasks directly — always require user approval.
Use cycle phase when generating recommendations.
Be warm, supportive, and concise.

When suggesting tasks or detecting emotional content, append a JSON block:
```json
{"tasks":[{"title":"...","description":"...","priority":"low|medium|high","suggested_date":"ISO8601","reasoning":"..."}],"journal":{"mood":"happy|calm|neutral|anxious|stressed|sad|energetic|null","energy":1-10,"stress":1-10}}
```
Only include tasks when actionable items are mentioned. Only include journal for emotional content.
''';

class GeminiResponse {
  GeminiResponse({
    required this.text,
    this.tasks = const [],
    this.journal,
  });

  final String text;
  final List<AiSuggestionModel> tasks;
  final JournalEntryModel? journal;
}

class GeminiService {
  GeminiService({String? userId}) : _userId = userId ?? 'demo-user';

  final String _userId;
  final _uuid = const Uuid();

  GenerativeModel? get _model {
    if (!AppConfig.hasGemini) return null;
    return GenerativeModel(
      model: 'gemini-2.5-flash',
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
    final cleaned = _stripJsonBlock(fullText);
    final parsed = _extractJson(fullText, userMessage: userMessage);

    final tasks = <AiSuggestionModel>[];
    JournalEntryModel? journal;

    if (parsed != null) {
      final taskList = parsed['tasks'] as List<dynamic>? ?? [];
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

      final journalData = parsed['journal'] as Map<String, dynamic>?;
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

    return GeminiResponse(text: cleaned.trim(), tasks: tasks, journal: journal);
  }

  Stream<String> _demoStream(String message, String? phase) async* {
    final lower = message.toLowerCase();
    await Future<void>.delayed(const Duration(milliseconds: 300));

    if (lower.contains('exam') || lower.contains('study')) {
      yield 'I understand you have an exam coming up! ';
      await Future<void>.delayed(const Duration(milliseconds: 200));
      yield 'During your ${phase ?? 'current'} phase, ';
      yield 'I recommend focused study sessions with regular breaks. ';
      yield "I've prepared some task suggestions for you to review.";
      return;
    }

    if (lower.contains('exhausted') || lower.contains('tired') || lower.contains('stressed')) {
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

  String _stripJsonBlock(String text) {
    final regex = RegExp(r'```json[\s\S]*?```');
    return text.replaceAll(regex, '').trim();
  }

  Map<String, dynamic>? _extractJson(String text, {String? userMessage}) {
    final regex = RegExp(r'```json\s*([\s\S]*?)\s*```');
    final match = regex.firstMatch(text);
    if (match == null) {
      return _demoExtractTasks(userMessage ?? text);
    }
    try {
      return jsonDecode(match.group(1)!) as Map<String, dynamic>;
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
          'suggested_date': DateTime.now().add(const Duration(days: 1)).toIso8601String(),
          'reasoning': 'Structured studying reduces exam anxiety',
        },
        {
          'title': 'Review biology notes',
          'description': 'Focus on key chapters for 45 minutes',
          'priority': 'high',
          'suggested_date': DateTime.now().add(const Duration(days: 2)).toIso8601String(),
          'reasoning': 'Active recall improves retention',
        },
      ]);
    }

    if (lower.contains('gym') || lower.contains('exercise')) {
      tasks.add({
        'title': 'Gym session',
        'description': '45-minute workout — strength or cardio',
        'priority': 'medium',
        'suggested_date': DateTime.now().add(const Duration(days: 1)).toIso8601String(),
        'reasoning': 'Regular exercise supports cycle-phase wellness',
      });
    }

    if (lower.contains('water') || lower.contains('hydrat') || lower.contains('drink')) {
      tasks.add({
        'title': 'Drink water',
        'description': 'Drink a glass of water every 2 hours',
        'priority': 'low',
        'suggested_date': DateTime.now().toIso8601String(),
        'reasoning': 'Hydration supports energy and reduces bloating',
      });
    }

    if (lower.contains('exhausted') || lower.contains('tired') ||
        lower.contains('stressed') || lower.contains('anxious')) {
      journal = {
        'mood': lower.contains('anxious') ? 'anxious' : 'stressed',
        'energy': 3,
        'stress': 7,
      };
    }

    if (tasks.isEmpty && journal == null) return null;
    return {'tasks': tasks, 'journal': journal};
  }

  TaskPriority _parsePriority(String? value) => switch (value?.toLowerCase()) {
        'high' => TaskPriority.high,
        'low' => TaskPriority.low,
        _ => TaskPriority.medium,
      };
}
