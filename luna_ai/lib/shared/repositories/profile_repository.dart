import 'package:luna_ai/core/config/app_config.dart';
import 'package:luna_ai/shared/models/profile_model.dart';
import 'package:luna_ai/shared/services/demo_storage_service.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class ProfileRepository {
  ProfileRepository({
    SupabaseClient? client,
    DemoStorageService? demoStorage,
    required this.userId,
  })  : _client = client,
        _demo = demoStorage ?? DemoStorageService();

  final SupabaseClient? _client;
  final DemoStorageService _demo;
  final String userId;

  bool get isDemo => AppConfig.isDemoMode || _client == null;

  Future<ProfileModel?> getProfile() async {
    if (isDemo) return _demo.getProfile();
    final data = await _client!
        .from('profiles')
        .select()
        .eq('id', userId)
        .maybeSingle();
    if (data == null) return null;
    return ProfileModel.fromJson(data);
  }

  Future<void> updateProfile({
    String? name,
    List<String>? wellnessGoals,
    int? xp,
    int? level,
  }) async {
    if (isDemo) {
      final profile = await _demo.getProfile();
      if (profile == null) return;
      await _demo.saveProfile(profile.copyWith(
        name: name ?? profile.name,
        wellnessGoals: wellnessGoals ?? profile.wellnessGoals,
        xp: xp ?? profile.xp,
        level: level ?? profile.level,
      ));
      return;
    }

    final updates = <String, dynamic>{};
    if (name != null) updates['name'] = name;
    if (wellnessGoals != null) updates['wellness_goals'] = wellnessGoals;
    if (xp != null) updates['xp'] = xp;
    if (level != null) updates['level'] = level;
    if (updates.isNotEmpty) {
      await _client!.from('profiles').update(updates).eq('id', userId);
    }
  }

  Future<void> addXp(int amount) async {
    final profile = await getProfile();
    if (profile == null) return;
    final newXp = profile.xp + amount;
    final newLevel = (newXp / 100).floor() + 1;
    await updateProfile(xp: newXp, level: newLevel);
  }
}
