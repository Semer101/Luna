import 'package:freezed_annotation/freezed_annotation.dart';

part 'profile_model.freezed.dart';
part 'profile_model.g.dart';

@freezed
class ProfileModel with _$ProfileModel {
  const factory ProfileModel({
    required String id,
    @Default('') String name,
    @Default('') String email,
    @JsonKey(name: 'wellness_goals') @Default([]) List<String> wellnessGoals,
    @Default(0) int xp,
    @Default(1) int level,
    DateTime? createdAt,
  }) = _ProfileModel;

  factory ProfileModel.fromJson(Map<String, dynamic> json) =>
      _$ProfileModelFromJson(json);
}
