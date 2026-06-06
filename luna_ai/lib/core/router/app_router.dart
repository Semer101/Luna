import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:luna_ai/features/auth/presentation/screens/auth_screen.dart';
import 'package:luna_ai/features/copilot/presentation/screens/copilot_screen.dart';
import 'package:luna_ai/features/copilot/presentation/screens/voice_screen.dart';
import 'package:luna_ai/features/dashboard/presentation/screens/dashboard_screen.dart';
import 'package:luna_ai/features/mood/presentation/screens/mood_screen.dart';
import 'package:luna_ai/features/notifications/presentation/screens/notifications_screen.dart';
import 'package:luna_ai/features/onboarding/presentation/screens/onboarding_screen.dart';
import 'package:luna_ai/features/profile/presentation/screens/achievements_screen.dart';
import 'package:luna_ai/features/profile/presentation/screens/profile_screen.dart';
import 'package:luna_ai/features/settings/presentation/screens/settings_screen.dart';
import 'package:luna_ai/features/shell/presentation/screens/main_shell.dart';
import 'package:luna_ai/features/splash/presentation/screens/splash_screen.dart';
import 'package:luna_ai/features/suggestions/presentation/screens/suggestions_screen.dart';
import 'package:luna_ai/features/tasks/presentation/screens/tasks_screen.dart';
import 'package:luna_ai/features/wellness/presentation/screens/future_self_screen.dart';
import 'package:luna_ai/features/wellness/presentation/screens/insights_screen.dart';
import 'package:luna_ai/features/wellness/presentation/screens/wellness_twin_screen.dart';
import 'package:luna_ai/shared/providers/auth_provider.dart';

final _rootNavigatorKey = GlobalKey<NavigatorState>();
final _shellNavigatorKey = GlobalKey<NavigatorState>();

final routerProvider = Provider<GoRouter>((ref) {
  return GoRouter(
    navigatorKey: _rootNavigatorKey,
    initialLocation: '/splash',
    redirect: (context, state) async {
      final isSplash = state.matchedLocation == '/splash';
      if (isSplash) return null;

      final isAuth = state.matchedLocation.startsWith('/auth');
      final isOnboarding = state.matchedLocation == '/onboarding';

      final authenticated = await ref.read(authStateProvider.future);
      if (!authenticated && !isAuth) return '/auth';
      if (authenticated && isAuth) {
        final onboarded = await ref.read(onboardingCompleteProvider.future);
        return onboarded ? '/home' : '/onboarding';
      }
      if (authenticated && !isOnboarding && !isAuth) {
        final onboarded = await ref.read(onboardingCompleteProvider.future);
        if (!onboarded) return '/onboarding';
      }
      return null;
    },
    routes: [
      GoRoute(
        path: '/splash',
        builder: (_, __) => const SplashScreen(),
      ),
      GoRoute(
        path: '/auth',
        builder: (_, __) => const AuthScreen(),
      ),
      GoRoute(
        path: '/onboarding',
        builder: (_, __) => const OnboardingScreen(),
      ),
      ShellRoute(
        navigatorKey: _shellNavigatorKey,
        builder: (_, __, child) => MainShell(child: child),
        routes: [
          GoRoute(
            path: '/home',
            builder: (_, __) => const DashboardScreen(),
          ),
          GoRoute(
            path: '/copilot',
            builder: (_, __) => const CopilotScreen(),
          ),
          GoRoute(
            path: '/tasks',
            builder: (_, __) => const TasksScreen(),
          ),
          GoRoute(
            path: '/profile',
            builder: (_, __) => const ProfileScreen(),
          ),
        ],
      ),
      GoRoute(
        path: '/mood',
        builder: (_, __) => const MoodScreen(),
      ),
      GoRoute(
        path: '/suggestions',
        builder: (_, __) => const SuggestionsScreen(),
      ),
      GoRoute(
        path: '/voice',
        builder: (_, __) => const VoiceScreen(),
      ),
      GoRoute(
        path: '/wellness-twin',
        builder: (_, __) => const WellnessTwinScreen(),
      ),
      GoRoute(
        path: '/future-self',
        builder: (_, __) => const FutureSelfScreen(),
      ),
      GoRoute(
        path: '/insights',
        builder: (_, __) => const InsightsScreen(),
      ),
      GoRoute(
        path: '/achievements',
        builder: (_, __) => const AchievementsScreen(),
      ),
      GoRoute(
        path: '/settings',
        builder: (_, __) => const SettingsScreen(),
      ),
      GoRoute(
        path: '/notifications',
        builder: (_, __) => const NotificationsScreen(),
      ),
    ],
  );
});
