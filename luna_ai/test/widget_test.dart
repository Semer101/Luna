import 'package:flutter_test/flutter_test.dart';
import 'package:luna_ai/core/constants/app_enums.dart';
import 'package:luna_ai/shared/services/cycle_phase_service.dart';

void main() {
  test('CyclePhaseService calculates menstrual phase on day 1', () {
    final service = CyclePhaseService();
    final info = service.calculate(
      lastPeriodDate: DateTime(2026, 6, 1),
      cycleLength: 28,
      periodDuration: 5,
      referenceDate: DateTime(2026, 6, 1),
    );

    expect(info.phase, CyclePhase.menstrual);
    expect(info.dayInCycle, 1);
  });

  test('CyclePhaseService predicts higher energy during ovulation', () {
    final service = CyclePhaseService();
    final menstrual = service.predictEnergy(CyclePhase.menstrual, []);
    final ovulation = service.predictEnergy(CyclePhase.ovulation, []);

    expect(ovulation, greaterThan(menstrual));
  });
}
