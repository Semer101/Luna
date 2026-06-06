import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:luna_ai/core/constants/app_colors.dart';
import 'package:luna_ai/core/constants/app_enums.dart';
import 'package:luna_ai/core/widgets/glass_card.dart';
import 'package:luna_ai/shared/providers/wellness_provider.dart';

class MoodScreen extends ConsumerStatefulWidget {
  const MoodScreen({super.key});

  @override
  ConsumerState<MoodScreen> createState() => _MoodScreenState();
}

class _MoodScreenState extends ConsumerState<MoodScreen> {
  MoodType? _selectedMood;
  double _energy = 5;
  double _stress = 5;

  @override
  Widget build(BuildContext context) {
    final moodState = ref.watch(moodNotifierProvider);

    return Scaffold(
      appBar: AppBar(title: const Text('Log Mood')),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(24),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Text(
              'How are you feeling?',
              style: Theme.of(context).textTheme.headlineSmall?.copyWith(
                    fontWeight: FontWeight.bold,
                  ),
            ),
            const SizedBox(height: 24),
            Wrap(
              spacing: 12,
              runSpacing: 12,
              alignment: WrapAlignment.center,
              children: MoodType.values.map((mood) {
                final selected = _selectedMood == mood;
                return GestureDetector(
                  onTap: () => setState(() => _selectedMood = mood),
                  child: AnimatedContainer(
                    duration: const Duration(milliseconds: 200),
                    width: 90,
                    padding: const EdgeInsets.all(12),
                    decoration: BoxDecoration(
                      color: selected ? AppColors.primary.withOpacity(0.15) : AppColors.surface,
                      borderRadius: BorderRadius.circular(16),
                      border: Border.all(
                        color: selected ? AppColors.primary : Colors.transparent,
                        width: 2,
                      ),
                    ),
                    child: Column(
                      children: [
                        Text(mood.emoji, style: const TextStyle(fontSize: 32)),
                        const SizedBox(height: 4),
                        Text(mood.label, style: const TextStyle(fontSize: 12)),
                      ],
                    ),
                  ),
                );
              }).toList(),
            ),
            const SizedBox(height: 32),
            GlassCard(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text('Energy: ${_energy.round()}/10'),
                  Slider(
                    value: _energy,
                    min: 1,
                    max: 10,
                    divisions: 9,
                    activeColor: AppColors.success,
                    onChanged: (v) => setState(() => _energy = v),
                  ),
                  const SizedBox(height: 16),
                  Text('Stress: ${_stress.round()}/10'),
                  Slider(
                    value: _stress,
                    min: 1,
                    max: 10,
                    divisions: 9,
                    activeColor: AppColors.accent,
                    onChanged: (v) => setState(() => _stress = v),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 32),
            SizedBox(
              height: 52,
              child: ElevatedButton(
                onPressed: _selectedMood == null || moodState.isLoading
                    ? null
                    : () async {
                        await ref.read(moodNotifierProvider.notifier).logMood(
                              _selectedMood!,
                              _energy.round(),
                              _stress.round(),
                            );
                        if (mounted) {
                          ScaffoldMessenger.of(context).showSnackBar(
                            const SnackBar(content: Text('Mood logged! +15 XP')),
                          );
                          Navigator.pop(context);
                        }
                      },
                child: moodState.isLoading
                    ? const CircularProgressIndicator(color: Colors.white)
                    : const Text('Save Mood'),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
