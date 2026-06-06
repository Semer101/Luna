import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:luna_ai/core/constants/app_enums.dart';
import 'package:luna_ai/core/utils/json_converters.dart';

part 'ai_suggestion_model.freezed.dart';
part 'ai_suggestion_model.g.dart';

@freezed
class AiSuggestionModel with _$AiSuggestionModel {
  const factory AiSuggestionModel({
    required String id,
    required String userId,
    required String title,
    @Default('') String description,
    @TaskPriorityConverter() @Default(TaskPriority.medium) TaskPriority priority,
    @Default('') String reasoning,
    @JsonKey(name: 'suggested_date') DateTime? suggestedDate,
    @SuggestionStatusConverter() @Default(SuggestionStatus.pending) SuggestionStatus status,
    DateTime? createdAt,
  }) = _AiSuggestionModel;

  factory AiSuggestionModel.fromJson(Map<String, dynamic> json) =>
      _$AiSuggestionModelFromJson(json);
}
