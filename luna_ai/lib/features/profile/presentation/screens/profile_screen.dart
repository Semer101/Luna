import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:luna_ai/core/constants/app_colors.dart';
import 'package:luna_ai/core/widgets/glass_card.dart';
import 'package:luna_ai/shared/providers/auth_provider.dart';
import 'package:luna_ai/shared/providers/cycle_provider.dart';
import 'package:luna_ai/shared/providers/wellness_provider.dart';

class ProfileScreen extends ConsumerWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final profileAsync = ref.watch(profileProvider);
    final phaseAsync = ref.watch(cyclePhaseProvider);

    return Scaffold(
      appBar: AppBar(
        title: const Text('Profile'),
        actions: [
          IconButton(
            onPressed: () => context.push('/settings'),
            icon: const Icon(Icons.settings_outlined),
          ),
        ],
      ),
      body: ListView(
        padding: const EdgeInsets.all(16),
        children: [
          profileAsync.when(
            data: (profile) {
              final xp = profile?.xp ?? 0;
              final level = profile?.level ?? 1;
              final xpInLevel = xp % 100;

              return GlassCard(
                gradient: AppColors.gradientPrimary,
                child: Column(
                  children: [
                    CircleAvatar(
                      radius: 40,
                      backgroundColor: Colors.white.withOpacity(0.3),
                      child: Text(
                        (profile?.name.isNotEmpty == true ? profile!.name[0] : 'L').toUpperCase(),
                        style: const TextStyle(fontSize: 32, color: Colors.white, fontWeight: FontWeight.bold),
                      ),
                    ),
                    const SizedBox(height: 12),
                    Text(
                      profile?.name ?? 'Luna User',
                      style: const TextStyle(color: Colors.white, fontSize: 22, fontWeight: FontWeight.bold),
                    ),
                    Text(
                      profile?.email ?? '',
                      style: TextStyle(color: Colors.white.withOpacity(0.8)),
                    ),
                    const SizedBox(height: 20),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        _StatColumn('Level', '$level'),
                        _StatColumn('XP', '$xp'),
                        _StatColumn('Next', '${100 - xpInLevel} XP'),
                      ],
                    ),
                    const SizedBox(height: 12),
                    ClipRRect(
                      borderRadius: BorderRadius.circular(8),
                      child: LinearProgressIndicator(
                        value: xpInLevel / 100,
                        backgroundColor: Colors.white.withOpacity(0.3),
                        valueColor: const AlwaysStoppedAnimation(Colors.white),
                        minHeight: 8,
                      ),
                    ),
                  ],
                ),
              );
            },
            loading: () => const Center(child: CircularProgressIndicator()),
            error: (_, __) => const SizedBox.shrink(),
          ),
          const SizedBox(height: 16),
          phaseAsync.when(
            data: (phase) => phase != null
                ? GlassCard(
                    child: ListTile(
                      leading: Text(phase.phase.emoji, style: const TextStyle(fontSize: 28)),
                      title: Text('${phase.phase.label} Phase'),
                      subtitle: Text('Day ${phase.dayInCycle} · ${phase.daysUntilNextPeriod} days to next period'),
                    ),
                  )
                : const SizedBox.shrink(),
            loading: () => const SizedBox.shrink(),
            error: (_, __) => const SizedBox.shrink(),
          ),
          const SizedBox(height: 16),
          _MenuTile(
            icon: Icons.psychology_outlined,
            title: 'Wellness Twin',
            onTap: () => context.push('/wellness-twin'),
          ),
          _MenuTile(
            icon: Icons.timeline,
            title: 'Future Self Predictions',
            onTap: () => context.push('/future-self'),
          ),
          _MenuTile(
            icon: Icons.insights,
            title: 'Wellness Insights',
            onTap: () => context.push('/insights'),
          ),
          _MenuTile(
            icon: Icons.favorite_outline,
            title: 'Log Mood',
            onTap: () => context.push('/mood'),
          ),
          _MenuTile(
            icon: Icons.emoji_events_outlined,
            title: 'Achievements',
            subtitle: 'Mood Logger · Task Master · Streak Keeper',
            onTap: () => context.push('/achievements'),
          ),
          const SizedBox(height: 16),
          OutlinedButton(
            onPressed: () async {
              await ref.read(authNotifierProvider.notifier).signOut();
              if (context.mounted) context.go('/auth');
            },
            child: const Text('Sign Out'),
          ),
        ],
      ),
    );
  }
}

class _StatColumn extends StatelessWidget {
  const _StatColumn(this.label, this.value);

  final String label;
  final String value;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(value, style: const TextStyle(color: Colors.white, fontSize: 20, fontWeight: FontWeight.bold)),
        Text(label, style: TextStyle(color: Colors.white.withOpacity(0.7), fontSize: 12)),
      ],
    );
  }
}

class _MenuTile extends StatelessWidget {
  const _MenuTile({
    required this.icon,
    required this.title,
    this.subtitle,
    required this.onTap,
  });

  final IconData icon;
  final String title;
  final String? subtitle;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 8),
      child: GlassCard(
        padding: EdgeInsets.zero,
        onTap: onTap,
        child: ListTile(
          leading: Icon(icon, color: AppColors.primary),
          title: Text(title),
          subtitle: subtitle != null ? Text(subtitle!) : null,
          trailing: const Icon(Icons.chevron_right),
        ),
      ),
    );
  }
}
