import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:luna_ai/core/constants/app_colors.dart';
import 'package:luna_ai/core/widgets/glass_card.dart';
import 'package:luna_ai/shared/providers/wellness_provider.dart';

class WellnessTwinScreen extends ConsumerWidget {
  const WellnessTwinScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final insightsAsync = ref.watch(wellnessTwinProvider);
    final moodsAsync = ref.watch(moodsProvider);

    return Scaffold(
      appBar: AppBar(title: const Text('Wellness Twin')),
      body: insightsAsync.when(
        data: (insights) => ListView(
          padding: const EdgeInsets.all(16),
          children: [
            GlassCard(
              gradient: AppColors.gradientPrimary,
              child: Column(
                children: [
                  const Icon(Icons.psychology, color: Colors.white, size: 48),
                  const SizedBox(height: 12),
                  const Text(
                    'Your Wellness Twin',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 22,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 8),
                  Text(
                    'Personalized insights from your cycle & mood data',
                    style: TextStyle(color: Colors.white.withOpacity(0.8)),
                    textAlign: TextAlign.center,
                  ),
                ],
              ),
            ),
            const SizedBox(height: 16),
            ...insights.map((insight) => Padding(
                  padding: const EdgeInsets.only(bottom: 12),
                  child: GlassCard(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          children: [
                            _categoryIcon(insight.category),
                            const SizedBox(width: 8),
                            Expanded(
                              child: Text(
                                insight.title,
                                style: const TextStyle(
                                  fontWeight: FontWeight.w600,
                                  fontSize: 16,
                                ),
                              ),
                            ),
                            Text(
                              '${(insight.confidence * 100).round()}%',
                              style: TextStyle(
                                fontSize: 12,
                                color: AppColors.textSecondary,
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(height: 8),
                        Text(
                          insight.description,
                          style: TextStyle(color: AppColors.textSecondary, height: 1.4),
                        ),
                      ],
                    ),
                  ),
                )),
            moodsAsync.when(
              data: (moods) {
                if (moods.isEmpty) return const SizedBox.shrink();
                return GlassCard(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text('Mood History', style: TextStyle(fontWeight: FontWeight.w600)),
                      const SizedBox(height: 12),
                      ...moods.take(5).map((m) => Padding(
                            padding: const EdgeInsets.symmetric(vertical: 4),
                            child: Row(
                              children: [
                                Text(m.mood.emoji),
                                const SizedBox(width: 8),
                                Text('Energy ${m.energy} · Stress ${m.stress}'),
                              ],
                            ),
                          )),
                    ],
                  ),
                );
              },
              loading: () => const SizedBox.shrink(),
              error: (_, __) => const SizedBox.shrink(),
            ),
          ],
        ),
        loading: () => const Center(child: CircularProgressIndicator()),
        error: (e, _) => Center(child: Text('Error: $e')),
      ),
    );
  }

  Icon _categoryIcon(String category) => switch (category) {
        'cycle' => const Icon(Icons.loop, color: AppColors.primary, size: 20),
        'energy' => const Icon(Icons.bolt, color: AppColors.success, size: 20),
        'stress' => const Icon(Icons.spa, color: AppColors.accent, size: 20),
        _ => const Icon(Icons.lightbulb_outline, color: AppColors.warning, size: 20),
      };
}
