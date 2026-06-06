// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'task_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$TaskModelImpl _$$TaskModelImplFromJson(Map<String, dynamic> json) =>
    _$TaskModelImpl(
      id: json['id'] as String,
      userId: json['userId'] as String,
      title: json['title'] as String,
      description: json['description'] as String? ?? '',
      priority: json['priority'] == null
          ? TaskPriority.medium
          : const TaskPriorityConverter().fromJson(json['priority'] as String),
      status: json['status'] == null
          ? TaskStatus.pending
          : const TaskStatusConverter().fromJson(json['status'] as String),
      dueDate: json['due_date'] == null
          ? null
          : DateTime.parse(json['due_date'] as String),
      source: json['source'] == null
          ? TaskSource.user
          : const TaskSourceConverter().fromJson(json['source'] as String),
      createdAt: json['createdAt'] == null
          ? null
          : DateTime.parse(json['createdAt'] as String),
    );

Map<String, dynamic> _$$TaskModelImplToJson(_$TaskModelImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'userId': instance.userId,
      'title': instance.title,
      'description': instance.description,
      'priority': const TaskPriorityConverter().toJson(instance.priority),
      'status': const TaskStatusConverter().toJson(instance.status),
      'due_date': instance.dueDate?.toIso8601String(),
      'source': const TaskSourceConverter().toJson(instance.source),
      'createdAt': instance.createdAt?.toIso8601String(),
    };
