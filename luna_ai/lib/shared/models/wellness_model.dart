import 'package:freezed_annotation/freezed_annotation.dart';

part 'wellness_model.freezed.dart';
part 'wellness_model.g.dart';

@freezed
class WellnessScoreModel with _$WellnessScoreModel {
  const factory WellnessScoreModel({
    required String id,
    required String userId,
    required int score,
    @Default(0) int sleep,
    @JsonKey(name: 'mood_score') @Default(0) int moodScore,
    @JsonKey(name: 'stress_score') @Default(0) int stressScore,
    @Default(0) int activity,
    @Default(0) int hydration,
    DateTime? createdAt,
  }) = _WellnessScoreModel;

  factory WellnessScoreModel.fromJson(Map<String, dynamic> json) =>
      _$WellnessScoreModelFromJson(json);
}

@freezed
class FuturePrediction with _$FuturePrediction {
  const factory FuturePrediction({
    required int dayOffset,
    required int predictedEnergy,
    required int predictedStress,
    required String predictedMood,
    required List<String> symptoms,
    required String explanation,
  }) = _FuturePrediction;
}

@freezed
class WellnessTwinInsight with _$WellnessTwinInsight {
  const factory WellnessTwinInsight({
    required String title,
    required String description,
    required String category,
    @Default(0.0) double confidence,
  }) = _WellnessTwinInsight;
}

@freezed
class AchievementModel with _$AchievementModel {
  const factory AchievementModel({
    required String id,
    required String userId,
    required String title,
    @Default('') String description,
    DateTime? earnedAt,
  }) = _AchievementModel;

  factory AchievementModel.fromJson(Map<String, dynamic> json) =>
      _$AchievementModelFromJson(json);
}

@freezed
class JournalEntryModel with _$JournalEntryModel {
  const factory JournalEntryModel({
    required String id,
    required String userId,
    String? mood,
    int? energy,
    int? stress,
    required String message,
    DateTime? createdAt,
  }) = _JournalEntryModel;

  factory JournalEntryModel.fromJson(Map<String, dynamic> json) =>
      _$JournalEntryModelFromJson(json);
}

@freezed
class ChatMessage with _$ChatMessage {
  const factory ChatMessage({
    required String id,
    required String role,
    required String content,
    DateTime? createdAt,
    @Default(false) bool isStreaming,
  }) = _ChatMessage;
}
