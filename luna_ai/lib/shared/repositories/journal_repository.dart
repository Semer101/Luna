import 'package:luna_ai/core/config/app_config.dart';
import 'package:luna_ai/shared/models/wellness_model.dart';
import 'package:luna_ai/shared/services/demo_storage_service.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
import 'package:uuid/uuid.dart';

class JournalRepository {
  JournalRepository({
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

  Future<List<JournalEntryModel>> getEntries({int limit = 50}) async {
    if (isDemo) {
      final entries = await _demo.getJournal();
      return entries.take(limit).toList();
    }
    final data = await _client!
        .from('journal_entries')
        .select()
        .eq('user_id', userId)
        .order('created_at', ascending: false)
        .limit(limit);
    return (data as List).map((e) => JournalEntryModel.fromJson(e)).toList();
  }

  Future<void> addEntry(JournalEntryModel entry) async {
    if (isDemo) {
      final entries = await _demo.getJournal();
      entries.insert(0, entry);
      await _demo.saveJournal(entries);
      return;
    }
    await _client!.from('journal_entries').insert({
      'user_id': userId,
      'mood': entry.mood,
      'energy': entry.energy,
      'stress': entry.stress,
      'message': entry.message,
    });
  }
}
