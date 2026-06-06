import 'package:luna_ai/core/config/app_config.dart';
import 'package:luna_ai/shared/models/profile_model.dart';
import 'package:luna_ai/shared/services/demo_storage_service.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
import 'package:uuid/uuid.dart';

class AuthRepository {
  AuthRepository({
    SupabaseClient? client,
    DemoStorageService? demoStorage,
  })  : _client = client,
        _demo = demoStorage ?? DemoStorageService();

  final SupabaseClient? _client;
  final DemoStorageService _demo;
  final _uuid = const Uuid();

  bool get isDemo => AppConfig.isDemoMode || _client == null;

  Stream<AuthState> get authStateChanges {
    if (isDemo) {
      return Stream.periodic(
        const Duration(seconds: 1),
        (_) => AuthState(
          AuthChangeEvent.signedIn,
          _demoSession(),
        ),
      ).take(1);
    }
    return _client!.auth.onAuthStateChange;
  }

  User? get currentUser => isDemo ? _demoUser() : _client?.auth.currentUser;

  Future<void> signUp({
    required String email,
    required String password,
    required String name,
  }) async {
    if (isDemo) {
      await _demo.setLoggedIn(true);
      await _demo.saveProfile(ProfileModel(
        id: 'demo-user',
        name: name,
        email: email,
      ));
      return;
    }
    await _client!.auth.signUp(
      email: email,
      password: password,
      data: {'name': name},
    );
  }

  Future<void> signIn({
    required String email,
    required String password,
  }) async {
    if (isDemo) {
      await _demo.setLoggedIn(true);
      final profile = await _demo.getProfile();
      if (profile == null) {
        await _demo.saveProfile(ProfileModel(
          id: 'demo-user',
          name: email.split('@').first,
          email: email,
        ));
      }
      return;
    }
    await _client!.auth.signInWithPassword(email: email, password: password);
  }

  Future<void> resetPassword(String email) async {
    if (isDemo) return;
    await _client!.auth.resetPasswordForEmail(email);
  }

  Future<void> signOut() async {
    if (isDemo) {
      await _demo.setLoggedIn(false);
      return;
    }
    await _client!.auth.signOut();
  }

  Future<bool> isAuthenticated() async {
    if (isDemo) return _demo.isLoggedIn();
    return _client?.auth.currentUser != null;
  }

  String get userId => currentUser?.id ?? 'demo-user';

  Session? _demoSession() => Session(
        accessToken: 'demo',
        tokenType: 'bearer',
        user: _demoUser()!,
      );

  User? _demoUser() => User(
        id: 'demo-user',
        appMetadata: {},
        userMetadata: {'name': 'Demo User'},
        aud: 'authenticated',
        createdAt: DateTime.now().toIso8601String(),
      );
}
