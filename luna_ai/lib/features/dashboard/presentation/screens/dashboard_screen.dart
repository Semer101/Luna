import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:luna_ai/core/constants/app_colors.dart';
import 'package:luna_ai/core/widgets/glass_card.dart';
import 'package:luna_ai/core/widgets/phase_badge.dart';
import 'package:luna_ai/core/widgets/wellness_score_ring.dart';
import 'package:luna_ai/shared/providers/cycle_provider.dart';
import 'package:luna_ai/shared/providers/wellness_provider.dart';

class DashboardScreen extends ConsumerWidget {
  const DashboardScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final phaseAsync = ref.watch(cyclePhaseProvider);
    final scoreAsync = ref.watch(wellnessScoreProvider);
    final predictionsAsync = ref.watch(predictionsProvider);
    final twinAsync = ref.watch(wellnessTwinProvider);
    final profileAsync = ref.watch(profileProvider);

    return Scaffold(
      body: SafeArea(
        child: RefreshIndicator(
          onRefresh: () async {
            ref.invalidate(cyclePhaseProvider);
            ref.invalidate(wellnessScoreProvider);
            ref.invalidate(predictionsProvider);
          },
          child: CustomScrollView(
            slivers: [
              SliverToBoxAdapter(
                child: Padding(
                  padding: const EdgeInsets.fromLTRB(24, 16, 24, 0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Good ${_greeting()}',
                            style: TextStyle(color: AppColors.textSecondary),
                          ),
                          profileAsync.when(
                            data: (p) => Text(
                              p?.name.isNotEmpty == true ? p!.name : 'there',
                              style: Theme.of(context).textTheme.headlineSmall?.copyWith(
                                    fontWeight: FontWeight.bold,
                                  ),
                            ),
                            loading: () => const Text('...'),
                            error: (_, __) => const Text('there'),
                          ),
                        ],
                      ),
                      IconButton(
                        onPressed: () => context.push('/notifications'),
                        icon: const Icon(Icons.notifications_outlined),
                      ),
                      IconButton(
                        onPressed: () => context.push('/settings'),
                        icon: const Icon(Icons.settings_outlined),
                      ),
                    ],
                  ),
                ),
              ),
              SliverPadding(
                padding: const EdgeInsets.all(24),
                sliver: SliverList(
                  delegate: SliverChildListDelegate([
                    phaseAsync.when(
                      data: (phase) => phase != null
                          ? GlassCard(
                              gradient: AppColors.gradientPrimary,
                              child: Row(
                                children: [
                                  Expanded(
                                    child: Column(
                                      crossAxisAlignment: CrossAxisAlignment.start,
                                      children: [
                                        const Text(
                                          'Current Phase',
                                          style: TextStyle(color: Colors.white70),
                                        ),
                                        const SizedBox(height: 8),
                                        Text(
                                          '${phase.phase.emoji} ${phase.phase.label}',
                                          style: const TextStyle(
                                            color: Colors.white,
                                            fontSize: 24,
                                            fontWeight: FontWeight.bold,
                                          ),
                                        ),
                                        const SizedBox(height: 4),
                                        Text(
                                          'Day ${phase.dayInCycle} of cycle',
                                          style: const TextStyle(color: Colors.white70),
                                        ),
                                      ],
                                    ),
                                  ),
                                  PhaseBadge(phase: phase.phase, compact: true),
                                ],
                              ),
                            ).animate().fadeIn().slideY(begin: 0.1)
                          : const SizedBox.shrink(),
                      loading: () => const Center(child: CircularProgressIndicator()),
                      error: (_, __) => const SizedBox.shrink(),
                    ),
                    const SizedBox(height: 16),
                    Row(
                      children: [
                        Expanded(
                          child: scoreAsync.when(
                            data: (score) => GlassCard(
                              child: Column(
                                children: [
                                  WellnessScoreRing(score: score.score),
                                  const SizedBox(height: 8),
                                  const Text('Wellness Score', style: TextStyle(fontWeight: FontWeight.w600)),
                                ],
                              ),
                            ),
                            loading: () => const GlassCard(child: CircularProgressIndicator()),
                            error: (_, __) => const SizedBox.shrink(),
                          ),
                        ),
                        const SizedBox(width: 16),
                        Expanded(
                          child: predictionsAsync.when(
                            data: (predictions) {
                              final next = predictions.isNotEmpty ? predictions.first : null;
                              return GlassCard(
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    const Text('Predicted', style: TextStyle(color: AppColors.textSecondary)),
                                    const SizedBox(height: 12),
                                    _metricRow('Energy', next?.predictedEnergy ?? 5, AppColors.success),
                                    _metricRow('Stress', next?.predictedStress ?? 5, AppColors.accent),
                                  ],
                                ),
                              );
                            },
                            loading: () => const GlassCard(child: CircularProgressIndicator()),
                            error: (_, __) => const SizedBox.shrink(),
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 16),
                    twinAsync.when(
                      data: (insights) {
                        if (insights.isEmpty) return const SizedBox.shrink();
                        final insight = insights.last;
                        return GlassCard(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Row(
                                children: [
                                  const Icon(Icons.lightbulb_outline, color: AppColors.primary),
                                  const SizedBox(width: 8),
                                  Text(
                                    'AI Insight',
                                    style: Theme.of(context).textTheme.titleMedium?.copyWith(
                                          fontWeight: FontWeight.w600,
                                        ),
                                  ),
                                ],
                              ),
                              const SizedBox(height: 12),
                              Text(insight.description),
                            ],
                          ),
                        );
                      },
                      loading: () => const SizedBox.shrink(),
                      error: (_, __) => const SizedBox.shrink(),
                    ),
                    const SizedBox(height: 16),
                    predictionsAsync.when(
                      data: (predictions) {
                        if (predictions.isEmpty) return const SizedBox.shrink();
                        return GlassCard(
                          onTap: () => context.push('/future-self'),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(
                                    'Future Self',
                                    style: Theme.of(context).textTheme.titleMedium?.copyWith(
                                          fontWeight: FontWeight.w600,
                                        ),
                                  ),
                                  const Icon(Icons.arrow_forward_ios, size: 16),
                                ],
                              ),
                              const SizedBox(height: 8),
                              Text(
                                predictions.first.explanation,
                                style: TextStyle(color: AppColors.textSecondary),
                              ),
                            ],
                          ),
                        );
                      },
                      loading: () => const SizedBox.shrink(),
                      error: (_, __) => const SizedBox.shrink(),
                    ),
                    const SizedBox(height: 24),
                    Text(
                      'Quick Actions',
                      style: Theme.of(context).textTheme.titleMedium?.copyWith(
                            fontWeight: FontWeight.w600,
                          ),
                    ),
                    const SizedBox(height: 12),
                    _QuickActionsGrid(),
                  ]),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  String _greeting() {
    final hour = DateTime.now().hour;
    if (hour < 12) return 'morning';
    if (hour < 17) return 'afternoon';
    return 'evening';
  }

  Widget _metricRow(String label, int value, Color color) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 4),
      child: Row(
        children: [
          Text(label, style: const TextStyle(fontSize: 13)),
          const Spacer(),
          Text('$value/10', style: TextStyle(fontWeight: FontWeight.bold, color: color)),
        ],
      ),
    );
  }
}

class _QuickActionsGrid extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final actions = [
      ('Log Mood', Icons.favorite_outline, '/mood', AppColors.accent),
      ('AI Copilot', Icons.auto_awesome, '/copilot', AppColors.primary),
      ('Voice', Icons.mic, '/voice', AppColors.secondary),
      ('Suggestions', Icons.pending_actions, '/suggestions', AppColors.warning),
      ('Wellness Twin', Icons.psychology_outlined, '/wellness-twin', AppColors.primary),
      ('Insights', Icons.insights, '/insights', AppColors.success),
    ];

    return GridView.count(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      crossAxisCount: 2,
      mainAxisSpacing: 12,
      crossAxisSpacing: 12,
      childAspectRatio: 1.55,
      children: actions.map((a) {
        return GlassCard(
          onTap: () => context.push(a.$3),
          padding: const EdgeInsets.all(16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(a.$2, color: a.$4),
              const SizedBox(height: 8),
              Text(a.$1, style: const TextStyle(fontWeight: FontWeight.w600)),
            ],
          ),
        );
      }).toList(),
    );
  }
}
