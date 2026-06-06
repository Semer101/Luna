// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'cycle_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

CycleModel _$CycleModelFromJson(Map<String, dynamic> json) {
  return _CycleModel.fromJson(json);
}

/// @nodoc
mixin _$CycleModel {
  String get id => throw _privateConstructorUsedError;
  String get userId => throw _privateConstructorUsedError;
  @JsonKey(name: 'last_period_date')
  DateTime get lastPeriodDate => throw _privateConstructorUsedError;
  @JsonKey(name: 'cycle_length')
  int get cycleLength => throw _privateConstructorUsedError;
  @JsonKey(name: 'period_duration')
  int get periodDuration => throw _privateConstructorUsedError;
  DateTime? get createdAt => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $CycleModelCopyWith<CycleModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $CycleModelCopyWith<$Res> {
  factory $CycleModelCopyWith(
          CycleModel value, $Res Function(CycleModel) then) =
      _$CycleModelCopyWithImpl<$Res, CycleModel>;
  @useResult
  $Res call(
      {String id,
      String userId,
      @JsonKey(name: 'last_period_date') DateTime lastPeriodDate,
      @JsonKey(name: 'cycle_length') int cycleLength,
      @JsonKey(name: 'period_duration') int periodDuration,
      DateTime? createdAt});
}

/// @nodoc
class _$CycleModelCopyWithImpl<$Res, $Val extends CycleModel>
    implements $CycleModelCopyWith<$Res> {
  _$CycleModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? userId = null,
    Object? lastPeriodDate = null,
    Object? cycleLength = null,
    Object? periodDuration = null,
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
      lastPeriodDate: null == lastPeriodDate
          ? _value.lastPeriodDate
          : lastPeriodDate // ignore: cast_nullable_to_non_nullable
              as DateTime,
      cycleLength: null == cycleLength
          ? _value.cycleLength
          : cycleLength // ignore: cast_nullable_to_non_nullable
              as int,
      periodDuration: null == periodDuration
          ? _value.periodDuration
          : periodDuration // ignore: cast_nullable_to_non_nullable
              as int,
      createdAt: freezed == createdAt
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as DateTime?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$CycleModelImplCopyWith<$Res>
    implements $CycleModelCopyWith<$Res> {
  factory _$$CycleModelImplCopyWith(
          _$CycleModelImpl value, $Res Function(_$CycleModelImpl) then) =
      __$$CycleModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String id,
      String userId,
      @JsonKey(name: 'last_period_date') DateTime lastPeriodDate,
      @JsonKey(name: 'cycle_length') int cycleLength,
      @JsonKey(name: 'period_duration') int periodDuration,
      DateTime? createdAt});
}

/// @nodoc
class __$$CycleModelImplCopyWithImpl<$Res>
    extends _$CycleModelCopyWithImpl<$Res, _$CycleModelImpl>
    implements _$$CycleModelImplCopyWith<$Res> {
  __$$CycleModelImplCopyWithImpl(
      _$CycleModelImpl _value, $Res Function(_$CycleModelImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? userId = null,
    Object? lastPeriodDate = null,
    Object? cycleLength = null,
    Object? periodDuration = null,
    Object? createdAt = freezed,
  }) {
    return _then(_$CycleModelImpl(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      userId: null == userId
          ? _value.userId
          : userId // ignore: cast_nullable_to_non_nullable
              as String,
      lastPeriodDate: null == lastPeriodDate
          ? _value.lastPeriodDate
          : lastPeriodDate // ignore: cast_nullable_to_non_nullable
              as DateTime,
      cycleLength: null == cycleLength
          ? _value.cycleLength
          : cycleLength // ignore: cast_nullable_to_non_nullable
              as int,
      periodDuration: null == periodDuration
          ? _value.periodDuration
          : periodDuration // ignore: cast_nullable_to_non_nullable
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
class _$CycleModelImpl implements _CycleModel {
  const _$CycleModelImpl(
      {required this.id,
      required this.userId,
      @JsonKey(name: 'last_period_date') required this.lastPeriodDate,
      @JsonKey(name: 'cycle_length') this.cycleLength = 28,
      @JsonKey(name: 'period_duration') this.periodDuration = 5,
      this.createdAt});

  factory _$CycleModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$CycleModelImplFromJson(json);

  @override
  final String id;
  @override
  final String userId;
  @override
  @JsonKey(name: 'last_period_date')
  final DateTime lastPeriodDate;
  @override
  @JsonKey(name: 'cycle_length')
  final int cycleLength;
  @override
  @JsonKey(name: 'period_duration')
  final int periodDuration;
  @override
  final DateTime? createdAt;

  @override
  String toString() {
    return 'CycleModel(id: $id, userId: $userId, lastPeriodDate: $lastPeriodDate, cycleLength: $cycleLength, periodDuration: $periodDuration, createdAt: $createdAt)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$CycleModelImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.userId, userId) || other.userId == userId) &&
            (identical(other.lastPeriodDate, lastPeriodDate) ||
                other.lastPeriodDate == lastPeriodDate) &&
            (identical(other.cycleLength, cycleLength) ||
                other.cycleLength == cycleLength) &&
            (identical(other.periodDuration, periodDuration) ||
                other.periodDuration == periodDuration) &&
            (identical(other.createdAt, createdAt) ||
                other.createdAt == createdAt));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, id, userId, lastPeriodDate,
      cycleLength, periodDuration, createdAt);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$CycleModelImplCopyWith<_$CycleModelImpl> get copyWith =>
      __$$CycleModelImplCopyWithImpl<_$CycleModelImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$CycleModelImplToJson(
      this,
    );
  }
}

abstract class _CycleModel implements CycleModel {
  const factory _CycleModel(
      {required final String id,
      required final String userId,
      @JsonKey(name: 'last_period_date') required final DateTime lastPeriodDate,
      @JsonKey(name: 'cycle_length') final int cycleLength,
      @JsonKey(name: 'period_duration') final int periodDuration,
      final DateTime? createdAt}) = _$CycleModelImpl;

  factory _CycleModel.fromJson(Map<String, dynamic> json) =
      _$CycleModelImpl.fromJson;

  @override
  String get id;
  @override
  String get userId;
  @override
  @JsonKey(name: 'last_period_date')
  DateTime get lastPeriodDate;
  @override
  @JsonKey(name: 'cycle_length')
  int get cycleLength;
  @override
  @JsonKey(name: 'period_duration')
  int get periodDuration;
  @override
  DateTime? get createdAt;
  @override
  @JsonKey(ignore: true)
  _$$CycleModelImplCopyWith<_$CycleModelImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
mixin _$CyclePhaseInfo {
  CyclePhase get phase => throw _privateConstructorUsedError;
  int get dayInCycle => throw _privateConstructorUsedError;
  int get daysUntilNextPeriod => throw _privateConstructorUsedError;
  double get phaseProgress => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $CyclePhaseInfoCopyWith<CyclePhaseInfo> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $CyclePhaseInfoCopyWith<$Res> {
  factory $CyclePhaseInfoCopyWith(
          CyclePhaseInfo value, $Res Function(CyclePhaseInfo) then) =
      _$CyclePhaseInfoCopyWithImpl<$Res, CyclePhaseInfo>;
  @useResult
  $Res call(
      {CyclePhase phase,
      int dayInCycle,
      int daysUntilNextPeriod,
      double phaseProgress});
}

/// @nodoc
class _$CyclePhaseInfoCopyWithImpl<$Res, $Val extends CyclePhaseInfo>
    implements $CyclePhaseInfoCopyWith<$Res> {
  _$CyclePhaseInfoCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? phase = null,
    Object? dayInCycle = null,
    Object? daysUntilNextPeriod = null,
    Object? phaseProgress = null,
  }) {
    return _then(_value.copyWith(
      phase: null == phase
          ? _value.phase
          : phase // ignore: cast_nullable_to_non_nullable
              as CyclePhase,
      dayInCycle: null == dayInCycle
          ? _value.dayInCycle
          : dayInCycle // ignore: cast_nullable_to_non_nullable
              as int,
      daysUntilNextPeriod: null == daysUntilNextPeriod
          ? _value.daysUntilNextPeriod
          : daysUntilNextPeriod // ignore: cast_nullable_to_non_nullable
              as int,
      phaseProgress: null == phaseProgress
          ? _value.phaseProgress
          : phaseProgress // ignore: cast_nullable_to_non_nullable
              as double,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$CyclePhaseInfoImplCopyWith<$Res>
    implements $CyclePhaseInfoCopyWith<$Res> {
  factory _$$CyclePhaseInfoImplCopyWith(_$CyclePhaseInfoImpl value,
          $Res Function(_$CyclePhaseInfoImpl) then) =
      __$$CyclePhaseInfoImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {CyclePhase phase,
      int dayInCycle,
      int daysUntilNextPeriod,
      double phaseProgress});
}

/// @nodoc
class __$$CyclePhaseInfoImplCopyWithImpl<$Res>
    extends _$CyclePhaseInfoCopyWithImpl<$Res, _$CyclePhaseInfoImpl>
    implements _$$CyclePhaseInfoImplCopyWith<$Res> {
  __$$CyclePhaseInfoImplCopyWithImpl(
      _$CyclePhaseInfoImpl _value, $Res Function(_$CyclePhaseInfoImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? phase = null,
    Object? dayInCycle = null,
    Object? daysUntilNextPeriod = null,
    Object? phaseProgress = null,
  }) {
    return _then(_$CyclePhaseInfoImpl(
      phase: null == phase
          ? _value.phase
          : phase // ignore: cast_nullable_to_non_nullable
              as CyclePhase,
      dayInCycle: null == dayInCycle
          ? _value.dayInCycle
          : dayInCycle // ignore: cast_nullable_to_non_nullable
              as int,
      daysUntilNextPeriod: null == daysUntilNextPeriod
          ? _value.daysUntilNextPeriod
          : daysUntilNextPeriod // ignore: cast_nullable_to_non_nullable
              as int,
      phaseProgress: null == phaseProgress
          ? _value.phaseProgress
          : phaseProgress // ignore: cast_nullable_to_non_nullable
              as double,
    ));
  }
}

/// @nodoc

class _$CyclePhaseInfoImpl implements _CyclePhaseInfo {
  const _$CyclePhaseInfoImpl(
      {required this.phase,
      required this.dayInCycle,
      required this.daysUntilNextPeriod,
      required this.phaseProgress});

  @override
  final CyclePhase phase;
  @override
  final int dayInCycle;
  @override
  final int daysUntilNextPeriod;
  @override
  final double phaseProgress;

  @override
  String toString() {
    return 'CyclePhaseInfo(phase: $phase, dayInCycle: $dayInCycle, daysUntilNextPeriod: $daysUntilNextPeriod, phaseProgress: $phaseProgress)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$CyclePhaseInfoImpl &&
            (identical(other.phase, phase) || other.phase == phase) &&
            (identical(other.dayInCycle, dayInCycle) ||
                other.dayInCycle == dayInCycle) &&
            (identical(other.daysUntilNextPeriod, daysUntilNextPeriod) ||
                other.daysUntilNextPeriod == daysUntilNextPeriod) &&
            (identical(other.phaseProgress, phaseProgress) ||
                other.phaseProgress == phaseProgress));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType, phase, dayInCycle, daysUntilNextPeriod, phaseProgress);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$CyclePhaseInfoImplCopyWith<_$CyclePhaseInfoImpl> get copyWith =>
      __$$CyclePhaseInfoImplCopyWithImpl<_$CyclePhaseInfoImpl>(
          this, _$identity);
}

abstract class _CyclePhaseInfo implements CyclePhaseInfo {
  const factory _CyclePhaseInfo(
      {required final CyclePhase phase,
      required final int dayInCycle,
      required final int daysUntilNextPeriod,
      required final double phaseProgress}) = _$CyclePhaseInfoImpl;

  @override
  CyclePhase get phase;
  @override
  int get dayInCycle;
  @override
  int get daysUntilNextPeriod;
  @override
  double get phaseProgress;
  @override
  @JsonKey(ignore: true)
  _$$CyclePhaseInfoImplCopyWith<_$CyclePhaseInfoImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
