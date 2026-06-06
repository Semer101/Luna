import 'package:luna_ai/core/config/app_config.dart';
import 'package:luna_ai/shared/models/cycle_model.dart';
import 'package:luna_ai/shared/services/demo_storage_service.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
import 'package:uuid/uuid.dart';

class CycleRepository {
  CycleRepository({
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

  Future<CycleModel?> getCycle() async {
    if (isDemo) return _demo.getCycle();
    final data = await _client!
        .from('cycles')
        .select()
        .eq('user_id', userId)
        .maybeSingle();
    if (data == null) return null;
    return CycleModel.fromJson(data);
  }

  Future<CycleModel> upsertCycle({
    required DateTime lastPeriodDate,
    required int cycleLength,
    required int periodDuration,
  }) async {
    final cycle = CycleModel(
      id: _uuid.v4(),
      userId: userId,
      lastPeriodDate: lastPeriodDate,
      cycleLength: cycleLength,
      periodDuration: periodDuration,
      createdAt: DateTime.now(),
    );

    if (isDemo) {
      await _demo.saveCycle(cycle);
      return cycle;
    }

    final data = await _client!.from('cycles').upsert({
      'user_id': userId,
      'last_period_date': lastPeriodDate.toIso8601String().split('T').first,
      'cycle_length': cycleLength,
      'period_duration': periodDuration,
    }, onConflict: 'user_id').select().single();

    return CycleModel.fromJson(data);
  }
}
