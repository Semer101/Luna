import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:luna_ai/core/constants/app_enums.dart';
import 'package:luna_ai/shared/models/wellness_model.dart';
import 'package:luna_ai/shared/providers/app_providers.dart';
import 'package:luna_ai/shared/providers/cycle_provider.dart';
import 'package:luna_ai/shared/providers/wellness_provider.dart';
import 'package:uuid/uuid.dart';

final chatMessagesProvider =
    StateNotifierProvider<ChatNotifier, List<ChatMessage>>((ref) {
  return ChatNotifier(ref);
});

class ChatNotifier extends StateNotifier<List<ChatMessage>> {
  ChatNotifier(this._ref) : super([]) {
    _loadHistory();
  }

  final Ref _ref;
  final _uuid = const Uuid();
  bool _isStreaming = false;

  bool get isStreaming => _isStreaming;

  Future<void> _loadHistory() async {
    final messages = await _ref.read(chatRepositoryProvider).getMessages();
    if (messages.isNotEmpty) state = messages;
  }

  Future<void> sendMessage(String text) async {
    if (text.trim().isEmpty || _isStreaming) return;

    final userMsg = ChatMessage(
      id: _uuid.v4(),
      role: 'user',
      content: text.trim(),
      createdAt: DateTime.now(),
    );
    state = [...state, userMsg];
    await _ref.read(chatRepositoryProvider).saveMessage(userMsg);

    _isStreaming = true;
    final assistantId = _uuid.v4();
    state = [
      ...state,
      ChatMessage(
        id: assistantId,
        role: 'assistant',
        content: '',
        isStreaming: true,
      ),
    ];

    final phase = await _ref.read(cyclePhaseProvider.future);
    final gemini = _ref.read(geminiServiceProvider);
    final buffer = StringBuffer();

    await for (final chunk in gemini.streamChat(
      history: state.where((m) => !m.isStreaming).toList(),
      userMessage: text,
      cyclePhase: phase?.phase.label,
    )) {
      buffer.write(chunk);
      state = [
        ...state.where((m) => m.id != assistantId),
        ChatMessage(
          id: assistantId,
          role: 'assistant',
          content: buffer.toString(),
          isStreaming: true,
        ),
      ];
    }

    final response = gemini.parseResponse(buffer.toString(), userMessage: text);
    final finalMsg = ChatMessage(
      id: assistantId,
      role: 'assistant',
      content: response.text,
      createdAt: DateTime.now(),
      schedule: response.schedule,
    );
    state = [...state.where((m) => m.id != assistantId), finalMsg];
    await _ref.read(chatRepositoryProvider).saveMessage(finalMsg);

    if (response.tasks.isNotEmpty) {
      await _ref.read(suggestionRepositoryProvider).addSuggestions(response.tasks);
      _ref.invalidate(suggestionsProvider);
      _ref.invalidate(pendingSuggestionsCountProvider);
    }

    if (response.journal != null) {
      await _ref.read(journalRepositoryProvider).addEntry(response.journal!);
      if (response.journal!.mood != null) {
        final moodType = MoodType.values.firstWhere(
          (m) => m.name == response.journal!.mood,
          orElse: () => MoodType.neutral,
        );
        await _ref.read(moodRepositoryProvider).logMood(
              mood: moodType,
              energy: response.journal!.energy ?? 5,
              stress: response.journal!.stress ?? 5,
              source: 'chat',
            );
        _ref.invalidate(moodsProvider);
        _ref.invalidate(journalProvider);
      }
    }

    await _ref.read(profileRepositoryProvider).addXp(5);
    _ref.invalidate(profileProvider);
    _isStreaming = false;
  }

  void clearChat() {
    state = [];
  }
}

final taskNotifierProvider =
    StateNotifierProvider<TaskNotifier, AsyncValue<void>>((ref) {
  return TaskNotifier(ref);
});

class TaskNotifier extends StateNotifier<AsyncValue<void>> {
  TaskNotifier(this._ref) : super(const AsyncData(null));

  final Ref _ref;

  Future<void> completeTask(String id) async {
    state = const AsyncLoading();
    state = await AsyncValue.guard(() async {
      await _ref.read(taskRepositoryProvider).updateTaskStatus(
            id,
            TaskStatus.completed,
          );
      await _ref.read(profileRepositoryProvider).addXp(25);
      _ref.invalidate(tasksProvider);
      _ref.invalidate(wellnessScoreProvider);
      _ref.invalidate(profileProvider);
    });
  }

  Future<void> approveSuggestion(String suggestionId) async {
    final suggestions = await _ref.read(suggestionRepositoryProvider).getPending();
    final suggestion = suggestions.firstWhere((s) => s.id == suggestionId);

    await _ref.read(taskRepositoryProvider).createTask(
          title: suggestion.title,
          description: suggestion.description,
          priority: suggestion.priority,
          dueDate: suggestion.suggestedDate,
          source: TaskSource.ai,
        );
    await _ref.read(suggestionRepositoryProvider).updateStatus(
          suggestionId,
          SuggestionStatus.approved,
        );
    _ref.invalidate(tasksProvider);
    _ref.invalidate(suggestionsProvider);
    _ref.invalidate(pendingSuggestionsCountProvider);
  }

  Future<void> rejectSuggestion(String suggestionId) async {
    await _ref.read(suggestionRepositoryProvider).updateStatus(
          suggestionId,
          SuggestionStatus.rejected,
        );
    _ref.invalidate(suggestionsProvider);
    _ref.invalidate(pendingSuggestionsCountProvider);
  }
}
