// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'schedule_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$ScheduleBlockImpl _$$ScheduleBlockImplFromJson(Map<String, dynamic> json) =>
    _$ScheduleBlockImpl(
      time: json['time'] as String,
      activity: json['activity'] as String,
      durationMinutes: (json['durationMinutes'] as num?)?.toInt() ?? 60,
    );

Map<String, dynamic> _$$ScheduleBlockImplToJson(_$ScheduleBlockImpl instance) =>
    <String, dynamic>{
      'time': instance.time,
      'activity': instance.activity,
      'durationMinutes': instance.durationMinutes,
    };

_$ScheduleModelImpl _$$ScheduleModelImplFromJson(Map<String, dynamic> json) =>
    _$ScheduleModelImpl(
      date: DateTime.parse(json['date'] as String),
      blocks: (json['blocks'] as List<dynamic>)
          .map((e) => ScheduleBlock.fromJson(e as Map<String, dynamic>))
          .toList(),
      intro: json['intro'] as String? ?? '',
    );

Map<String, dynamic> _$$ScheduleModelImplToJson(_$ScheduleModelImpl instance) =>
    <String, dynamic>{
      'date': instance.date.toIso8601String(),
      'blocks': instance.blocks,
      'intro': instance.intro,
    };
