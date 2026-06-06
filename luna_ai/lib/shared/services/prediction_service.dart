import 'package:luna_ai/core/constants/app_enums.dart';
import 'package:luna_ai/shared/models/cycle_model.dart';
import 'package:luna_ai/shared/models/mood_model.dart';
import 'package:luna_ai/shared/models/wellness_model.dart';
import 'package:luna_ai/shared/services/cycle_phase_service.dart';

class PredictionService {
  PredictionService({CyclePhaseService? cycleService})
      : _cycleService = cycleService ?? CyclePhaseService();

  final CyclePhaseService _cycleService;

  List<FuturePrediction> predict({
    required CycleModel cycle,
    List<MoodModel> moods = const [],
    int daysAhead = 7,
  }) {
    final predictions = <FuturePrediction>[];
    final energyHistory = moods.map((m) => m.energy).toList();
    final stressHistory = moods.map((m) => m.stress).toList();

    for (var i = 1; i <= daysAhead; i++) {
      final futureDate = DateTime.now().add(Duration(days: i));
      final phaseInfo = _cycleService.calculate(
        lastPeriodDate: cycle.lastPeriodDate,
        cycleLength: cycle.cycleLength,
        periodDuration: cycle.periodDuration,
        referenceDate: futureDate,
      );

      final energy = _cycleService.predictEnergy(phaseInfo.phase, energyHistory);
      final stress = _cycleService.predictStress(phaseInfo.phase, stressHistory);
      final mood = _moodFromEnergyStress(energy, stress);
      final symptoms = _symptomsForPhase(phaseInfo.phase, i);
      final explanation = _explain(phaseInfo.phase, energy, stress, symptoms, i);

      predictions.add(FuturePrediction(
        dayOffset: i,
        predictedEnergy: energy,
        predictedStress: stress,
        predictedMood: mood,
        symptoms: symptoms,
        explanation: explanation,
      ));
    }
    return predictions;
  }

  String _moodFromEnergyStress(int energy, int stress) {
    if (energy >= 8 && stress <= 3) return 'Energetic';
    if (energy >= 6 && stress <= 5) return 'Calm';
    if (stress >= 7) return 'Stressed';
    if (energy <= 4) return 'Low energy';
    return 'Neutral';
  }

  List<String> _symptomsForPhase(CyclePhase phase, int dayOffset) {
    final symptoms = switch (phase) {
      CyclePhase.menstrual => <String>['Mild cramps', 'Fatigue', 'Bloating'],
      CyclePhase.follicular => <String>[],
      CyclePhase.ovulation => <String>['Increased energy', 'Mild bloating'],
      CyclePhase.luteal => <String>['Mood shifts', 'Breast tenderness', 'Food cravings'],
    };
    if (dayOffset <= 3 || phase != CyclePhase.menstrual) return symptoms;
    return [];
  }

  String _explain(CyclePhase phase, int energy, int stress, List<String> symptoms, int days) {
    final symptomText = symptoms.isNotEmpty
        ? ' You may experience ${symptoms.first.toLowerCase()} within the next $days day${days > 1 ? 's' : ''}.'
        : '';
    return 'During your ${phase.label.toLowerCase()} phase, expect energy around $energy/10 '
        'and stress around $stress/10.$symptomText';
  }

  List<WellnessTwinInsight> generateTwinInsights({
    required CyclePhase currentPhase,
    List<MoodModel> moods = const [],
  }) {
    final insights = <WellnessTwinInsight>[
      WellnessTwinInsight(
        title: 'Current Phase Pattern',
        description: 'You are in the ${currentPhase.label} phase. ${currentPhase.description}',
        category: 'cycle',
        confidence: 0.95,
      ),
    ];

    if (moods.length >= 3) {
      final lutealMoods = moods.where((m) => m.energy <= 5).length;
      if (lutealMoods > moods.length * 0.4) {
        insights.add(const WellnessTwinInsight(
          title: 'Energy Pattern',
          description:
              'You tend to experience lower energy during the luteal phase. Plan lighter activities.',
          category: 'energy',
          confidence: 0.78,
        ));
      }

      final avgStress = moods.map((m) => m.stress).reduce((a, b) => a + b) / moods.length;
      if (avgStress > 6) {
        insights.add(WellnessTwinInsight(
          title: 'Stress Awareness',
          description:
              'Your stress levels have been elevated recently. Consider mindfulness during ${currentPhase.label.toLowerCase()} phase.',
          category: 'stress',
          confidence: 0.82,
        ));
      }
    }

    insights.add(WellnessTwinInsight(
      title: 'Wellness Recommendation',
      description: _phaseRecommendation(currentPhase),
      category: 'recommendation',
      confidence: 0.88,
    ));

    return insights;
  }

  String _phaseRecommendation(CyclePhase phase) => switch (phase) {
        CyclePhase.menstrual =>
          'Prioritize rest, gentle movement, and iron-rich foods this week.',
        CyclePhase.follicular =>
          'Great time to start new projects and increase workout intensity.',
        CyclePhase.ovulation =>
          'Schedule important meetings and social activities — your peak performance window.',
        CyclePhase.luteal =>
          'Focus on completion, self-care, and reducing caffeine intake.',
      };
}
