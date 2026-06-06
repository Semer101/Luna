// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'cycle_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$CycleModelImpl _$$CycleModelImplFromJson(Map<String, dynamic> json) =>
    _$CycleModelImpl(
      id: json['id'] as String,
      userId: json['userId'] as String,
      lastPeriodDate: DateTime.parse(json['last_period_date'] as String),
      cycleLength: (json['cycle_length'] as num?)?.toInt() ?? 28,
      periodDuration: (json['period_duration'] as num?)?.toInt() ?? 5,
      createdAt: json['createdAt'] == null
          ? null
          : DateTime.parse(json['createdAt'] as String),
    );

Map<String, dynamic> _$$CycleModelImplToJson(_$CycleModelImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'userId': instance.userId,
      'last_period_date': instance.lastPeriodDate.toIso8601String(),
      'cycle_length': instance.cycleLength,
      'period_duration': instance.periodDuration,
      'createdAt': instance.createdAt?.toIso8601String(),
    };
