// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'ai_suggestion_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

AiSuggestionModel _$AiSuggestionModelFromJson(Map<String, dynamic> json) {
  return _AiSuggestionModel.fromJson(json);
}

/// @nodoc
mixin _$AiSuggestionModel {
  String get id => throw _privateConstructorUsedError;
  String get userId => throw _privateConstructorUsedError;
  String get title => throw _privateConstructorUsedError;
  String get description => throw _privateConstructorUsedError;
  @TaskPriorityConverter()
  TaskPriority get priority => throw _privateConstructorUsedError;
  String get reasoning => throw _privateConstructorUsedError;
  @JsonKey(name: 'suggested_date')
  DateTime? get suggestedDate => throw _privateConstructorUsedError;
  @SuggestionStatusConverter()
  SuggestionStatus get status => throw _privateConstructorUsedError;
  DateTime? get createdAt => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $AiSuggestionModelCopyWith<AiSuggestionModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $AiSuggestionModelCopyWith<$Res> {
  factory $AiSuggestionModelCopyWith(
          AiSuggestionModel value, $Res Function(AiSuggestionModel) then) =
      _$AiSuggestionModelCopyWithImpl<$Res, AiSuggestionModel>;
  @useResult
  $Res call(
      {String id,
      String userId,
      String title,
      String description,
      @TaskPriorityConverter() TaskPriority priority,
      String reasoning,
      @JsonKey(name: 'suggested_date') DateTime? suggestedDate,
      @SuggestionStatusConverter() SuggestionStatus status,
      DateTime? createdAt});
}

/// @nodoc
class _$AiSuggestionModelCopyWithImpl<$Res, $Val extends AiSuggestionModel>
    implements $AiSuggestionModelCopyWith<$Res> {
  _$AiSuggestionModelCopyWithImpl(this._value, this._then);

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
    Object? priority = null,
    Object? reasoning = null,
    Object? suggestedDate = freezed,
    Object? status = null,
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
      title: null == title
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as String,
      description: null == description
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String,
      priority: null == priority
          ? _value.priority
          : priority // ignore: cast_nullable_to_non_nullable
              as TaskPriority,
      reasoning: null == reasoning
          ? _value.reasoning
          : reasoning // ignore: cast_nullable_to_non_nullable
              as String,
      suggestedDate: freezed == suggestedDate
          ? _value.suggestedDate
          : suggestedDate // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      status: null == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as SuggestionStatus,
      createdAt: freezed == createdAt
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as DateTime?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$AiSuggestionModelImplCopyWith<$Res>
    implements $AiSuggestionModelCopyWith<$Res> {
  factory _$$AiSuggestionModelImplCopyWith(_$AiSuggestionModelImpl value,
          $Res Function(_$AiSuggestionModelImpl) then) =
      __$$AiSuggestionModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String id,
      String userId,
      String title,
      String description,
      @TaskPriorityConverter() TaskPriority priority,
      String reasoning,
      @JsonKey(name: 'suggested_date') DateTime? suggestedDate,
      @SuggestionStatusConverter() SuggestionStatus status,
      DateTime? createdAt});
}

/// @nodoc
class __$$AiSuggestionModelImplCopyWithImpl<$Res>
    extends _$AiSuggestionModelCopyWithImpl<$Res, _$AiSuggestionModelImpl>
    implements _$$AiSuggestionModelImplCopyWith<$Res> {
  __$$AiSuggestionModelImplCopyWithImpl(_$AiSuggestionModelImpl _value,
      $Res Function(_$AiSuggestionModelImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? userId = null,
    Object? title = null,
    Object? description = null,
    Object? priority = null,
    Object? reasoning = null,
    Object? suggestedDate = freezed,
    Object? status = null,
    Object? createdAt = freezed,
  }) {
    return _then(_$AiSuggestionModelImpl(
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
      priority: null == priority
          ? _value.priority
          : priority // ignore: cast_nullable_to_non_nullable
              as TaskPriority,
      reasoning: null == reasoning
          ? _value.reasoning
          : reasoning // ignore: cast_nullable_to_non_nullable
              as String,
      suggestedDate: freezed == suggestedDate
          ? _value.suggestedDate
          : suggestedDate // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      status: null == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as SuggestionStatus,
      createdAt: freezed == createdAt
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as DateTime?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$AiSuggestionModelImpl implements _AiSuggestionModel {
  const _$AiSuggestionModelImpl(
      {required this.id,
      required this.userId,
      required this.title,
      this.description = '',
      @TaskPriorityConverter() this.priority = TaskPriority.medium,
      this.reasoning = '',
      @JsonKey(name: 'suggested_date') this.suggestedDate,
      @SuggestionStatusConverter() this.status = SuggestionStatus.pending,
      this.createdAt});

  factory _$AiSuggestionModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$AiSuggestionModelImplFromJson(json);

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
  @JsonKey()
  @TaskPriorityConverter()
  final TaskPriority priority;
  @override
  @JsonKey()
  final String reasoning;
  @override
  @JsonKey(name: 'suggested_date')
  final DateTime? suggestedDate;
  @override
  @JsonKey()
  @SuggestionStatusConverter()
  final SuggestionStatus status;
  @override
  final DateTime? createdAt;

  @override
  String toString() {
    return 'AiSuggestionModel(id: $id, userId: $userId, title: $title, description: $description, priority: $priority, reasoning: $reasoning, suggestedDate: $suggestedDate, status: $status, createdAt: $createdAt)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$AiSuggestionModelImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.userId, userId) || other.userId == userId) &&
            (identical(other.title, title) || other.title == title) &&
            (identical(other.description, description) ||
                other.description == description) &&
            (identical(other.priority, priority) ||
                other.priority == priority) &&
            (identical(other.reasoning, reasoning) ||
                other.reasoning == reasoning) &&
            (identical(other.suggestedDate, suggestedDate) ||
                other.suggestedDate == suggestedDate) &&
            (identical(other.status, status) || other.status == status) &&
            (identical(other.createdAt, createdAt) ||
                other.createdAt == createdAt));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, id, userId, title, description,
      priority, reasoning, suggestedDate, status, createdAt);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$AiSuggestionModelImplCopyWith<_$AiSuggestionModelImpl> get copyWith =>
      __$$AiSuggestionModelImplCopyWithImpl<_$AiSuggestionModelImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$AiSuggestionModelImplToJson(
      this,
    );
  }
}

abstract class _AiSuggestionModel implements AiSuggestionModel {
  const factory _AiSuggestionModel(
      {required final String id,
      required final String userId,
      required final String title,
      final String description,
      @TaskPriorityConverter() final TaskPriority priority,
      final String reasoning,
      @JsonKey(name: 'suggested_date') final DateTime? suggestedDate,
      @SuggestionStatusConverter() final SuggestionStatus status,
      final DateTime? createdAt}) = _$AiSuggestionModelImpl;

  factory _AiSuggestionModel.fromJson(Map<String, dynamic> json) =
      _$AiSuggestionModelImpl.fromJson;

  @override
  String get id;
  @override
  String get userId;
  @override
  String get title;
  @override
  String get description;
  @override
  @TaskPriorityConverter()
  TaskPriority get priority;
  @override
  String get reasoning;
  @override
  @JsonKey(name: 'suggested_date')
  DateTime? get suggestedDate;
  @override
  @SuggestionStatusConverter()
  SuggestionStatus get status;
  @override
  DateTime? get createdAt;
  @override
  @JsonKey(ignore: true)
  _$$AiSuggestionModelImplCopyWith<_$AiSuggestionModelImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
