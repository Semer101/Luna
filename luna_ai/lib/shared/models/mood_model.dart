import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:luna_ai/core/constants/app_enums.dart';
import 'package:luna_ai/core/utils/json_converters.dart';

part 'mood_model.freezed.dart';
part 'mood_model.g.dart';

@freezed
class MoodModel with _$MoodModel {
  const factory MoodModel({
    required String id,
    required String userId,
    @MoodTypeConverter() required MoodType mood,
    required int energy,
    required int stress,
    @Default('manual') String source,
    DateTime? createdAt,
  }) = _MoodModel;

  factory MoodModel.fromJson(Map<String, dynamic> json) =>
      _$MoodModelFromJson(json);
}
