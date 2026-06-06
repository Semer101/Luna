import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:luna_ai/core/constants/app_colors.dart';
import 'package:luna_ai/core/widgets/glass_card.dart';

final notificationPrefsProvider =
    StateProvider<NotificationPreferences>((ref) => const NotificationPreferences());

class NotificationPreferences {
  const NotificationPreferences({
    this.cycleReminders = true,
    this.moodReminders = true,
    this.taskReminders = true,
    this.wellnessInsights = true,
    this.aiSuggestions = true,
    this.dailyCheckIn = true,
  });

  final bool cycleReminders;
  final bool moodReminders;
  final bool taskReminders;
  final bool wellnessInsights;
  final bool aiSuggestions;
  final bool dailyCheckIn;

  NotificationPreferences copyWith({
    bool? cycleReminders,
    bool? moodReminders,
    bool? taskReminders,
    bool? wellnessInsights,
    bool? aiSuggestions,
    bool? dailyCheckIn,
  }) {
    return NotificationPreferences(
      cycleReminders: cycleReminders ?? this.cycleReminders,
      moodReminders: moodReminders ?? this.moodReminders,
      taskReminders: taskReminders ?? this.taskReminders,
      wellnessInsights: wellnessInsights ?? this.wellnessInsights,
      aiSuggestions: aiSuggestions ?? this.aiSuggestions,
      dailyCheckIn: dailyCheckIn ?? this.dailyCheckIn,
    );
  }
}

class NotificationsScreen extends ConsumerWidget {
  const NotificationsScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final prefs = ref.watch(notificationPrefsProvider);

    return Scaffold(
      appBar: AppBar(title: const Text('Notifications')),
      body: ListView(
        padding: const EdgeInsets.all(16),
        children: [
          GlassCard(
            gradient: AppColors.gradientPrimary,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Row(
                  children: [
                    Icon(Icons.notifications_active, color: Colors.white),
                    SizedBox(width: 8),
                    Text(
                      'Stay on track',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 18,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 8),
                Text(
                  'Cycle-aware reminders help Luna support you at the right time.',
                  style: TextStyle(color: Colors.white.withOpacity(0.85)),
                ),
              ],
            ),
          ),
          const SizedBox(height: 16),
          _PrefTile(
            title: 'Cycle phase alerts',
            subtitle: 'Notify when entering a new phase',
            value: prefs.cycleReminders,
            onChanged: (v) => ref.read(notificationPrefsProvider.notifier).state =
                prefs.copyWith(cycleReminders: v),
          ),
          _PrefTile(
            title: 'Mood check-ins',
            subtitle: 'Gentle reminders to log how you feel',
            value: prefs.moodReminders,
            onChanged: (v) => ref.read(notificationPrefsProvider.notifier).state =
                prefs.copyWith(moodReminders: v),
          ),
          _PrefTile(
            title: 'Task reminders',
            subtitle: 'Due dates for today and upcoming tasks',
            value: prefs.taskReminders,
            onChanged: (v) => ref.read(notificationPrefsProvider.notifier).state =
                prefs.copyWith(taskReminders: v),
          ),
          _PrefTile(
            title: 'AI suggestions',
            subtitle: 'When Luna has new actions to review',
            value: prefs.aiSuggestions,
            onChanged: (v) => ref.read(notificationPrefsProvider.notifier).state =
                prefs.copyWith(aiSuggestions: v),
          ),
          _PrefTile(
            title: 'Wellness insights',
            subtitle: 'Weekly wellness score summaries',
            value: prefs.wellnessInsights,
            onChanged: (v) => ref.read(notificationPrefsProvider.notifier).state =
                prefs.copyWith(wellnessInsights: v),
          ),
          _PrefTile(
            title: 'Daily check-in',
            subtitle: 'Morning copilot prompt',
            value: prefs.dailyCheckIn,
            onChanged: (v) => ref.read(notificationPrefsProvider.notifier).state =
                prefs.copyWith(dailyCheckIn: v),
          ),
        ],
      ),
    );
  }
}

class _PrefTile extends StatelessWidget {
  const _PrefTile({
    required this.title,
    required this.subtitle,
    required this.value,
    required this.onChanged,
  });

  final String title;
  final String subtitle;
  final bool value;
  final ValueChanged<bool> onChanged;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 8),
      child: GlassCard(
        padding: EdgeInsets.zero,
        child: SwitchListTile(
          title: Text(title),
          subtitle: Text(subtitle, style: TextStyle(color: AppColors.textSecondary, fontSize: 13)),
          value: value,
          activeColor: AppColors.primary,
          onChanged: onChanged,
        ),
      ),
    );
  }
}
