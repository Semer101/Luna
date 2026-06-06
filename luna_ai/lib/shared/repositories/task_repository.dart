import 'package:luna_ai/core/config/app_config.dart';
import 'package:luna_ai/core/constants/app_enums.dart';
import 'package:luna_ai/shared/models/task_model.dart';
import 'package:luna_ai/shared/services/demo_storage_service.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
import 'package:uuid/uuid.dart';

class TaskRepository {
  TaskRepository({
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

  Future<List<TaskModel>> getTasks() async {
    if (isDemo) return _demo.getTasks();
    final data = await _client!
        .from('tasks')
        .select()
        .eq('user_id', userId)
        .order('created_at', ascending: false);
    return (data as List).map((e) => TaskModel.fromJson(e)).toList();
  }

  Future<TaskModel> createTask({
    required String title,
    String description = '',
    TaskPriority priority = TaskPriority.medium,
    DateTime? dueDate,
    TaskSource source = TaskSource.user,
  }) async {
    final task = TaskModel(
      id: _uuid.v4(),
      userId: userId,
      title: title,
      description: description,
      priority: priority,
      dueDate: dueDate,
      source: source,
      createdAt: DateTime.now(),
    );

    if (isDemo) {
      final tasks = await _demo.getTasks();
      tasks.insert(0, task);
      await _demo.saveTasks(tasks);
      return task;
    }

    final data = await _client!.from('tasks').insert({
      'user_id': userId,
      'title': title,
      'description': description,
      'priority': priority.name,
      'due_date': dueDate?.toIso8601String(),
      'source': source.name,
    }).select().single();

    return TaskModel.fromJson(data);
  }

  Future<void> updateTaskStatus(String id, TaskStatus status) async {
    if (isDemo) {
      final tasks = await _demo.getTasks();
      final index = tasks.indexWhere((t) => t.id == id);
      if (index >= 0) {
        tasks[index] = tasks[index].copyWith(status: status);
        await _demo.saveTasks(tasks);
      }
      return;
    }
    await _client!.from('tasks').update({'status': status.name}).eq('id', id);
  }

  Future<void> deleteTask(String id) async {
    if (isDemo) {
      final tasks = await _demo.getTasks();
      tasks.removeWhere((t) => t.id == id);
      await _demo.saveTasks(tasks);
      return;
    }
    await _client!.from('tasks').delete().eq('id', id);
  }
}
