import 'package:luna_ai/core/constants/app_enums.dart';
import 'package:luna_ai/shared/models/mood_model.dart';
import 'package:luna_ai/shared/models/task_model.dart';
import 'package:luna_ai/shared/models/wellness_model.dart';

class WellnessScoreService {
  WellnessScoreModel calculate({
    required String userId,
    List<MoodModel> moods = const [],
    List<TaskModel> tasks = const [],
    int hydrationGlasses = 6,
    int sleepHours = 7,
  }) {
    final moodScore = _moodComponent(moods);
    final stressScore = _stressComponent(moods);
    final activityScore = _activityComponent(tasks);
    final hydrationScore = (hydrationGlasses / 8 * 100).round().clamp(0, 100);
    final sleepScore = _sleepComponent(sleepHours);

    final total = ((moodScore + stressScore + activityScore + hydrationScore + sleepScore) / 5)
        .round()
        .clamp(0, 100);

    return WellnessScoreModel(
      id: '',
      userId: userId,
      score: total,
      sleep: sleepScore,
      moodScore: moodScore,
      stressScore: stressScore,
      activity: activityScore,
      hydration: hydrationScore,
      createdAt: DateTime.now(),
    );
  }

  int _moodComponent(List<MoodModel> moods) {
    if (moods.isEmpty) return 60;
    final recent = moods.take(7).toList();
    final values = recent.map((m) {
      return switch (m.mood) {
        MoodType.happy => 90,
        MoodType.calm => 85,
        MoodType.energetic => 88,
        MoodType.neutral => 65,
        MoodType.anxious => 40,
        MoodType.stressed => 35,
        MoodType.sad => 30,
      };
    });
    return values.reduce((a, b) => a + b) ~/ values.length;
  }

  int _stressComponent(List<MoodModel> moods) {
    if (moods.isEmpty) return 60;
    final avgStress = moods.take(7).map((m) => m.stress).reduce((a, b) => a + b) /
        moods.take(7).length;
    return (100 - avgStress * 10).round().clamp(0, 100);
  }

  int _activityComponent(List<TaskModel> tasks) {
    final completed = tasks.where((t) => t.status == TaskStatus.completed).length;
    final total = tasks.length;
    if (total == 0) return 50;
    return (completed / total * 100).round();
  }

  int _sleepComponent(int hours) {
    if (hours >= 7 && hours <= 9) return 95;
    if (hours >= 6) return 75;
    if (hours >= 5) return 55;
    return 35;
  }

  int xpForAction(String action) => switch (action) {
        'mood_log' => 15,
        'task_complete' => 25,
        'streak' => 50,
        'chat' => 5,
        _ => 10,
      };

  int levelFromXp(int xp) => (xp / 100).floor() + 1;
}
