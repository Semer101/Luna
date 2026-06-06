import 'package:luna_ai/core/constants/app_enums.dart';
import 'package:luna_ai/shared/models/cycle_model.dart';

class CyclePhaseService {
  CyclePhaseInfo calculate({
    required DateTime lastPeriodDate,
    required int cycleLength,
    required int periodDuration,
    DateTime? referenceDate,
  }) {
    final today = referenceDate ?? DateTime.now();
    final lastPeriod = DateTime(
      lastPeriodDate.year,
      lastPeriodDate.month,
      lastPeriodDate.day,
    );
    final todayNorm = DateTime(today.year, today.month, today.day);

    var dayInCycle = todayNorm.difference(lastPeriod).inDays + 1;
    while (dayInCycle <= 0) {
      dayInCycle += cycleLength;
    }
    while (dayInCycle > cycleLength) {
      dayInCycle -= cycleLength;
    }

    final daysUntilNextPeriod = cycleLength - dayInCycle + 1;
    final phase = _phaseForDay(dayInCycle, cycleLength, periodDuration);
    final phaseProgress = _phaseProgress(dayInCycle, cycleLength, periodDuration, phase);

    return CyclePhaseInfo(
      phase: phase,
      dayInCycle: dayInCycle,
      daysUntilNextPeriod: daysUntilNextPeriod,
      phaseProgress: phaseProgress,
    );
  }

  CyclePhase _phaseForDay(int day, int cycleLength, int periodDuration) {
    if (day <= periodDuration) return CyclePhase.menstrual;

    final ovulationDay = (cycleLength * 0.5).round();
    final follicularEnd = ovulationDay - 2;
    final ovulationEnd = ovulationDay + 1;

    if (day <= follicularEnd) return CyclePhase.follicular;
    if (day <= ovulationEnd) return CyclePhase.ovulation;
    return CyclePhase.luteal;
  }

  double _phaseProgress(
    int day,
    int cycleLength,
    int periodDuration,
    CyclePhase phase,
  ) {
    return switch (phase) {
      CyclePhase.menstrual => day / periodDuration,
      CyclePhase.follicular => (day - periodDuration) /
          ((cycleLength * 0.5).round() - periodDuration - 2),
      CyclePhase.ovulation => 0.5,
      CyclePhase.luteal =>
        (day - (cycleLength * 0.5).round() - 1) / (cycleLength - (cycleLength * 0.5).round() - 1),
    };
  }

  int predictEnergy(CyclePhase phase, List<int> historicalEnergy) {
    final base = switch (phase) {
      CyclePhase.menstrual => 4,
      CyclePhase.follicular => 7,
      CyclePhase.ovulation => 9,
      CyclePhase.luteal => 5,
    };
    if (historicalEnergy.isEmpty) return base;
    final avg = historicalEnergy.reduce((a, b) => a + b) / historicalEnergy.length;
    return ((base + avg) / 2).round().clamp(1, 10);
  }

  int predictStress(CyclePhase phase, List<int> historicalStress) {
    final base = switch (phase) {
      CyclePhase.menstrual => 6,
      CyclePhase.follicular => 3,
      CyclePhase.ovulation => 2,
      CyclePhase.luteal => 7,
    };
    if (historicalStress.isEmpty) return base;
    final avg = historicalStress.reduce((a, b) => a + b) / historicalStress.length;
    return ((base + avg) / 2).round().clamp(1, 10);
  }
}
