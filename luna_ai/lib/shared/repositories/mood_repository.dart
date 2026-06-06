import 'package:luna_ai/core/config/app_config.dart';
import 'package:luna_ai/core/constants/app_enums.dart';
import 'package:luna_ai/shared/models/mood_model.dart';
import 'package:luna_ai/shared/services/demo_storage_service.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
import 'package:uuid/uuid.dart';

class MoodRepository {
  MoodRepository({
    SupabaseClient? client,
    DemoStorageService? demoStorage,
    required this.userId,
  })  : _client = client,
        _demo = demoStorage ?? DemoStorageService();

  final SupabaseClient? _client;
  final DemoStorageService _demo;
  final String userId;
  final _uuid = const Uuid();

  bool get isDemo => AppConfig.isDemoMode || _client == null;

  Future<List<MoodModel>> getMoods({int limit = 30}) async {
    if (isDemo) {
      final moods = await _demo.getMoods();
      moods.sort((a, b) => (b.createdAt ?? DateTime.now())
          .compareTo(a.createdAt ?? DateTime.now()));
      return moods.take(limit).toList();
    }
    final data = await _client!
        .from('moods')
        .select()
        .eq('user_id', userId)
        .order('created_at', ascending: false)
        .limit(limit);
    return (data as List).map((e) => MoodModel.fromJson(e)).toList();
  }

  Future<MoodModel> logMood({
    required MoodType mood,
    required int energy,
    required int stress,
    String source = 'manual',
  }) async {
    final entry = MoodModel(
      id: _uuid.v4(),
      userId: userId,
      mood: mood,
      energy: energy,
      stress: stress,
      source: source,
      createdAt: DateTime.now(),
    );

    if (isDemo) {
      final moods = await _demo.getMoods();
      moods.insert(0, entry);
      await _demo.saveMoods(moods);
      return entry;
    }

    final data = await _client!.from('moods').insert({
      'user_id': userId,
      'mood': mood.name,
      'energy': energy,
      'stress': stress,
      'source': source,
    }).select().single();

    return MoodModel.fromJson(data);
  }
}
