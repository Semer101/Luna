import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:luna_ai/core/config/app_config.dart';
import 'package:luna_ai/shared/repositories/auth_repository.dart';
import 'package:luna_ai/shared/repositories/chat_repository.dart';
import 'package:luna_ai/shared/repositories/cycle_repository.dart';
import 'package:luna_ai/shared/repositories/journal_repository.dart';
import 'package:luna_ai/shared/repositories/mood_repository.dart';
import 'package:luna_ai/shared/repositories/profile_repository.dart';
import 'package:luna_ai/shared/repositories/suggestion_repository.dart';
import 'package:luna_ai/shared/repositories/task_repository.dart';
import 'package:luna_ai/shared/services/cycle_phase_service.dart';
import 'package:luna_ai/shared/services/demo_storage_service.dart';
import 'package:luna_ai/shared/services/gemini_service.dart';
import 'package:luna_ai/shared/services/prediction_service.dart';
import 'package:luna_ai/shared/services/wellness_score_service.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

final supabaseClientProvider = Provider<SupabaseClient?>((ref) {
  if (AppConfig.isDemoMode) return null;
  return Supabase.instance.client;
});

final demoStorageProvider = Provider((ref) => DemoStorageService());

final authRepositoryProvider = Provider((ref) {
  return AuthRepository(
    client: ref.watch(supabaseClientProvider),
    demoStorage: ref.watch(demoStorageProvider),
  );
});

final userIdProvider = Provider<String>((ref) {
  return ref.watch(authRepositoryProvider).userId;
});

final cycleRepositoryProvider = Provider((ref) {
  return CycleRepository(
    client: ref.watch(supabaseClientProvider),
    demoStorage: ref.watch(demoStorageProvider),
    userId: ref.watch(userIdProvider),
  );
});

final moodRepositoryProvider = Provider((ref) {
  return MoodRepository(
    client: ref.watch(supabaseClientProvider),
    demoStorage: ref.watch(demoStorageProvider),
    userId: ref.watch(userIdProvider),
  );
});

final taskRepositoryProvider = Provider((ref) {
  return TaskRepository(
    client: ref.watch(supabaseClientProvider),
    demoStorage: ref.watch(demoStorageProvider),
    userId: ref.watch(userIdProvider),
  );
});

final suggestionRepositoryProvider = Provider((ref) {
  return SuggestionRepository(
    client: ref.watch(supabaseClientProvider),
    demoStorage: ref.watch(demoStorageProvider),
    userId: ref.watch(userIdProvider),
  );
});

final profileRepositoryProvider = Provider((ref) {
  return ProfileRepository(
    client: ref.watch(supabaseClientProvider),
    demoStorage: ref.watch(demoStorageProvider),
    userId: ref.watch(userIdProvider),
  );
});

final journalRepositoryProvider = Provider((ref) {
  return JournalRepository(
    client: ref.watch(supabaseClientProvider),
    demoStorage: ref.watch(demoStorageProvider),
    userId: ref.watch(userIdProvider),
  );
});

final chatRepositoryProvider = Provider((ref) {
  return ChatRepository(
    client: ref.watch(supabaseClientProvider),
    demoStorage: ref.watch(demoStorageProvider),
    userId: ref.watch(userIdProvider),
  );
});

final cyclePhaseServiceProvider = Provider((ref) => CyclePhaseService());
final wellnessScoreServiceProvider = Provider((ref) => WellnessScoreService());
final predictionServiceProvider = Provider((ref) => PredictionService());
final geminiServiceProvider = Provider((ref) {
  return GeminiService(userId: ref.watch(userIdProvider));
});
