import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:luna_ai/core/constants/app_colors.dart';
import 'package:luna_ai/shared/providers/app_providers.dart';
import 'package:luna_ai/shared/providers/cycle_provider.dart';
import 'package:luna_ai/shared/providers/wellness_provider.dart';

class OnboardingScreen extends ConsumerStatefulWidget {
  const OnboardingScreen({super.key});

  @override
  ConsumerState<OnboardingScreen> createState() => _OnboardingScreenState();
}

class _OnboardingScreenState extends ConsumerState<OnboardingScreen> {
  final _pageController = PageController();
  int _currentPage = 0;

  DateTime _lastPeriodDate = DateTime.now().subtract(const Duration(days: 7));
  int _cycleLength = 28;
  int _periodDuration = 5;
  final Set<String> _selectedGoals = {};

  static const _goals = [
    'Better sleep',
    'Reduce stress',
    'Stay active',
    'Eat healthier',
    'Track mood',
    'Boost energy',
  ];

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  Future<void> _complete() async {
    await ref.read(cycleNotifierProvider.notifier).saveCycle(
          lastPeriodDate: _lastPeriodDate,
          cycleLength: _cycleLength,
          periodDuration: _periodDuration,
        );
    if (_selectedGoals.isNotEmpty) {
      await ref.read(profileRepositoryProvider).updateProfile(
            wellnessGoals: _selectedGoals.toList(),
          );
      ref.invalidate(profileProvider);
    }
    if (mounted) context.go('/home');
  }

  @override
  Widget build(BuildContext context) {
    final cycleState = ref.watch(cycleNotifierProvider);

    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(24),
              child: Row(
                children: List.generate(3, (i) {
                  return Expanded(
                    child: Container(
                      height: 4,
                      margin: const EdgeInsets.symmetric(horizontal: 4),
                      decoration: BoxDecoration(
                        color: i <= _currentPage
                            ? AppColors.primary
                            : AppColors.secondary.withOpacity(0.3),
                        borderRadius: BorderRadius.circular(2),
                      ),
                    ),
                  );
                }),
              ),
            ),
            Expanded(
              child: PageView(
                controller: _pageController,
                onPageChanged: (i) => setState(() => _currentPage = i),
                children: [
                  _buildWelcome(),
                  _buildCycleSetup(),
                  _buildGoals(),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(24),
              child: SizedBox(
                width: double.infinity,
                height: 52,
                child: ElevatedButton(
                  onPressed: cycleState.isLoading
                      ? null
                      : () {
                          if (_currentPage < 2) {
                            _pageController.nextPage(
                              duration: const Duration(milliseconds: 300),
                              curve: Curves.easeInOut,
                            );
                          } else {
                            _complete();
                          }
                        },
                  child: cycleState.isLoading
                      ? const CircularProgressIndicator(color: Colors.white)
                      : Text(_currentPage < 2 ? 'Continue' : 'Get Started'),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildWelcome() {
    return Padding(
      padding: const EdgeInsets.all(24),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Icon(Icons.nightlight_round, size: 80, color: AppColors.primary),
          const SizedBox(height: 24),
          Text(
            'Welcome to Luna AI',
            style: Theme.of(context).textTheme.headlineMedium?.copyWith(
                  fontWeight: FontWeight.bold,
                ),
            textAlign: TextAlign.center,
          ),
          const SizedBox(height: 16),
          Text(
            'Your AI wellness copilot that understands your cycle and helps you thrive every day.',
            style: TextStyle(color: AppColors.textSecondary, fontSize: 16),
            textAlign: TextAlign.center,
          ),
        ],
      ),
    );
  }

  Widget _buildCycleSetup() {
    return Padding(
      padding: const EdgeInsets.all(24),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Your Cycle',
            style: Theme.of(context).textTheme.headlineSmall?.copyWith(
                  fontWeight: FontWeight.bold,
                ),
          ),
          const SizedBox(height: 8),
          Text('Help Luna understand your rhythm', style: TextStyle(color: AppColors.textSecondary)),
          const SizedBox(height: 32),
          ListTile(
            contentPadding: EdgeInsets.zero,
            title: const Text('Last period date'),
            subtitle: Text(
              '${_lastPeriodDate.month}/${_lastPeriodDate.day}/${_lastPeriodDate.year}',
            ),
            trailing: const Icon(Icons.calendar_today),
            onTap: () async {
              final date = await showDatePicker(
                context: context,
                initialDate: _lastPeriodDate,
                firstDate: DateTime.now().subtract(const Duration(days: 90)),
                lastDate: DateTime.now(),
              );
              if (date != null) setState(() => _lastPeriodDate = date);
            },
          ),
          const SizedBox(height: 24),
          Text('Cycle length: $_cycleLength days'),
          Slider(
            value: _cycleLength.toDouble(),
            min: 21,
            max: 35,
            divisions: 14,
            activeColor: AppColors.primary,
            onChanged: (v) => setState(() => _cycleLength = v.round()),
          ),
          const SizedBox(height: 16),
          Text('Period duration: $_periodDuration days'),
          Slider(
            value: _periodDuration.toDouble(),
            min: 3,
            max: 8,
            divisions: 5,
            activeColor: AppColors.primary,
            onChanged: (v) => setState(() => _periodDuration = v.round()),
          ),
        ],
      ),
    );
  }

  Widget _buildGoals() {
    return Padding(
      padding: const EdgeInsets.all(24),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Wellness Goals',
            style: Theme.of(context).textTheme.headlineSmall?.copyWith(
                  fontWeight: FontWeight.bold,
                ),
          ),
          const SizedBox(height: 8),
          Text('Select what matters most to you', style: TextStyle(color: AppColors.textSecondary)),
          const SizedBox(height: 24),
          Wrap(
            spacing: 8,
            runSpacing: 8,
            children: _goals.map((goal) {
              final selected = _selectedGoals.contains(goal);
              return FilterChip(
                label: Text(goal),
                selected: selected,
                onSelected: (v) {
                  setState(() {
                    if (v) {
                      _selectedGoals.add(goal);
                    } else {
                      _selectedGoals.remove(goal);
                    }
                  });
                },
                selectedColor: AppColors.secondary.withOpacity(0.4),
                checkmarkColor: AppColors.primary,
              );
            }).toList(),
          ),
        ],
      ),
    );
  }
}
