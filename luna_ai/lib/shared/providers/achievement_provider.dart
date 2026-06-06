import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:luna_ai/shared/models/achievement_model.dart';
import 'package:luna_ai/shared/providers/wellness_provider.dart';
import 'package:luna_ai/shared/services/achievement_service.dart';

final achievementServiceProvider = Provider((ref) => AchievementService());

final achievementsProvider = FutureProvider<List<AchievementModel>>((ref) async {
  final profile = await ref.watch(profileProvider.future);
  final moods = await ref.watch(moodsProvider.future);
  final tasks = await ref.watch(tasksProvider.future);
  return ref.watch(achievementServiceProvider).compute(
        profile: profile,
        moods: moods,
        tasks: tasks,
      );
});
