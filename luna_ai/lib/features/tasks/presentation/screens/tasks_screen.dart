import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:intl/intl.dart';
import 'package:luna_ai/core/constants/app_colors.dart';
import 'package:luna_ai/core/constants/app_enums.dart';
import 'package:luna_ai/core/widgets/ai_badge.dart';
import 'package:luna_ai/core/widgets/glass_card.dart';
import 'package:luna_ai/shared/models/task_model.dart';
import 'package:luna_ai/shared/providers/app_providers.dart';
import 'package:luna_ai/shared/providers/copilot_provider.dart';
import 'package:luna_ai/shared/providers/wellness_provider.dart';

class TasksScreen extends ConsumerWidget {
  const TasksScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final tasksAsync = ref.watch(tasksProvider);
    final pendingCount = ref.watch(pendingSuggestionsCountProvider);

    return Scaffold(
      appBar: AppBar(
        title: const Text('Tasks'),
        actions: [
          pendingCount.when(
            data: (count) => count > 0
                ? TextButton(
              onPressed: () => context.push('/suggestions'),
              child: Badge(label: Text('$count'), child: const Text('AI Suggestions')),
            )
                : const SizedBox.shrink(),
            loading: () => const SizedBox.shrink(),
            error: (_, __) => const SizedBox.shrink(),
          ),
        ],
      ),
      body: tasksAsync.when(
        data: (tasks) {
          final today = DateTime.now();
          final todayTasks = tasks.where((t) {
            if (t.status == TaskStatus.completed) return false;
            if (t.dueDate == null) return true;
            return _isSameDay(t.dueDate!, today);
          }).toList();

          final upcoming = tasks.where((t) {
            if (t.status == TaskStatus.completed) return false;
            if (t.dueDate == null) return false;
            return !_isSameDay(t.dueDate!, today);
          }).toList();

          final completed = tasks.where((t) => t.status == TaskStatus.completed).toList();

          if (tasks.isEmpty) {
            return _EmptyTasks(onChat: () => context.go('/copilot'));
          }

          return ListView(
            padding: const EdgeInsets.all(16),
            children: [
              _Section(title: 'Today', tasks: todayTasks),
              _Section(title: 'Upcoming', tasks: upcoming),
              _Section(title: 'Completed', tasks: completed, showCheckbox: true),
            ],
          );
        },
        loading: () => const Center(child: CircularProgressIndicator()),
        error: (e, _) => Center(child: Text('Error: $e')),
      ),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () => _showAddTask(context, ref),
        icon: const Icon(Icons.add),
        label: const Text('Add Task'),
      ),
    );
  }

  bool _isSameDay(DateTime a, DateTime b) =>
      a.year == b.year && a.month == b.month && a.day == b.day;

  Future<void> _showAddTask(BuildContext context, WidgetRef ref) async {
    final titleController = TextEditingController();
    final result = await showDialog<bool>(
      context: context,
      builder: (dialogContext) => AlertDialog(
        title: const Text('New Task'),
        content: TextField(
          controller: titleController,
          decoration: const InputDecoration(labelText: 'Task title'),
          autofocus: true,
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.of(dialogContext).pop(false),
            child: const Text('Cancel'),
          ),
          ElevatedButton(
            onPressed: () => Navigator.of(dialogContext).pop(true),
            child: const Text('Add'),
          ),
        ],
      ),
    );
    if (result == true && titleController.text.isNotEmpty) {
      await ref.read(taskRepositoryProvider).createTask(title: titleController.text);
      ref.invalidate(tasksProvider);
    }
  }
}

class _Section extends ConsumerWidget {
  const _Section({
    required this.title,
    required this.tasks,
    this.showCheckbox = false,
  });

  final String title;
  final List<TaskModel> tasks;
  final bool showCheckbox;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    if (tasks.isEmpty) return const SizedBox.shrink();

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 12),
          child: Text(
            title,
            style: Theme.of(context).textTheme.titleMedium?.copyWith(fontWeight: FontWeight.w600),
          ),
        ),
        ...tasks.map((t) => _TaskTile(task: t, showCheckbox: showCheckbox)),
        const SizedBox(height: 8),
      ],
    );
  }
}

class _TaskTile extends ConsumerWidget {
  const _TaskTile({required this.task, required this.showCheckbox});

  final TaskModel task;
  final bool showCheckbox;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final isCompleted = task.status == TaskStatus.completed;

    return Padding(
      padding: const EdgeInsets.only(bottom: 8),
      child: GlassCard(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
        child: Row(
          children: [
            if (showCheckbox)
              Icon(Icons.check_circle, color: AppColors.success)
            else
              Checkbox(
                value: isCompleted,
                onChanged: (_) {
                  ref.read(taskNotifierProvider.notifier).completeTask(task.id);
                },
                activeColor: AppColors.primary,
              ),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      Expanded(
                        child: Text(
                          task.title,
                          style: TextStyle(
                            fontWeight: FontWeight.w600,
                            decoration: isCompleted ? TextDecoration.lineThrough : null,
                          ),
                        ),
                      ),
                      if (task.source == TaskSource.ai) const AiBadge(small: true),
                    ],
                  ),
                  if (task.description.isNotEmpty)
                    Text(
                      task.description,
                      style: TextStyle(fontSize: 13, color: AppColors.textSecondary),
                    ),
                  if (task.dueDate != null)
                    Text(
                      DateFormat.MMMd().format(task.dueDate!),
                      style: TextStyle(fontSize: 12, color: AppColors.textSecondary),
                    ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _EmptyTasks extends StatelessWidget {
  const _EmptyTasks({required this.onChat});

  final VoidCallback onChat;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(Icons.task_alt, size: 64, color: AppColors.textSecondary.withOpacity(0.5)),
          const SizedBox(height: 16),
          const Text('No tasks yet'),
          const SizedBox(height: 8),
          TextButton(onPressed: onChat, child: const Text('Ask Luna to create some')),
        ],
      ),
    );
  }
}