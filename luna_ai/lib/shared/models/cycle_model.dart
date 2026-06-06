import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:luna_ai/core/constants/app_enums.dart';

part 'cycle_model.freezed.dart';
part 'cycle_model.g.dart';

@freezed
class CycleModel with _$CycleModel {
  const factory CycleModel({
    required String id,
    required String userId,
    @JsonKey(name: 'last_period_date') required DateTime lastPeriodDate,
    @JsonKey(name: 'cycle_length') @Default(28) int cycleLength,
    @JsonKey(name: 'period_duration') @Default(5) int periodDuration,
    DateTime? createdAt,
  }) = _CycleModel;

  factory CycleModel.fromJson(Map<String, dynamic> json) =>
      _$CycleModelFromJson(json);
}

@freezed
class CyclePhaseInfo with _$CyclePhaseInfo {
  const factory CyclePhaseInfo({
    required CyclePhase phase,
    required int dayInCycle,
    required int daysUntilNextPeriod,
    required double phaseProgress,
  }) = _CyclePhaseInfo;
}
