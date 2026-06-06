import 'package:luna_ai/core/constants/app_enums.dart';
import 'package:luna_ai/shared/models/achievement_model.dart';
import 'package:luna_ai/shared/models/mood_model.dart';
import 'package:luna_ai/shared/models/profile_model.dart';
import 'package:luna_ai/shared/models/task_model.dart';

class AchievementService {
  List<AchievementModel> compute({
    required ProfileModel? profile,
    required List<MoodModel> moods,
    required List<TaskModel> tasks,
  }) {
    final completedTasks = tasks.where((t) => t.status == TaskStatus.completed).length;
    final aiTasks = tasks.where((t) => t.source == TaskSource.ai).length;
    final moodLogs = moods.length;
    final chatMoods = moods.where((m) => m.source == 'chat').length;
    final level = profile?.level ?? 1;
    final xp = profile?.xp ?? 0;

    return [
      AchievementModel(
        id: 'first_mood',
        title: 'Mood Logger',
        description: 'Log your first mood entry',
        icon: '💜',
        earned: moodLogs >= 1,
        progress: moodLogs.clamp(0, 1),
        target: 1,
      ),
      AchievementModel(
        id: 'mood_streak',
        title: 'Emotional Awareness',
        description: 'Log mood 5 times',
        icon: '🌈',
        earned: moodLogs >= 5,
        progress: moodLogs.clamp(0, 5),
        target: 5,
      ),
      AchievementModel(
        id: 'task_master',
        title: 'Task Master',
        description: 'Complete 3 tasks',
        icon: '✅',
        earned: completedTasks >= 3,
        progress: completedTasks.clamp(0, 3),
        target: 3,
      ),
      AchievementModel(
        id: 'ai_collaborator',
        title: 'AI Collaborator',
        description: 'Complete an AI-suggested task',
        icon: '🤖',
        earned: tasks.any((t) => t.source == TaskSource.ai && t.status == TaskStatus.completed),
        progress: tasks.where((t) => t.source == TaskSource.ai && t.status == TaskStatus.completed).length.clamp(0, 1),
        target: 1,
      ),
      AchievementModel(
        id: 'invisible_journal',
        title: 'Invisible Journal',
        description: 'Let Luna track mood from chat 3 times',
        icon: '📝',
        earned: chatMoods >= 3,
        progress: chatMoods.clamp(0, 3),
        target: 3,
      ),
      AchievementModel(
        id: 'level_up',
        title: 'Rising Star',
        description: 'Reach level 3',
        icon: '⭐',
        earned: level >= 3,
        progress: level.clamp(0, 3),
        target: 3,
      ),
      AchievementModel(
        id: 'wellness_warrior',
        title: 'Wellness Warrior',
        description: 'Earn 200 XP',
        icon: '🏆',
        earned: xp >= 200,
        progress: xp.clamp(0, 200),
        target: 200,
      ),
      AchievementModel(
        id: 'ai_adopter',
        title: 'Agentic Helper',
        description: 'Add 2 AI-generated tasks',
        icon: '✨',
        earned: aiTasks >= 2,
        progress: aiTasks.clamp(0, 2),
        target: 2,
      ),
    ];
  }
}
