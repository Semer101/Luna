// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'wellness_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

WellnessScoreModel _$WellnessScoreModelFromJson(Map<String, dynamic> json) {
  return _WellnessScoreModel.fromJson(json);
}

/// @nodoc
mixin _$WellnessScoreModel {
  String get id => throw _privateConstructorUsedError;
  String get userId => throw _privateConstructorUsedError;
  int get score => throw _privateConstructorUsedError;
  int get sleep => throw _privateConstructorUsedError;
  @JsonKey(name: 'mood_score')
  int get moodScore => throw _privateConstructorUsedError;
  @JsonKey(name: 'stress_score')
  int get stressScore => throw _privateConstructorUsedError;
  int get activity => throw _privateConstructorUsedError;
  int get hydration => throw _privateConstructorUsedError;
  DateTime? get createdAt => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $WellnessScoreModelCopyWith<WellnessScoreModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $WellnessScoreModelCopyWith<$Res> {
  factory $WellnessScoreModelCopyWith(
          WellnessScoreModel value, $Res Function(WellnessScoreModel) then) =
      _$WellnessScoreModelCopyWithImpl<$Res, WellnessScoreModel>;
  @useResult
  $Res call(
      {String id,
      String userId,
      int score,
      int sleep,
      @JsonKey(name: 'mood_score') int moodScore,
      @JsonKey(name: 'stress_score') int stressScore,
      int activity,
      int hydration,
      DateTime? createdAt});
}

/// @nodoc
class _$WellnessScoreModelCopyWithImpl<$Res, $Val extends WellnessScoreModel>
    implements $WellnessScoreModelCopyWith<$Res> {
  _$WellnessScoreModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? userId = null,
    Object? score = null,
    Object? sleep = null,
    Object? moodScore = null,
    Object? stressScore = null,
    Object? activity = null,
    Object? hydration = null,
    Object? createdAt = freezed,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      userId: null == userId
          ? _value.userId
          : userId // ignore: cast_nullable_to_non_nullable
              as String,
      score: null == score
          ? _value.score
          : score // ignore: cast_nullable_to_non_nullable
              as int,
      sleep: null == sleep
          ? _value.sleep
          : sleep // ignore: cast_nullable_to_non_nullable
              as int,
      moodScore: null == moodScore
          ? _value.moodScore
          : moodScore // ignore: cast_nullable_to_non_nullable
              as int,
      stressScore: null == stressScore
          ? _value.stressScore
          : stressScore // ignore: cast_nullable_to_non_nullable
              as int,
      activity: null == activity
          ? _value.activity
          : activity // ignore: cast_nullable_to_non_nullable
              as int,
      hydration: null == hydration
          ? _value.hydration
          : hydration // ignore: cast_nullable_to_non_nullable
              as int,
      createdAt: freezed == createdAt
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as DateTime?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$WellnessScoreModelImplCopyWith<$Res>
    implements $WellnessScoreModelCopyWith<$Res> {
  factory _$$WellnessScoreModelImplCopyWith(_$WellnessScoreModelImpl value,
          $Res Function(_$WellnessScoreModelImpl) then) =
      __$$WellnessScoreModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String id,
      String userId,
      int score,
      int sleep,
      @JsonKey(name: 'mood_score') int moodScore,
      @JsonKey(name: 'stress_score') int stressScore,
      int activity,
      int hydration,
      DateTime? createdAt});
}

/// @nodoc
class __$$WellnessScoreModelImplCopyWithImpl<$Res>
    extends _$WellnessScoreModelCopyWithImpl<$Res, _$WellnessScoreModelImpl>
    implements _$$WellnessScoreModelImplCopyWith<$Res> {
  __$$WellnessScoreModelImplCopyWithImpl(_$WellnessScoreModelImpl _value,
      $Res Function(_$WellnessScoreModelImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? userId = null,
    Object? score = null,
    Object? sleep = null,
    Object? moodScore = null,
    Object? stressScore = null,
    Object? activity = null,
    Object? hydration = null,
    Object? createdAt = freezed,
  }) {
    return _then(_$WellnessScoreModelImpl(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      userId: null == userId
          ? _value.userId
          : userId // ignore: cast_nullable_to_non_nullable
              as String,
      score: null == score
          ? _value.score
          : score // ignore: cast_nullable_to_non_nullable
              as int,
      sleep: null == sleep
          ? _value.sleep
          : sleep // ignore: cast_nullable_to_non_nullable
              as int,
      moodScore: null == moodScore
          ? _value.moodScore
          : moodScore // ignore: cast_nullable_to_non_nullable
              as int,
      stressScore: null == stressScore
          ? _value.stressScore
          : stressScore // ignore: cast_nullable_to_non_nullable
              as int,
      activity: null == activity
          ? _value.activity
          : activity // ignore: cast_nullable_to_non_nullable
              as int,
      hydration: null == hydration
          ? _value.hydration
          : hydration // ignore: cast_nullable_to_non_nullable
              as int,
      createdAt: freezed == createdAt
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as DateTime?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$WellnessScoreModelImpl implements _WellnessScoreModel {
  const _$WellnessScoreModelImpl(
      {required this.id,
      required this.userId,
      required this.score,
      this.sleep = 0,
      @JsonKey(name: 'mood_score') this.moodScore = 0,
      @JsonKey(name: 'stress_score') this.stressScore = 0,
      this.activity = 0,
      this.hydration = 0,
      this.createdAt});

  factory _$WellnessScoreModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$WellnessScoreModelImplFromJson(json);

  @override
  final String id;
  @override
  final String userId;
  @override
  final int score;
  @override
  @JsonKey()
  final int sleep;
  @override
  @JsonKey(name: 'mood_score')
  final int moodScore;
  @override
  @JsonKey(name: 'stress_score')
  final int stressScore;
  @override
  @JsonKey()
  final int activity;
  @override
  @JsonKey()
  final int hydration;
  @override
  final DateTime? createdAt;

  @override
  String toString() {
    return 'WellnessScoreModel(id: $id, userId: $userId, score: $score, sleep: $sleep, moodScore: $moodScore, stressScore: $stressScore, activity: $activity, hydration: $hydration, createdAt: $createdAt)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$WellnessScoreModelImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.userId, userId) || other.userId == userId) &&
            (identical(other.score, score) || other.score == score) &&
            (identical(other.sleep, sleep) || other.sleep == sleep) &&
            (identical(other.moodScore, moodScore) ||
                other.moodScore == moodScore) &&
            (identical(other.stressScore, stressScore) ||
                other.stressScore == stressScore) &&
            (identical(other.activity, activity) ||
                other.activity == activity) &&
            (identical(other.hydration, hydration) ||
                other.hydration == hydration) &&
            (identical(other.createdAt, createdAt) ||
                other.createdAt == createdAt));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, id, userId, score, sleep,
      moodScore, stressScore, activity, hydration, createdAt);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$WellnessScoreModelImplCopyWith<_$WellnessScoreModelImpl> get copyWith =>
      __$$WellnessScoreModelImplCopyWithImpl<_$WellnessScoreModelImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$WellnessScoreModelImplToJson(
      this,
    );
  }
}

abstract class _WellnessScoreModel implements WellnessScoreModel {
  const factory _WellnessScoreModel(
      {required final String id,
      required final String userId,
      required final int score,
      final int sleep,
      @JsonKey(name: 'mood_score') final int moodScore,
      @JsonKey(name: 'stress_score') final int stressScore,
      final int activity,
      final int hydration,
      final DateTime? createdAt}) = _$WellnessScoreModelImpl;

  factory _WellnessScoreModel.fromJson(Map<String, dynamic> json) =
      _$WellnessScoreModelImpl.fromJson;

  @override
  String get id;
  @override
  String get userId;
  @override
  int get score;
  @override
  int get sleep;
  @override
  @JsonKey(name: 'mood_score')
  int get moodScore;
  @override
  @JsonKey(name: 'stress_score')
  int get stressScore;
  @override
  int get activity;
  @override
  int get hydration;
  @override
  DateTime? get createdAt;
  @override
  @JsonKey(ignore: true)
  _$$WellnessScoreModelImplCopyWith<_$WellnessScoreModelImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
mixin _$FuturePrediction {
  int get dayOffset => throw _privateConstructorUsedError;
  int get predictedEnergy => throw _privateConstructorUsedError;
  int get predictedStress => throw _privateConstructorUsedError;
  String get predictedMood => throw _privateConstructorUsedError;
  List<String> get symptoms => throw _privateConstructorUsedError;
  String get explanation => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $FuturePredictionCopyWith<FuturePrediction> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $FuturePredictionCopyWith<$Res> {
  factory $FuturePredictionCopyWith(
          FuturePrediction value, $Res Function(FuturePrediction) then) =
      _$FuturePredictionCopyWithImpl<$Res, FuturePrediction>;
  @useResult
  $Res call(
      {int dayOffset,
      int predictedEnergy,
      int predictedStress,
      String predictedMood,
      List<String> symptoms,
      String explanation});
}

/// @nodoc
class _$FuturePredictionCopyWithImpl<$Res, $Val extends FuturePrediction>
    implements $FuturePredictionCopyWith<$Res> {
  _$FuturePredictionCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? dayOffset = null,
    Object? predictedEnergy = null,
    Object? predictedStress = null,
    Object? predictedMood = null,
    Object? symptoms = null,
    Object? explanation = null,
  }) {
    return _then(_value.copyWith(
      dayOffset: null == dayOffset
          ? _value.dayOffset
          : dayOffset // ignore: cast_nullable_to_non_nullable
              as int,
      predictedEnergy: null == predictedEnergy
          ? _value.predictedEnergy
          : predictedEnergy // ignore: cast_nullable_to_non_nullable
              as int,
      predictedStress: null == predictedStress
          ? _value.predictedStress
          : predictedStress // ignore: cast_nullable_to_non_nullable
              as int,
      predictedMood: null == predictedMood
          ? _value.predictedMood
          : predictedMood // ignore: cast_nullable_to_non_nullable
              as String,
      symptoms: null == symptoms
          ? _value.symptoms
          : symptoms // ignore: cast_nullable_to_non_nullable
              as List<String>,
      explanation: null == explanation
          ? _value.explanation
          : explanation // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$FuturePredictionImplCopyWith<$Res>
    implements $FuturePredictionCopyWith<$Res> {
  factory _$$FuturePredictionImplCopyWith(_$FuturePredictionImpl value,
          $Res Function(_$FuturePredictionImpl) then) =
      __$$FuturePredictionImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {int dayOffset,
      int predictedEnergy,
      int predictedStress,
      String predictedMood,
      List<String> symptoms,
      String explanation});
}

/// @nodoc
class __$$FuturePredictionImplCopyWithImpl<$Res>
    extends _$FuturePredictionCopyWithImpl<$Res, _$FuturePredictionImpl>
    implements _$$FuturePredictionImplCopyWith<$Res> {
  __$$FuturePredictionImplCopyWithImpl(_$FuturePredictionImpl _value,
      $Res Function(_$FuturePredictionImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? dayOffset = null,
    Object? predictedEnergy = null,
    Object? predictedStress = null,
    Object? predictedMood = null,
    Object? symptoms = null,
    Object? explanation = null,
  }) {
    return _then(_$FuturePredictionImpl(
      dayOffset: null == dayOffset
          ? _value.dayOffset
          : dayOffset // ignore: cast_nullable_to_non_nullable
              as int,
      predictedEnergy: null == predictedEnergy
          ? _value.predictedEnergy
          : predictedEnergy // ignore: cast_nullable_to_non_nullable
              as int,
      predictedStress: null == predictedStress
          ? _value.predictedStress
          : predictedStress // ignore: cast_nullable_to_non_nullable
              as int,
      predictedMood: null == predictedMood
          ? _value.predictedMood
          : predictedMood // ignore: cast_nullable_to_non_nullable
              as String,
      symptoms: null == symptoms
          ? _value._symptoms
          : symptoms // ignore: cast_nullable_to_non_nullable
              as List<String>,
      explanation: null == explanation
          ? _value.explanation
          : explanation // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$FuturePredictionImpl implements _FuturePrediction {
  const _$FuturePredictionImpl(
      {required this.dayOffset,
      required this.predictedEnergy,
      required this.predictedStress,
      required this.predictedMood,
      required final List<String> symptoms,
      required this.explanation})
      : _symptoms = symptoms;

  @override
  final int dayOffset;
  @override
  final int predictedEnergy;
  @override
  final int predictedStress;
  @override
  final String predictedMood;
  final List<String> _symptoms;
  @override
  List<String> get symptoms {
    if (_symptoms is EqualUnmodifiableListView) return _symptoms;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_symptoms);
  }

  @override
  final String explanation;

  @override
  String toString() {
    return 'FuturePrediction(dayOffset: $dayOffset, predictedEnergy: $predictedEnergy, predictedStress: $predictedStress, predictedMood: $predictedMood, symptoms: $symptoms, explanation: $explanation)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$FuturePredictionImpl &&
            (identical(other.dayOffset, dayOffset) ||
                other.dayOffset == dayOffset) &&
            (identical(other.predictedEnergy, predictedEnergy) ||
                other.predictedEnergy == predictedEnergy) &&
            (identical(other.predictedStress, predictedStress) ||
                other.predictedStress == predictedStress) &&
            (identical(other.predictedMood, predictedMood) ||
                other.predictedMood == predictedMood) &&
            const DeepCollectionEquality().equals(other._symptoms, _symptoms) &&
            (identical(other.explanation, explanation) ||
                other.explanation == explanation));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      dayOffset,
      predictedEnergy,
      predictedStress,
      predictedMood,
      const DeepCollectionEquality().hash(_symptoms),
      explanation);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$FuturePredictionImplCopyWith<_$FuturePredictionImpl> get copyWith =>
      __$$FuturePredictionImplCopyWithImpl<_$FuturePredictionImpl>(
          this, _$identity);
}

abstract class _FuturePrediction implements FuturePrediction {
  const factory _FuturePrediction(
      {required final int dayOffset,
      required final int predictedEnergy,
      required final int predictedStress,
      required final String predictedMood,
      required final List<String> symptoms,
      required final String explanation}) = _$FuturePredictionImpl;

  @override
  int get dayOffset;
  @override
  int get predictedEnergy;
  @override
  int get predictedStress;
  @override
  String get predictedMood;
  @override
  List<String> get symptoms;
  @override
  String get explanation;
  @override
  @JsonKey(ignore: true)
  _$$FuturePredictionImplCopyWith<_$FuturePredictionImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
mixin _$WellnessTwinInsight {
  String get title => throw _privateConstructorUsedError;
  String get description => throw _privateConstructorUsedError;
  String get category => throw _privateConstructorUsedError;
  double get confidence => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $WellnessTwinInsightCopyWith<WellnessTwinInsight> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $WellnessTwinInsightCopyWith<$Res> {
  factory $WellnessTwinInsightCopyWith(
          WellnessTwinInsight value, $Res Function(WellnessTwinInsight) then) =
      _$WellnessTwinInsightCopyWithImpl<$Res, WellnessTwinInsight>;
  @useResult
  $Res call(
      {String title, String description, String category, double confidence});
}

/// @nodoc
class _$WellnessTwinInsightCopyWithImpl<$Res, $Val extends WellnessTwinInsight>
    implements $WellnessTwinInsightCopyWith<$Res> {
  _$WellnessTwinInsightCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? title = null,
    Object? description = null,
    Object? category = null,
    Object? confidence = null,
  }) {
    return _then(_value.copyWith(
      title: null == title
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as String,
      description: null == description
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String,
      category: null == category
          ? _value.category
          : category // ignore: cast_nullable_to_non_nullable
              as String,
      confidence: null == confidence
          ? _value.confidence
          : confidence // ignore: cast_nullable_to_non_nullable
              as double,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$WellnessTwinInsightImplCopyWith<$Res>
    implements $WellnessTwinInsightCopyWith<$Res> {
  factory _$$WellnessTwinInsightImplCopyWith(_$WellnessTwinInsightImpl value,
          $Res Function(_$WellnessTwinInsightImpl) then) =
      __$$WellnessTwinInsightImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String title, String description, String category, double confidence});
}

/// @nodoc
class __$$WellnessTwinInsightImplCopyWithImpl<$Res>
    extends _$WellnessTwinInsightCopyWithImpl<$Res, _$WellnessTwinInsightImpl>
    implements _$$WellnessTwinInsightImplCopyWith<$Res> {
  __$$WellnessTwinInsightImplCopyWithImpl(_$WellnessTwinInsightImpl _value,
      $Res Function(_$WellnessTwinInsightImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? title = null,
    Object? description = null,
    Object? category = null,
    Object? confidence = null,
  }) {
    return _then(_$WellnessTwinInsightImpl(
      title: null == title
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as String,
      description: null == description
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String,
      category: null == category
          ? _value.category
          : category // ignore: cast_nullable_to_non_nullable
              as String,
      confidence: null == confidence
          ? _value.confidence
          : confidence // ignore: cast_nullable_to_non_nullable
              as double,
    ));
  }
}

/// @nodoc

class _$WellnessTwinInsightImpl implements _WellnessTwinInsight {
  const _$WellnessTwinInsightImpl(
      {required this.title,
      required this.description,
      required this.category,
      this.confidence = 0.0});

  @override
  final String title;
  @override
  final String description;
  @override
  final String category;
  @override
  @JsonKey()
  final double confidence;

  @override
  String toString() {
    return 'WellnessTwinInsight(title: $title, description: $description, category: $category, confidence: $confidence)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$WellnessTwinInsightImpl &&
            (identical(other.title, title) || other.title == title) &&
            (identical(other.description, description) ||
                other.description == description) &&
            (identical(other.category, category) ||
                other.category == category) &&
            (identical(other.confidence, confidence) ||
                other.confidence == confidence));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, title, description, category, confidence);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$WellnessTwinInsightImplCopyWith<_$WellnessTwinInsightImpl> get copyWith =>
      __$$WellnessTwinInsightImplCopyWithImpl<_$WellnessTwinInsightImpl>(
          this, _$identity);
}

abstract class _WellnessTwinInsight implements WellnessTwinInsight {
  const factory _WellnessTwinInsight(
      {required final String title,
      required final String description,
      required final String category,
      final double confidence}) = _$WellnessTwinInsightImpl;

  @override
  String get title;
  @override
  String get description;
  @override
  String get category;
  @override
  double get confidence;
  @override
  @JsonKey(ignore: true)
  _$$WellnessTwinInsightImplCopyWith<_$WellnessTwinInsightImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

AchievementModel _$AchievementModelFromJson(Map<String, dynamic> json) {
  return _AchievementModel.fromJson(json);
}

/// @nodoc
mixin _$AchievementModel {
  String get id => throw _privateConstructorUsedError;
  String get userId => throw _privateConstructorUsedError;
  String get title => throw _privateConstructorUsedError;
  String get description => throw _privateConstructorUsedError;
  DateTime? get earnedAt => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $AchievementModelCopyWith<AchievementModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $AchievementModelCopyWith<$Res> {
  factory $AchievementModelCopyWith(
          AchievementModel value, $Res Function(AchievementModel) then) =
      _$AchievementModelCopyWithImpl<$Res, AchievementModel>;
  @useResult
  $Res call(
      {String id,
      String userId,
      String title,
      String description,
      DateTime? earnedAt});
}

/// @nodoc
class _$AchievementModelCopyWithImpl<$Res, $Val extends AchievementModel>
    implements $AchievementModelCopyWith<$Res> {
  _$AchievementModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? userId = null,
    Object? title = null,
    Object? description = null,
    Object? earnedAt = freezed,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      userId: null == userId
          ? _value.userId
          : userId // ignore: cast_nullable_to_non_nullable
              as String,
      title: null == title
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as String,
      description: null == description
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String,
      earnedAt: freezed == earnedAt
          ? _value.earnedAt
          : earnedAt // ignore: cast_nullable_to_non_nullable
              as DateTime?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$AchievementModelImplCopyWith<$Res>
    implements $AchievementModelCopyWith<$Res> {
  factory _$$AchievementModelImplCopyWith(_$AchievementModelImpl value,
          $Res Function(_$AchievementModelImpl) then) =
      __$$AchievementModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String id,
      String userId,
      String title,
      String description,
      DateTime? earnedAt});
}

/// @nodoc
class __$$AchievementModelImplCopyWithImpl<$Res>
    extends _$AchievementModelCopyWithImpl<$Res, _$AchievementModelImpl>
    implements _$$AchievementModelImplCopyWith<$Res> {
  __$$AchievementModelImplCopyWithImpl(_$AchievementModelImpl _value,
      $Res Function(_$AchievementModelImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? userId = null,
    Object? title = null,
    Object? description = null,
    Object? earnedAt = freezed,
  }) {
    return _then(_$AchievementModelImpl(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      userId: null == userId
          ? _value.userId
          : userId // ignore: cast_nullable_to_non_nullable
              as String,
      title: null == title
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as String,
      description: null == description
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String,
      earnedAt: freezed == earnedAt
          ? _value.earnedAt
          : earnedAt // ignore: cast_nullable_to_non_nullable
              as DateTime?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$AchievementModelImpl implements _AchievementModel {
  const _$AchievementModelImpl(
      {required this.id,
      required this.userId,
      required this.title,
      this.description = '',
      this.earnedAt});

  factory _$AchievementModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$AchievementModelImplFromJson(json);

  @override
  final String id;
  @override
  final String userId;
  @override
  final String title;
  @override
  @JsonKey()
  final String description;
  @override
  final DateTime? earnedAt;

  @override
  String toString() {
    return 'AchievementModel(id: $id, userId: $userId, title: $title, description: $description, earnedAt: $earnedAt)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$AchievementModelImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.userId, userId) || other.userId == userId) &&
            (identical(other.title, title) || other.title == title) &&
            (identical(other.description, description) ||
                other.description == description) &&
            (identical(other.earnedAt, earnedAt) ||
                other.earnedAt == earnedAt));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode =>
      Object.hash(runtimeType, id, userId, title, description, earnedAt);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$AchievementModelImplCopyWith<_$AchievementModelImpl> get copyWith =>
      __$$AchievementModelImplCopyWithImpl<_$AchievementModelImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$AchievementModelImplToJson(
      this,
    );
  }
}

abstract class _AchievementModel implements AchievementModel {
  const factory _AchievementModel(
      {required final String id,
      required final String userId,
      required final String title,
      final String description,
      final DateTime? earnedAt}) = _$AchievementModelImpl;

  factory _AchievementModel.fromJson(Map<String, dynamic> json) =
      _$AchievementModelImpl.fromJson;

  @override
  String get id;
  @override
  String get userId;
  @override
  String get title;
  @override
  String get description;
  @override
  DateTime? get earnedAt;
  @override
  @JsonKey(ignore: true)
  _$$AchievementModelImplCopyWith<_$AchievementModelImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

JournalEntryModel _$JournalEntryModelFromJson(Map<String, dynamic> json) {
  return _JournalEntryModel.fromJson(json);
}

/// @nodoc
mixin _$JournalEntryModel {
  String get id => throw _privateConstructorUsedError;
  String get userId => throw _privateConstructorUsedError;
  String? get mood => throw _privateConstructorUsedError;
  int? get energy => throw _privateConstructorUsedError;
  int? get stress => throw _privateConstructorUsedError;
  String get message => throw _privateConstructorUsedError;
  DateTime? get createdAt => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $JournalEntryModelCopyWith<JournalEntryModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $JournalEntryModelCopyWith<$Res> {
  factory $JournalEntryModelCopyWith(
          JournalEntryModel value, $Res Function(JournalEntryModel) then) =
      _$JournalEntryModelCopyWithImpl<$Res, JournalEntryModel>;
  @useResult
  $Res call(
      {String id,
      String userId,
      String? mood,
      int? energy,
      int? stress,
      String message,
      DateTime? createdAt});
}

/// @nodoc
class _$JournalEntryModelCopyWithImpl<$Res, $Val extends JournalEntryModel>
    implements $JournalEntryModelCopyWith<$Res> {
  _$JournalEntryModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? userId = null,
    Object? mood = freezed,
    Object? energy = freezed,
    Object? stress = freezed,
    Object? message = null,
    Object? createdAt = freezed,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      userId: null == userId
          ? _value.userId
          : userId // ignore: cast_nullable_to_non_nullable
              as String,
      mood: freezed == mood
          ? _value.mood
          : mood // ignore: cast_nullable_to_non_nullable
              as String?,
      energy: freezed == energy
          ? _value.energy
          : energy // ignore: cast_nullable_to_non_nullable
              as int?,
      stress: freezed == stress
          ? _value.stress
          : stress // ignore: cast_nullable_to_non_nullable
              as int?,
      message: null == message
          ? _value.message
          : message // ignore: cast_nullable_to_non_nullable
              as String,
      createdAt: freezed == createdAt
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as DateTime?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$JournalEntryModelImplCopyWith<$Res>
    implements $JournalEntryModelCopyWith<$Res> {
  factory _$$JournalEntryModelImplCopyWith(_$JournalEntryModelImpl value,
          $Res Function(_$JournalEntryModelImpl) then) =
      __$$JournalEntryModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String id,
      String userId,
      String? mood,
      int? energy,
      int? stress,
      String message,
      DateTime? createdAt});
}

/// @nodoc
class __$$JournalEntryModelImplCopyWithImpl<$Res>
    extends _$JournalEntryModelCopyWithImpl<$Res, _$JournalEntryModelImpl>
    implements _$$JournalEntryModelImplCopyWith<$Res> {
  __$$JournalEntryModelImplCopyWithImpl(_$JournalEntryModelImpl _value,
      $Res Function(_$JournalEntryModelImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? userId = null,
    Object? mood = freezed,
    Object? energy = freezed,
    Object? stress = freezed,
    Object? message = null,
    Object? createdAt = freezed,
  }) {
    return _then(_$JournalEntryModelImpl(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      userId: null == userId
          ? _value.userId
          : userId // ignore: cast_nullable_to_non_nullable
              as String,
      mood: freezed == mood
          ? _value.mood
          : mood // ignore: cast_nullable_to_non_nullable
              as String?,
      energy: freezed == energy
          ? _value.energy
          : energy // ignore: cast_nullable_to_non_nullable
              as int?,
      stress: freezed == stress
          ? _value.stress
          : stress // ignore: cast_nullable_to_non_nullable
              as int?,
      message: null == message
          ? _value.message
          : message // ignore: cast_nullable_to_non_nullable
              as String,
      createdAt: freezed == createdAt
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as DateTime?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$JournalEntryModelImpl implements _JournalEntryModel {
  const _$JournalEntryModelImpl(
      {required this.id,
      required this.userId,
      this.mood,
      this.energy,
      this.stress,
      required this.message,
      this.createdAt});

  factory _$JournalEntryModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$JournalEntryModelImplFromJson(json);

  @override
  final String id;
  @override
  final String userId;
  @override
  final String? mood;
  @override
  final int? energy;
  @override
  final int? stress;
  @override
  final String message;
  @override
  final DateTime? createdAt;

  @override
  String toString() {
    return 'JournalEntryModel(id: $id, userId: $userId, mood: $mood, energy: $energy, stress: $stress, message: $message, createdAt: $createdAt)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$JournalEntryModelImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.userId, userId) || other.userId == userId) &&
            (identical(other.mood, mood) || other.mood == mood) &&
            (identical(other.energy, energy) || other.energy == energy) &&
            (identical(other.stress, stress) || other.stress == stress) &&
            (identical(other.message, message) || other.message == message) &&
            (identical(other.createdAt, createdAt) ||
                other.createdAt == createdAt));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType, id, userId, mood, energy, stress, message, createdAt);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$JournalEntryModelImplCopyWith<_$JournalEntryModelImpl> get copyWith =>
      __$$JournalEntryModelImplCopyWithImpl<_$JournalEntryModelImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$JournalEntryModelImplToJson(
      this,
    );
  }
}

abstract class _JournalEntryModel implements JournalEntryModel {
  const factory _JournalEntryModel(
      {required final String id,
      required final String userId,
      final String? mood,
      final int? energy,
      final int? stress,
      required final String message,
      final DateTime? createdAt}) = _$JournalEntryModelImpl;

  factory _JournalEntryModel.fromJson(Map<String, dynamic> json) =
      _$JournalEntryModelImpl.fromJson;

  @override
  String get id;
  @override
  String get userId;
  @override
  String? get mood;
  @override
  int? get energy;
  @override
  int? get stress;
  @override
  String get message;
  @override
  DateTime? get createdAt;
  @override
  @JsonKey(ignore: true)
  _$$JournalEntryModelImplCopyWith<_$JournalEntryModelImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
mixin _$ChatMessage {
  String get id => throw _privateConstructorUsedError;
  String get role => throw _privateConstructorUsedError;
  String get content => throw _privateConstructorUsedError;
  DateTime? get createdAt => throw _privateConstructorUsedError;
  bool get isStreaming => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $ChatMessageCopyWith<ChatMessage> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ChatMessageCopyWith<$Res> {
  factory $ChatMessageCopyWith(
          ChatMessage value, $Res Function(ChatMessage) then) =
      _$ChatMessageCopyWithImpl<$Res, ChatMessage>;
  @useResult
  $Res call(
      {String id,
      String role,
      String content,
      DateTime? createdAt,
      bool isStreaming});
}

/// @nodoc
class _$ChatMessageCopyWithImpl<$Res, $Val extends ChatMessage>
    implements $ChatMessageCopyWith<$Res> {
  _$ChatMessageCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? role = null,
    Object? content = null,
    Object? createdAt = freezed,
    Object? isStreaming = null,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      role: null == role
          ? _value.role
          : role // ignore: cast_nullable_to_non_nullable
              as String,
      content: null == content
          ? _value.content
          : content // ignore: cast_nullable_to_non_nullable
              as String,
      createdAt: freezed == createdAt
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      isStreaming: null == isStreaming
          ? _value.isStreaming
          : isStreaming // ignore: cast_nullable_to_non_nullable
              as bool,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$ChatMessageImplCopyWith<$Res>
    implements $ChatMessageCopyWith<$Res> {
  factory _$$ChatMessageImplCopyWith(
          _$ChatMessageImpl value, $Res Function(_$ChatMessageImpl) then) =
      __$$ChatMessageImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String id,
      String role,
      String content,
      DateTime? createdAt,
      bool isStreaming});
}

/// @nodoc
class __$$ChatMessageImplCopyWithImpl<$Res>
    extends _$ChatMessageCopyWithImpl<$Res, _$ChatMessageImpl>
    implements _$$ChatMessageImplCopyWith<$Res> {
  __$$ChatMessageImplCopyWithImpl(
      _$ChatMessageImpl _value, $Res Function(_$ChatMessageImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? role = null,
    Object? content = null,
    Object? createdAt = freezed,
    Object? isStreaming = null,
  }) {
    return _then(_$ChatMessageImpl(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      role: null == role
          ? _value.role
          : role // ignore: cast_nullable_to_non_nullable
              as String,
      content: null == content
          ? _value.content
          : content // ignore: cast_nullable_to_non_nullable
              as String,
      createdAt: freezed == createdAt
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      isStreaming: null == isStreaming
          ? _value.isStreaming
          : isStreaming // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// @nodoc

class _$ChatMessageImpl implements _ChatMessage {
  const _$ChatMessageImpl(
      {required this.id,
      required this.role,
      required this.content,
      this.createdAt,
      this.isStreaming = false});

  @override
  final String id;
  @override
  final String role;
  @override
  final String content;
  @override
  final DateTime? createdAt;
  @override
  @JsonKey()
  final bool isStreaming;

  @override
  String toString() {
    return 'ChatMessage(id: $id, role: $role, content: $content, createdAt: $createdAt, isStreaming: $isStreaming)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ChatMessageImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.role, role) || other.role == role) &&
            (identical(other.content, content) || other.content == content) &&
            (identical(other.createdAt, createdAt) ||
                other.createdAt == createdAt) &&
            (identical(other.isStreaming, isStreaming) ||
                other.isStreaming == isStreaming));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, id, role, content, createdAt, isStreaming);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$ChatMessageImplCopyWith<_$ChatMessageImpl> get copyWith =>
      __$$ChatMessageImplCopyWithImpl<_$ChatMessageImpl>(this, _$identity);
}

abstract class _ChatMessage implements ChatMessage {
  const factory _ChatMessage(
      {required final String id,
      required final String role,
      required final String content,
      final DateTime? createdAt,
      final bool isStreaming}) = _$ChatMessageImpl;

  @override
  String get id;
  @override
  String get role;
  @override
  String get content;
  @override
  DateTime? get createdAt;
  @override
  bool get isStreaming;
  @override
  @JsonKey(ignore: true)
  _$$ChatMessageImplCopyWith<_$ChatMessageImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
