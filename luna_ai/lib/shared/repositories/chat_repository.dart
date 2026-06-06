import 'package:luna_ai/core/config/app_config.dart';
import 'package:luna_ai/shared/models/wellness_model.dart';
import 'package:luna_ai/shared/services/demo_storage_service.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
import 'package:uuid/uuid.dart';

class ChatRepository {
  ChatRepository({
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

  Future<List<ChatMessage>> getMessages({int limit = 100}) async {
    if (isDemo) {
      final messages = await _demo.getChat();
      return messages.take(limit).toList();
    }
    final data = await _client!
        .from('ai_conversations')
        .select()
        .eq('user_id', userId)
        .order('created_at', ascending: true)
        .limit(limit);
    return (data as List)
        .map((e) => ChatMessage(
              id: e['id'] as String,
              role: e['role'] as String,
              content: e['message'] as String,
              createdAt: DateTime.parse(e['created_at'] as String),
            ))
        .toList();
  }

  Future<void> saveMessage(ChatMessage message) async {
    if (isDemo) {
      final messages = await _demo.getChat();
      messages.add(message);
      await _demo.saveChat(messages);
      return;
    }
    await _client!.from('ai_conversations').insert({
      'user_id': userId,
      'role': message.role,
      'message': message.content,
    });
  }

  Future<void> saveMessages(List<ChatMessage> messages) async {
    for (final m in messages) {
      await saveMessage(m);
    }
  }
}
