// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'ai_suggestion_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$AiSuggestionModelImpl _$$AiSuggestionModelImplFromJson(
        Map<String, dynamic> json) =>
    _$AiSuggestionModelImpl(
      id: json['id'] as String,
      userId: json['userId'] as String,
      title: json['title'] as String,
      description: json['description'] as String? ?? '',
      priority: json['priority'] == null
          ? TaskPriority.medium
          : const TaskPriorityConverter().fromJson(json['priority'] as String),
      reasoning: json['reasoning'] as String? ?? '',
      suggestedDate: json['suggested_date'] == null
          ? null
          : DateTime.parse(json['suggested_date'] as String),
      status: json['status'] == null
          ? SuggestionStatus.pending
          : const SuggestionStatusConverter()
              .fromJson(json['status'] as String),
      createdAt: json['createdAt'] == null
          ? null
          : DateTime.parse(json['createdAt'] as String),
    );

Map<String, dynamic> _$$AiSuggestionModelImplToJson(
        _$AiSuggestionModelImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'userId': instance.userId,
      'title': instance.title,
      'description': instance.description,
      'priority': const TaskPriorityConverter().toJson(instance.priority),
      'reasoning': instance.reasoning,
      'suggested_date': instance.suggestedDate?.toIso8601String(),
      'status': const SuggestionStatusConverter().toJson(instance.status),
      'createdAt': instance.createdAt?.toIso8601String(),
    };
