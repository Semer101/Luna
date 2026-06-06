// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'mood_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$MoodModelImpl _$$MoodModelImplFromJson(Map<String, dynamic> json) =>
    _$MoodModelImpl(
      id: json['id'] as String,
      userId: json['userId'] as String,
      mood: const MoodTypeConverter().fromJson(json['mood'] as String),
      energy: (json['energy'] as num).toInt(),
      stress: (json['stress'] as num).toInt(),
      source: json['source'] as String? ?? 'manual',
      createdAt: json['createdAt'] == null
          ? null
          : DateTime.parse(json['createdAt'] as String),
    );

Map<String, dynamic> _$$MoodModelImplToJson(_$MoodModelImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'userId': instance.userId,
      'mood': const MoodTypeConverter().toJson(instance.mood),
      'energy': instance.energy,
      'stress': instance.stress,
      'source': instance.source,
      'createdAt': instance.createdAt?.toIso8601String(),
    };
