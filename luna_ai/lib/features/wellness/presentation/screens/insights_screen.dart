import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:intl/intl.dart';
import 'package:luna_ai/core/constants/app_colors.dart';
import 'package:luna_ai/core/widgets/glass_card.dart';
import 'package:luna_ai/core/widgets/wellness_score_ring.dart';
import 'package:luna_ai/shared/providers/wellness_provider.dart';

class InsightsScreen extends ConsumerWidget {
  const InsightsScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final scoreAsync = ref.watch(wellnessScoreProvider);
    final journalAsync = ref.watch(journalProvider);

    return Scaffold(
      appBar: AppBar(title: const Text('Wellness Insights')),
      body: ListView(
        padding: const EdgeInsets.all(16),
        children: [
          scoreAsync.when(
            data: (score) => GlassCard(
              child: Row(
                children: [
                  WellnessScoreRing(score: score.score, size: 100),
                  const SizedBox(width: 24),
                  Expanded(
                    child: Column(
                      children: [
                        _ScoreRow('Sleep', score.sleep),
                        _ScoreRow('Mood', score.moodScore),
                        _ScoreRow('Stress', score.stressScore),
                        _ScoreRow('Activity', score.activity),
                        _ScoreRow('Hydration', score.hydration),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            loading: () => const Center(child: CircularProgressIndicator()),
            error: (_, __) => const SizedBox.shrink(),
          ),
          const SizedBox(height: 16),
          Text(
            'Invisible Journal Timeline',
            style: Theme.of(context).textTheme.titleMedium?.copyWith(fontWeight: FontWeight.w600),
          ),
          const SizedBox(height: 8),
          Text(
            'Mood insights extracted from your conversations',
            style: TextStyle(color: AppColors.textSecondary, fontSize: 13),
          ),
          const SizedBox(height: 12),
          journalAsync.when(
            data: (entries) {
              if (entries.isEmpty) {
                return GlassCard(
                  child: Text(
                    'Chat with Luna to automatically track your emotional wellness',
                    style: TextStyle(color: AppColors.textSecondary),
                  ),
                );
              }
              return Column(
                children: entries.map((e) {
                  return Padding(
                    padding: const EdgeInsets.only(bottom: 8),
                    child: GlassCard(
                      padding: const EdgeInsets.all(16),
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          if (e.mood != null) Text(_moodEmoji(e.mood!), style: const TextStyle(fontSize: 24)),
                          const SizedBox(width: 12),
                          Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(e.message, maxLines: 2, overflow: TextOverflow.ellipsis),
                                const SizedBox(height: 4),
                                Text(
                                  e.createdAt != null
                                      ? DateFormat.MMMd().add_jm().format(e.createdAt!)
                                      : '',
                                  style: TextStyle(fontSize: 12, color: AppColors.textSecondary),
                                ),
                                if (e.energy != null)
                                  Text(
                                    'Energy ${e.energy} · Stress ${e.stress ?? "-"}',
                                    style: TextStyle(fontSize: 12, color: AppColors.textSecondary),
                                  ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  );
                }).toList(),
              );
            },
            loading: () => const CircularProgressIndicator(),
            error: (_, __) => const SizedBox.shrink(),
          ),
        ],
      ),
    );
  }

  String _moodEmoji(String mood) => switch (mood) {
        'happy' => '😊',
        'calm' => '😌',
        'anxious' => '😰',
        'stressed' => '😣',
        'sad' => '😢',
        'energetic' => '⚡',
        _ => '😐',
      };
}

class _ScoreRow extends StatelessWidget {
  const _ScoreRow(this.label, this.value);

  final String label;
  final int value;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 4),
      child: Row(
        children: [
          SizedBox(width: 70, child: Text(label, style: const TextStyle(fontSize: 13))),
          Expanded(
            child: ClipRRect(
              borderRadius: BorderRadius.circular(4),
              child: LinearProgressIndicator(
                value: value / 100,
                backgroundColor: AppColors.secondary.withOpacity(0.2),
                valueColor: const AlwaysStoppedAnimation(AppColors.primary),
                minHeight: 6,
              ),
            ),
          ),
          const SizedBox(width: 8),
          Text('$value', style: const TextStyle(fontSize: 12, fontWeight: FontWeight.w600)),
        ],
      ),
    );
  }
}
