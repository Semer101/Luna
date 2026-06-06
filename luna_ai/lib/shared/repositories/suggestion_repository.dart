import 'package:luna_ai/core/config/app_config.dart';
import 'package:luna_ai/core/constants/app_enums.dart';
import 'package:luna_ai/shared/models/ai_suggestion_model.dart';
import 'package:luna_ai/shared/services/demo_storage_service.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
import 'package:uuid/uuid.dart';

class SuggestionRepository {
  SuggestionRepository({
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

  Future<List<AiSuggestionModel>> getPending() async {
    final all = await _getAll();
    return all.where((s) => s.status == SuggestionStatus.pending).toList();
  }

  Future<List<AiSuggestionModel>> _getAll() async {
    if (isDemo) return _demo.getSuggestions();
    final data = await _client!
        .from('ai_suggestions')
        .select()
        .eq('user_id', userId)
        .order('created_at', ascending: false);
    return (data as List).map((e) => AiSuggestionModel.fromJson(e)).toList();
  }

  Future<void> addSuggestions(List<AiSuggestionModel> suggestions) async {
    if (isDemo) {
      final existing = await _demo.getSuggestions();
      existing.insertAll(0, suggestions);
      await _demo.saveSuggestions(existing);
      return;
    }
    await _client!.from('ai_suggestions').insert(
          suggestions
              .map((s) => {
                    'user_id': userId,
                    'title': s.title,
                    'description': s.description,
                    'priority': s.priority.name,
                    'reasoning': s.reasoning,
                    'suggested_date': s.suggestedDate?.toIso8601String(),
                    'status': 'pending',
                  })
              .toList(),
        );
  }

  Future<void> updateStatus(String id, SuggestionStatus status) async {
    if (isDemo) {
      final suggestions = await _demo.getSuggestions();
      final index = suggestions.indexWhere((s) => s.id == id);
      if (index >= 0) {
        suggestions[index] = suggestions[index].copyWith(status: status);
        await _demo.saveSuggestions(suggestions);
      }
      return;
    }
    await _client!
        .from('ai_suggestions')
        .update({'status': status.name})
        .eq('id', id);
  }

  Future<void> updateSuggestion(AiSuggestionModel suggestion) async {
    if (isDemo) {
      final suggestions = await _demo.getSuggestions();
      final index = suggestions.indexWhere((s) => s.id == suggestion.id);
      if (index >= 0) {
        suggestions[index] = suggestion;
        await _demo.saveSuggestions(suggestions);
      }
      return;
    }
    await _client!.from('ai_suggestions').update({
      'title': suggestion.title,
      'description': suggestion.description,
      'priority': suggestion.priority.name,
      'reasoning': suggestion.reasoning,
      'suggested_date': suggestion.suggestedDate?.toIso8601String(),
    }).eq('id', suggestion.id);
  }
}
