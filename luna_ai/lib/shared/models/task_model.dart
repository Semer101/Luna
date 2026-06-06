import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:luna_ai/core/constants/app_enums.dart';
import 'package:luna_ai/core/utils/json_converters.dart';

part 'task_model.freezed.dart';
part 'task_model.g.dart';

@freezed
class TaskModel with _$TaskModel {
  const factory TaskModel({
    required String id,
    required String userId,
    required String title,
    @Default('') String description,
    @TaskPriorityConverter() @Default(TaskPriority.medium) TaskPriority priority,
    @TaskStatusConverter() @Default(TaskStatus.pending) TaskStatus status,
    @JsonKey(name: 'due_date') DateTime? dueDate,
    @TaskSourceConverter() @Default(TaskSource.user) TaskSource source,
    DateTime? createdAt,
  }) = _TaskModel;

  factory TaskModel.fromJson(Map<String, dynamic> json) =>
      _$TaskModelFromJson(json);
}
