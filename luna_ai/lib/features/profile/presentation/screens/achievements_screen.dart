import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:luna_ai/core/constants/app_colors.dart';
import 'package:luna_ai/core/widgets/glass_card.dart';
import 'package:luna_ai/shared/models/achievement_model.dart';
import 'package:luna_ai/shared/providers/achievement_provider.dart';
import 'package:luna_ai/shared/providers/wellness_provider.dart';

class AchievementsScreen extends ConsumerWidget {
  const AchievementsScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final achievementsAsync = ref.watch(achievementsProvider);
    final profileAsync = ref.watch(profileProvider);

    return Scaffold(
      appBar: AppBar(title: const Text('Achievements')),
      body: achievementsAsync.when(
        data: (achievements) {
          final earned = achievements.where((a) => a.earned).length;

          return ListView(
            padding: const EdgeInsets.all(16),
            children: [
              profileAsync.when(
                data: (profile) => GlassCard(
                  gradient: AppColors.gradientPrimary,
                  child: Row(
                    children: [
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'Level ${profile?.level ?? 1}',
                              style: const TextStyle(
                                color: Colors.white,
                                fontSize: 28,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            Text(
                              '${profile?.xp ?? 0} XP earned',
                              style: TextStyle(color: Colors.white.withOpacity(0.85)),
                            ),
                          ],
                        ),
                      ),
                      Column(
                        children: [
                          Text(
                            '$earned/${achievements.length}',
                            style: const TextStyle(
                              color: Colors.white,
                              fontSize: 24,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          Text(
                            'Unlocked',
                            style: TextStyle(color: Colors.white.withOpacity(0.8), fontSize: 12),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
                loading: () => const SizedBox.shrink(),
                error: (_, __) => const SizedBox.shrink(),
              ),
              const SizedBox(height: 16),
              Text(
                'Earn XP by logging mood, chatting with Luna, and completing tasks.',
                style: TextStyle(color: AppColors.textSecondary),
              ),
              const SizedBox(height: 16),
              ...achievements.map((a) => Padding(
                    padding: const EdgeInsets.only(bottom: 10),
                    child: _AchievementTile(achievement: a),
                  )),
            ],
          );
        },
        loading: () => const Center(child: CircularProgressIndicator()),
        error: (e, _) => Center(child: Text('Error: $e')),
      ),
    );
  }
}

class _AchievementTile extends StatelessWidget {
  const _AchievementTile({required this.achievement});

  final AchievementModel achievement;

  @override
  Widget build(BuildContext context) {
    final opacity = achievement.earned ? 1.0 : 0.55;

    return Opacity(
      opacity: opacity,
      child: GlassCard(
        child: Row(
          children: [
            Container(
              width: 52,
              height: 52,
              decoration: BoxDecoration(
                color: achievement.earned
                    ? AppColors.secondary.withOpacity(0.25)
                    : AppColors.background,
                borderRadius: BorderRadius.circular(14),
              ),
              alignment: Alignment.center,
              child: Text(achievement.icon, style: const TextStyle(fontSize: 26)),
            ),
            const SizedBox(width: 14),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      Expanded(
                        child: Text(
                          achievement.title,
                          style: const TextStyle(fontWeight: FontWeight.w600, fontSize: 16),
                        ),
                      ),
                      if (achievement.earned)
                        const Icon(Icons.check_circle, color: AppColors.success, size: 20),
                    ],
                  ),
                  const SizedBox(height: 4),
                  Text(
                    achievement.description,
                    style: TextStyle(color: AppColors.textSecondary, fontSize: 13),
                  ),
                  if (!achievement.earned &&
                      achievement.progress != null &&
                      achievement.target != null) ...[
                    const SizedBox(height: 8),
                    ClipRRect(
                      borderRadius: BorderRadius.circular(4),
                      child: LinearProgressIndicator(
                        value: achievement.progress! / achievement.target!,
                        backgroundColor: AppColors.secondary.withOpacity(0.2),
                        valueColor: const AlwaysStoppedAnimation(AppColors.primary),
                        minHeight: 5,
                      ),
                    ),
                    const SizedBox(height: 4),
                    Text(
                      '${achievement.progress}/${achievement.target}',
                      style: TextStyle(fontSize: 11, color: AppColors.textSecondary),
                    ),
                  ],
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
