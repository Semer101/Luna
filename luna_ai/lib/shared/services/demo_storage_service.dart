import 'dart:convert';

import 'package:luna_ai/shared/models/ai_suggestion_model.dart';
import 'package:luna_ai/shared/models/cycle_model.dart';
import 'package:luna_ai/shared/models/mood_model.dart';
import 'package:luna_ai/shared/models/profile_model.dart';
import 'package:luna_ai/shared/models/schedule_model.dart';
import 'package:luna_ai/shared/models/task_model.dart';
import 'package:luna_ai/shared/models/wellness_model.dart';
import 'package:shared_preferences/shared_preferences.dart';

/// Local persistence for demo mode when Supabase is not configured.
class DemoStorageService {
  static const _keyProfile = 'demo_profile';
  static const _keyCycle = 'demo_cycle';
  static const _keyMoods = 'demo_moods';
  static const _keyTasks = 'demo_tasks';
  static const _keySuggestions = 'demo_suggestions';
  static const _keyJournal = 'demo_journal';
  static const _keyChat = 'demo_chat';
  static const _keyOnboarded = 'demo_onboarded';
  static const _keyLoggedIn = 'demo_logged_in';

  Future<bool> isLoggedIn() async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.getBool(_keyLoggedIn) ?? false;
  }

  Future<void> setLoggedIn(bool value) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setBool(_keyLoggedIn, value);
  }

  Future<bool> isOnboarded() async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.getBool(_keyOnboarded) ?? false;
  }

  Future<void> setOnboarded(bool value) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setBool(_keyOnboarded, value);
  }

  Future<ProfileModel?> getProfile() async {
    final prefs = await SharedPreferences.getInstance();
    final raw = prefs.getString(_keyProfile);
    if (raw == null) return null;
    return ProfileModel.fromJson(jsonDecode(raw) as Map<String, dynamic>);
  }

  Future<void> saveProfile(ProfileModel profile) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString(_keyProfile, jsonEncode(profile.toJson()));
  }

  Future<CycleModel?> getCycle() async {
    final prefs = await SharedPreferences.getInstance();
    final raw = prefs.getString(_keyCycle);
    if (raw == null) return null;
    return CycleModel.fromJson(jsonDecode(raw) as Map<String, dynamic>);
  }

  Future<void> saveCycle(CycleModel cycle) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString(_keyCycle, jsonEncode(cycle.toJson()));
  }

  Future<List<MoodModel>> getMoods() async => _loadList(_keyMoods, MoodModel.fromJson);

  Future<void> saveMoods(List<MoodModel> moods) async =>
      _saveList(_keyMoods, moods.map((m) => m.toJson()).toList());

  Future<List<TaskModel>> getTasks() async => _loadList(_keyTasks, TaskModel.fromJson);

  Future<void> saveTasks(List<TaskModel> tasks) async =>
      _saveList(_keyTasks, tasks.map((t) => t.toJson()).toList());

  Future<List<AiSuggestionModel>> getSuggestions() async =>
      _loadList(_keySuggestions, AiSuggestionModel.fromJson);

  Future<void> saveSuggestions(List<AiSuggestionModel> suggestions) async =>
      _saveList(_keySuggestions, suggestions.map((s) => s.toJson()).toList());

  Future<List<JournalEntryModel>> getJournal() async =>
      _loadList(_keyJournal, JournalEntryModel.fromJson);

  Future<void> saveJournal(List<JournalEntryModel> entries) async =>
      _saveList(_keyJournal, entries.map((e) => e.toJson()).toList());

  Future<List<ChatMessage>> getChat() async => _loadList(_keyChat, (json) {
        return ChatMessage(
          id: json['id'] as String,
          role: json['role'] as String,
          content: json['content'] as String,
          createdAt: json['created_at'] != null
              ? DateTime.parse(json['created_at'] as String)
              : null,
          schedule: json['schedule'] != null
              ? ScheduleModel.fromJson(
                  json['schedule'] as Map<String, dynamic>,
                )
              : null,
        );
      });

  Future<void> saveChat(List<ChatMessage> messages) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString(
      _keyChat,
      jsonEncode(messages
          .map((m) => {
                'id': m.id,
                'role': m.role,
                'content': m.content,
                'created_at': m.createdAt?.toIso8601String(),
                if (m.schedule != null) 'schedule': m.schedule!.toJson(),
              })
          .toList()),
    );
  }

  Future<void> clearAll() async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.clear();
  }

  Future<List<T>> _loadList<T>(
    String key,
    T Function(Map<String, dynamic>) fromJson,
  ) async {
    final prefs = await SharedPreferences.getInstance();
    final raw = prefs.getString(key);
    if (raw == null) return [];
    final list = jsonDecode(raw) as List<dynamic>;
    return list.map((e) => fromJson(e as Map<String, dynamic>)).toList();
  }

  Future<void> _saveList(String key, List<Map<String, dynamic>> data) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString(key, jsonEncode(data));
  }
}
