import 'package:freezed_annotation/freezed_annotation.dart';

part 'schedule_model.freezed.dart';
part 'schedule_model.g.dart';

/// A single time block within a generated daily schedule.
@freezed
class ScheduleBlock with _$ScheduleBlock {
  const factory ScheduleBlock({
    /// Time in 24-hour "HH:mm" format (e.g. "08:00").
    required String time,

    /// Short, human-readable description of the activity.
    required String activity,

    /// Optional duration in minutes. Inferred from neighbouring blocks when null.
    @Default(60) int durationMinutes,
  }) = _ScheduleBlock;

  factory ScheduleBlock.fromJson(Map<String, dynamic> json) =>
      _$ScheduleBlockFromJson(json);
}

/// A full day schedule produced by Luna from the user's natural-language input.
@freezed
class ScheduleModel with _$ScheduleModel {
  const factory ScheduleModel({
    /// The date the schedule is for. Defaults to today when not supplied.
    required DateTime date,

    /// Ordered list of time blocks that make up the day.
    required List<ScheduleBlock> blocks,

    /// Optional intro / context text shown above the blocks.
    @Default('') String intro,
  }) = _ScheduleModel;

  factory ScheduleModel.fromJson(Map<String, dynamic> json) =>
      _$ScheduleModelFromJson(json);
}
