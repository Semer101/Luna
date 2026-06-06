import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:luna_ai/shared/providers/app_providers.dart';
import 'package:luna_ai/shared/services/demo_storage_service.dart';

final authStateProvider = FutureProvider<bool>((ref) async {
  return ref.watch(authRepositoryProvider).isAuthenticated();
});

final onboardingCompleteProvider = FutureProvider<bool>((ref) async {
  final demo = ref.watch(demoStorageProvider);
  if (await demo.isOnboarded()) return true;
  final cycle = await ref.watch(cycleRepositoryProvider).getCycle();
  return cycle != null;
});

final demoStorageOnboardingProvider = Provider<DemoStorageService>(
  (ref) => ref.watch(demoStorageProvider),
);

class AuthNotifier extends StateNotifier<AsyncValue<void>> {
  AuthNotifier(this._ref) : super(const AsyncData(null));

  final Ref _ref;

  Future<void> signUp(String email, String password, String name) async {
    state = const AsyncLoading();
    state = await AsyncValue.guard(() async {
      await _ref.read(authRepositoryProvider).signUp(
            email: email,
            password: password,
            name: name,
          );
      _ref.invalidate(authStateProvider);
    });
  }

  Future<void> signIn(String email, String password) async {
    state = const AsyncLoading();
    state = await AsyncValue.guard(() async {
      await _ref.read(authRepositoryProvider).signIn(
            email: email,
            password: password,
          );
      _ref.invalidate(authStateProvider);
    });
  }

  Future<void> signOut() async {
    await _ref.read(authRepositoryProvider).signOut();
    _ref.invalidate(authStateProvider);
  }

  Future<void> resetPassword(String email) async {
    state = const AsyncLoading();
    state = await AsyncValue.guard(() async {
      await _ref.read(authRepositoryProvider).resetPassword(email);
    });
  }
}

final authNotifierProvider =
    StateNotifierProvider<AuthNotifier, AsyncValue<void>>((ref) {
  return AuthNotifier(ref);
});
