import 'package:json_annotation/json_annotation.dart';
import 'package:luna_ai/core/constants/app_enums.dart';

class MoodTypeConverter implements JsonConverter<MoodType, String> {
  const MoodTypeConverter();

  @override
  MoodType fromJson(String json) =>
      MoodType.values.firstWhere((e) => e.name == json, orElse: () => MoodType.neutral);

  @override
  String toJson(MoodType object) => object.name;
}

class TaskPriorityConverter implements JsonConverter<TaskPriority, String> {
  const TaskPriorityConverter();

  @override
  TaskPriority fromJson(String json) =>
      TaskPriority.values.firstWhere((e) => e.name == json, orElse: () => TaskPriority.medium);

  @override
  String toJson(TaskPriority object) => object.name;
}

class TaskStatusConverter implements JsonConverter<TaskStatus, String> {
  const TaskStatusConverter();

  @override
  TaskStatus fromJson(String json) =>
      TaskStatus.values.firstWhere((e) => e.name == json, orElse: () => TaskStatus.pending);

  @override
  String toJson(TaskStatus object) => object.name;
}

class TaskSourceConverter implements JsonConverter<TaskSource, String> {
  const TaskSourceConverter();

  @override
  TaskSource fromJson(String json) =>
      TaskSource.values.firstWhere((e) => e.name == json, orElse: () => TaskSource.user);

  @override
  String toJson(TaskSource object) => object.name;
}

class SuggestionStatusConverter implements JsonConverter<SuggestionStatus, String> {
  const SuggestionStatusConverter();

  @override
  SuggestionStatus fromJson(String json) => SuggestionStatus.values
      .firstWhere((e) => e.name == json, orElse: () => SuggestionStatus.pending);

  @override
  String toJson(SuggestionStatus object) => object.name;
}
