import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:luna_ai/core/constants/app_enums.dart';
import 'package:luna_ai/shared/models/wellness_model.dart';
import 'package:luna_ai/shared/providers/app_providers.dart';
import 'package:luna_ai/shared/providers/cycle_provider.dart';

final moodsProvider = FutureProvider((ref) async {
  return ref.watch(moodRepositoryProvider).getMoods();
});

final tasksProvider = FutureProvider((ref) async {
  return ref.watch(taskRepositoryProvider).getTasks();
});

final suggestionsProvider = FutureProvider((ref) async {
  return ref.watch(suggestionRepositoryProvider).getPending();
});

final profileProvider = FutureProvider((ref) async {
  return ref.watch(profileRepositoryProvider).getProfile();
});

final journalProvider = FutureProvider((ref) async {
  return ref.watch(journalRepositoryProvider).getEntries();
});

final wellnessScoreProvider = FutureProvider<WellnessScoreModel>((ref) async {
  final moods = await ref.watch(moodsProvider.future);
  final tasks = await ref.watch(tasksProvider.future);
  final userId = ref.watch(userIdProvider);
  return ref.watch(wellnessScoreServiceProvider).calculate(
        userId: userId,
        moods: moods,
        tasks: tasks,
      );
});

final predictionsProvider = FutureProvider<List<FuturePrediction>>((ref) async {
  final cycle = await ref.watch(cycleProvider.future);
  if (cycle == null) return [];
  final moods = await ref.watch(moodsProvider.future);
  return ref.watch(predictionServiceProvider).predict(
        cycle: cycle,
        moods: moods,
      );
});

final wellnessTwinProvider = FutureProvider<List<WellnessTwinInsight>>((ref) async {
  final phase = await ref.watch(cyclePhaseProvider.future);
  if (phase == null) return [];
  final moods = await ref.watch(moodsProvider.future);
  return ref.watch(predictionServiceProvider).generateTwinInsights(
        currentPhase: phase.phase,
        moods: moods,
      );
});

final pendingSuggestionsCountProvider = FutureProvider<int>((ref) async {
  final suggestions = await ref.watch(suggestionsProvider.future);
  return suggestions.length;
});

class MoodNotifier extends StateNotifier<AsyncValue<void>> {
  MoodNotifier(this._ref) : super(const AsyncData(null));

  final Ref _ref;

  Future<void> logMood(MoodType mood, int energy, int stress) async {
    state = const AsyncLoading();
    state = await AsyncValue.guard(() async {
      await _ref.read(moodRepositoryProvider).logMood(
            mood: mood,
            energy: energy,
            stress: stress,
          );
      await _ref.read(profileRepositoryProvider).addXp(
            _ref.read(wellnessScoreServiceProvider).xpForAction('mood_log'),
          );
      _ref.invalidate(moodsProvider);
      _ref.invalidate(wellnessScoreProvider);
      _ref.invalidate(profileProvider);
    });
  }
}

final moodNotifierProvider =
    StateNotifierProvider<MoodNotifier, AsyncValue<void>>((ref) {
  return MoodNotifier(ref);
});
