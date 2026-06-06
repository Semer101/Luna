// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'schedule_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

ScheduleBlock _$ScheduleBlockFromJson(Map<String, dynamic> json) {
  return _ScheduleBlock.fromJson(json);
}

/// @nodoc
mixin _$ScheduleBlock {
  /// Time in 24-hour "HH:mm" format (e.g. "08:00").
  String get time => throw _privateConstructorUsedError;

  /// Short, human-readable description of the activity.
  String get activity => throw _privateConstructorUsedError;

  /// Optional duration in minutes. Inferred from neighbouring blocks when null.
  int get durationMinutes => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $ScheduleBlockCopyWith<ScheduleBlock> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ScheduleBlockCopyWith<$Res> {
  factory $ScheduleBlockCopyWith(
          ScheduleBlock value, $Res Function(ScheduleBlock) then) =
      _$ScheduleBlockCopyWithImpl<$Res, ScheduleBlock>;
  @useResult
  $Res call({String time, String activity, int durationMinutes});
}

/// @nodoc
class _$ScheduleBlockCopyWithImpl<$Res, $Val extends ScheduleBlock>
    implements $ScheduleBlockCopyWith<$Res> {
  _$ScheduleBlockCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? time = null,
    Object? activity = null,
    Object? durationMinutes = null,
  }) {
    return _then(_value.copyWith(
      time: null == time
          ? _value.time
          : time // ignore: cast_nullable_to_non_nullable
              as String,
      activity: null == activity
          ? _value.activity
          : activity // ignore: cast_nullable_to_non_nullable
              as String,
      durationMinutes: null == durationMinutes
          ? _value.durationMinutes
          : durationMinutes // ignore: cast_nullable_to_non_nullable
              as int,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$ScheduleBlockImplCopyWith<$Res>
    implements $ScheduleBlockCopyWith<$Res> {
  factory _$$ScheduleBlockImplCopyWith(
          _$ScheduleBlockImpl value, $Res Function(_$ScheduleBlockImpl) then) =
      __$$ScheduleBlockImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String time, String activity, int durationMinutes});
}

/// @nodoc
class __$$ScheduleBlockImplCopyWithImpl<$Res>
    extends _$ScheduleBlockCopyWithImpl<$Res, _$ScheduleBlockImpl>
    implements _$$ScheduleBlockImplCopyWith<$Res> {
  __$$ScheduleBlockImplCopyWithImpl(
      _$ScheduleBlockImpl _value, $Res Function(_$ScheduleBlockImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? time = null,
    Object? activity = null,
    Object? durationMinutes = null,
  }) {
    return _then(_$ScheduleBlockImpl(
      time: null == time
          ? _value.time
          : time // ignore: cast_nullable_to_non_nullable
              as String,
      activity: null == activity
          ? _value.activity
          : activity // ignore: cast_nullable_to_non_nullable
              as String,
      durationMinutes: null == durationMinutes
          ? _value.durationMinutes
          : durationMinutes // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$ScheduleBlockImpl implements _ScheduleBlock {
  const _$ScheduleBlockImpl(
      {required this.time, required this.activity, this.durationMinutes = 60});

  factory _$ScheduleBlockImpl.fromJson(Map<String, dynamic> json) =>
      _$$ScheduleBlockImplFromJson(json);

  /// Time in 24-hour "HH:mm" format (e.g. "08:00").
  @override
  final String time;

  /// Short, human-readable description of the activity.
  @override
  final String activity;

  /// Optional duration in minutes. Inferred from neighbouring blocks when null.
  @override
  @JsonKey()
  final int durationMinutes;

  @override
  String toString() {
    return 'ScheduleBlock(time: $time, activity: $activity, durationMinutes: $durationMinutes)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ScheduleBlockImpl &&
            (identical(other.time, time) || other.time == time) &&
            (identical(other.activity, activity) ||
                other.activity == activity) &&
            (identical(other.durationMinutes, durationMinutes) ||
                other.durationMinutes == durationMinutes));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, time, activity, durationMinutes);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$ScheduleBlockImplCopyWith<_$ScheduleBlockImpl> get copyWith =>
      __$$ScheduleBlockImplCopyWithImpl<_$ScheduleBlockImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$ScheduleBlockImplToJson(
      this,
    );
  }
}

abstract class _ScheduleBlock implements ScheduleBlock {
  const factory _ScheduleBlock(
      {required final String time,
      required final String activity,
      final int durationMinutes}) = _$ScheduleBlockImpl;

  factory _ScheduleBlock.fromJson(Map<String, dynamic> json) =
      _$ScheduleBlockImpl.fromJson;

  @override

  /// Time in 24-hour "HH:mm" format (e.g. "08:00").
  String get time;
  @override

  /// Short, human-readable description of the activity.
  String get activity;
  @override

  /// Optional duration in minutes. Inferred from neighbouring blocks when null.
  int get durationMinutes;
  @override
  @JsonKey(ignore: true)
  _$$ScheduleBlockImplCopyWith<_$ScheduleBlockImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

ScheduleModel _$ScheduleModelFromJson(Map<String, dynamic> json) {
  return _ScheduleModel.fromJson(json);
}

/// @nodoc
mixin _$ScheduleModel {
  /// The date the schedule is for. Defaults to today when not supplied.
  DateTime get date => throw _privateConstructorUsedError;

  /// Ordered list of time blocks that make up the day.
  List<ScheduleBlock> get blocks => throw _privateConstructorUsedError;

  /// Optional intro / context text shown above the blocks.
  String get intro => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $ScheduleModelCopyWith<ScheduleModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ScheduleModelCopyWith<$Res> {
  factory $ScheduleModelCopyWith(
          ScheduleModel value, $Res Function(ScheduleModel) then) =
      _$ScheduleModelCopyWithImpl<$Res, ScheduleModel>;
  @useResult
  $Res call({DateTime date, List<ScheduleBlock> blocks, String intro});
}

/// @nodoc
class _$ScheduleModelCopyWithImpl<$Res, $Val extends ScheduleModel>
    implements $ScheduleModelCopyWith<$Res> {
  _$ScheduleModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? date = null,
    Object? blocks = null,
    Object? intro = null,
  }) {
    return _then(_value.copyWith(
      date: null == date
          ? _value.date
          : date // ignore: cast_nullable_to_non_nullable
              as DateTime,
      blocks: null == blocks
          ? _value.blocks
          : blocks // ignore: cast_nullable_to_non_nullable
              as List<ScheduleBlock>,
      intro: null == intro
          ? _value.intro
          : intro // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$ScheduleModelImplCopyWith<$Res>
    implements $ScheduleModelCopyWith<$Res> {
  factory _$$ScheduleModelImplCopyWith(
          _$ScheduleModelImpl value, $Res Function(_$ScheduleModelImpl) then) =
      __$$ScheduleModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({DateTime date, List<ScheduleBlock> blocks, String intro});
}

/// @nodoc
class __$$ScheduleModelImplCopyWithImpl<$Res>
    extends _$ScheduleModelCopyWithImpl<$Res, _$ScheduleModelImpl>
    implements _$$ScheduleModelImplCopyWith<$Res> {
  __$$ScheduleModelImplCopyWithImpl(
      _$ScheduleModelImpl _value, $Res Function(_$ScheduleModelImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? date = null,
    Object? blocks = null,
    Object? intro = null,
  }) {
    return _then(_$ScheduleModelImpl(
      date: null == date
          ? _value.date
          : date // ignore: cast_nullable_to_non_nullable
              as DateTime,
      blocks: null == blocks
          ? _value._blocks
          : blocks // ignore: cast_nullable_to_non_nullable
              as List<ScheduleBlock>,
      intro: null == intro
          ? _value.intro
          : intro // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$ScheduleModelImpl implements _ScheduleModel {
  const _$ScheduleModelImpl(
      {required this.date,
      required final List<ScheduleBlock> blocks,
      this.intro = ''})
      : _blocks = blocks;

  factory _$ScheduleModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$ScheduleModelImplFromJson(json);

  /// The date the schedule is for. Defaults to today when not supplied.
  @override
  final DateTime date;

  /// Ordered list of time blocks that make up the day.
  final List<ScheduleBlock> _blocks;

  /// Ordered list of time blocks that make up the day.
  @override
  List<ScheduleBlock> get blocks {
    if (_blocks is EqualUnmodifiableListView) return _blocks;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_blocks);
  }

  /// Optional intro / context text shown above the blocks.
  @override
  @JsonKey()
  final String intro;

  @override
  String toString() {
    return 'ScheduleModel(date: $date, blocks: $blocks, intro: $intro)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ScheduleModelImpl &&
            (identical(other.date, date) || other.date == date) &&
            const DeepCollectionEquality().equals(other._blocks, _blocks) &&
            (identical(other.intro, intro) || other.intro == intro));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType, date, const DeepCollectionEquality().hash(_blocks), intro);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$ScheduleModelImplCopyWith<_$ScheduleModelImpl> get copyWith =>
      __$$ScheduleModelImplCopyWithImpl<_$ScheduleModelImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$ScheduleModelImplToJson(
      this,
    );
  }
}

abstract class _ScheduleModel implements ScheduleModel {
  const factory _ScheduleModel(
      {required final DateTime date,
      required final List<ScheduleBlock> blocks,
      final String intro}) = _$ScheduleModelImpl;

  factory _ScheduleModel.fromJson(Map<String, dynamic> json) =
      _$ScheduleModelImpl.fromJson;

  @override

  /// The date the schedule is for. Defaults to today when not supplied.
  DateTime get date;
  @override

  /// Ordered list of time blocks that make up the day.
  List<ScheduleBlock> get blocks;
  @override

  /// Optional intro / context text shown above the blocks.
  String get intro;
  @override
  @JsonKey(ignore: true)
  _$$ScheduleModelImplCopyWith<_$ScheduleModelImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
