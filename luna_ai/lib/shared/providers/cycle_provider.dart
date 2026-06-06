import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:luna_ai/shared/models/cycle_model.dart';
import 'package:luna_ai/shared/providers/app_providers.dart';
import 'package:luna_ai/shared/providers/auth_provider.dart';

final cycleProvider = FutureProvider<CycleModel?>((ref) async {
  return ref.watch(cycleRepositoryProvider).getCycle();
});

final cyclePhaseProvider = FutureProvider<CyclePhaseInfo?>((ref) async {
  final cycle = await ref.watch(cycleProvider.future);
  if (cycle == null) return null;
  return ref.watch(cyclePhaseServiceProvider).calculate(
        lastPeriodDate: cycle.lastPeriodDate,
        cycleLength: cycle.cycleLength,
        periodDuration: cycle.periodDuration,
      );
});

class CycleNotifier extends StateNotifier<AsyncValue<void>> {
  CycleNotifier(this._ref) : super(const AsyncData(null));

  final Ref _ref;

  Future<void> saveCycle({
    required DateTime lastPeriodDate,
    required int cycleLength,
    required int periodDuration,
  }) async {
    state = const AsyncLoading();
    state = await AsyncValue.guard(() async {
      await _ref.read(cycleRepositoryProvider).upsertCycle(
            lastPeriodDate: lastPeriodDate,
            cycleLength: cycleLength,
            periodDuration: periodDuration,
          );
      await _ref.read(demoStorageProvider).setOnboarded(true);
      _ref.invalidate(cycleProvider);
      _ref.invalidate(cyclePhaseProvider);
      _ref.invalidate(onboardingCompleteProvider);
    });
  }
}

final cycleNotifierProvider =
    StateNotifierProvider<CycleNotifier, AsyncValue<void>>((ref) {
  return CycleNotifier(ref);
});
