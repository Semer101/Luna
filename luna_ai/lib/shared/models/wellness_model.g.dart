// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'wellness_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$WellnessScoreModelImpl _$$WellnessScoreModelImplFromJson(
        Map<String, dynamic> json) =>
    _$WellnessScoreModelImpl(
      id: json['id'] as String,
      userId: json['userId'] as String,
      score: (json['score'] as num).toInt(),
      sleep: (json['sleep'] as num?)?.toInt() ?? 0,
      moodScore: (json['mood_score'] as num?)?.toInt() ?? 0,
      stressScore: (json['stress_score'] as num?)?.toInt() ?? 0,
      activity: (json['activity'] as num?)?.toInt() ?? 0,
      hydration: (json['hydration'] as num?)?.toInt() ?? 0,
      createdAt: json['createdAt'] == null
          ? null
          : DateTime.parse(json['createdAt'] as String),
    );

Map<String, dynamic> _$$WellnessScoreModelImplToJson(
        _$WellnessScoreModelImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'userId': instance.userId,
      'score': instance.score,
      'sleep': instance.sleep,
      'mood_score': instance.moodScore,
      'stress_score': instance.stressScore,
      'activity': instance.activity,
      'hydration': instance.hydration,
      'createdAt': instance.createdAt?.toIso8601String(),
    };

_$AchievementModelImpl _$$AchievementModelImplFromJson(
        Map<String, dynamic> json) =>
    _$AchievementModelImpl(
      id: json['id'] as String,
      userId: json['userId'] as String,
      title: json['title'] as String,
      description: json['description'] as String? ?? '',
      earnedAt: json['earnedAt'] == null
          ? null
          : DateTime.parse(json['earnedAt'] as String),
    );

Map<String, dynamic> _$$AchievementModelImplToJson(
        _$AchievementModelImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'userId': instance.userId,
      'title': instance.title,
      'description': instance.description,
      'earnedAt': instance.earnedAt?.toIso8601String(),
    };

_$JournalEntryModelImpl _$$JournalEntryModelImplFromJson(
        Map<String, dynamic> json) =>
    _$JournalEntryModelImpl(
      id: json['id'] as String,
      userId: json['userId'] as String,
      mood: json['mood'] as String?,
      energy: (json['energy'] as num?)?.toInt(),
      stress: (json['stress'] as num?)?.toInt(),
      message: json['message'] as String,
      createdAt: json['createdAt'] == null
          ? null
          : DateTime.parse(json['createdAt'] as String),
    );

Map<String, dynamic> _$$JournalEntryModelImplToJson(
        _$JournalEntryModelImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'userId': instance.userId,
      'mood': instance.mood,
      'energy': instance.energy,
      'stress': instance.stress,
      'message': instance.message,
      'createdAt': instance.createdAt?.toIso8601String(),
    };
