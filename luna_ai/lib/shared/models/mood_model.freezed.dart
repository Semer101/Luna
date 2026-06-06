// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'mood_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

MoodModel _$MoodModelFromJson(Map<String, dynamic> json) {
  return _MoodModel.fromJson(json);
}

/// @nodoc
mixin _$MoodModel {
  String get id => throw _privateConstructorUsedError;
  String get userId => throw _privateConstructorUsedError;
  @MoodTypeConverter()
  MoodType get mood => throw _privateConstructorUsedError;
  int get energy => throw _privateConstructorUsedError;
  int get stress => throw _privateConstructorUsedError;
  String get source => throw _privateConstructorUsedError;
  DateTime? get createdAt => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $MoodModelCopyWith<MoodModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $MoodModelCopyWith<$Res> {
  factory $MoodModelCopyWith(MoodModel value, $Res Function(MoodModel) then) =
      _$MoodModelCopyWithImpl<$Res, MoodModel>;
  @useResult
  $Res call(
      {String id,
      String userId,
      @MoodTypeConverter() MoodType mood,
      int energy,
      int stress,
      String source,
      DateTime? createdAt});
}

/// @nodoc
class _$MoodModelCopyWithImpl<$Res, $Val extends MoodModel>
    implements $MoodModelCopyWith<$Res> {
  _$MoodModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? userId = null,
    Object? mood = null,
    Object? energy = null,
    Object? stress = null,
    Object? source = null,
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
      mood: null == mood
          ? _value.mood
          : mood // ignore: cast_nullable_to_non_nullable
              as MoodType,
      energy: null == energy
          ? _value.energy
          : energy // ignore: cast_nullable_to_non_nullable
              as int,
      stress: null == stress
          ? _value.stress
          : stress // ignore: cast_nullable_to_non_nullable
              as int,
      source: null == source
          ? _value.source
          : source // ignore: cast_nullable_to_non_nullable
              as String,
      createdAt: freezed == createdAt
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as DateTime?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$MoodModelImplCopyWith<$Res>
    implements $MoodModelCopyWith<$Res> {
  factory _$$MoodModelImplCopyWith(
          _$MoodModelImpl value, $Res Function(_$MoodModelImpl) then) =
      __$$MoodModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String id,
      String userId,
      @MoodTypeConverter() MoodType mood,
      int energy,
      int stress,
      String source,
      DateTime? createdAt});
}

/// @nodoc
class __$$MoodModelImplCopyWithImpl<$Res>
    extends _$MoodModelCopyWithImpl<$Res, _$MoodModelImpl>
    implements _$$MoodModelImplCopyWith<$Res> {
  __$$MoodModelImplCopyWithImpl(
      _$MoodModelImpl _value, $Res Function(_$MoodModelImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? userId = null,
    Object? mood = null,
    Object? energy = null,
    Object? stress = null,
    Object? source = null,
    Object? createdAt = freezed,
  }) {
    return _then(_$MoodModelImpl(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      userId: null == userId
          ? _value.userId
          : userId // ignore: cast_nullable_to_non_nullable
              as String,
      mood: null == mood
          ? _value.mood
          : mood // ignore: cast_nullable_to_non_nullable
              as MoodType,
      energy: null == energy
          ? _value.energy
          : energy // ignore: cast_nullable_to_non_nullable
              as int,
      stress: null == stress
          ? _value.stress
          : stress // ignore: cast_nullable_to_non_nullable
              as int,
      source: null == source
          ? _value.source
          : source // ignore: cast_nullable_to_non_nullable
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
class _$MoodModelImpl implements _MoodModel {
  const _$MoodModelImpl(
      {required this.id,
      required this.userId,
      @MoodTypeConverter() required this.mood,
      required this.energy,
      required this.stress,
      this.source = 'manual',
      this.createdAt});

  factory _$MoodModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$MoodModelImplFromJson(json);

  @override
  final String id;
  @override
  final String userId;
  @override
  @MoodTypeConverter()
  final MoodType mood;
  @override
  final int energy;
  @override
  final int stress;
  @override
  @JsonKey()
  final String source;
  @override
  final DateTime? createdAt;

  @override
  String toString() {
    return 'MoodModel(id: $id, userId: $userId, mood: $mood, energy: $energy, stress: $stress, source: $source, createdAt: $createdAt)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$MoodModelImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.userId, userId) || other.userId == userId) &&
            (identical(other.mood, mood) || other.mood == mood) &&
            (identical(other.energy, energy) || other.energy == energy) &&
            (identical(other.stress, stress) || other.stress == stress) &&
            (identical(other.source, source) || other.source == source) &&
            (identical(other.createdAt, createdAt) ||
                other.createdAt == createdAt));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType, id, userId, mood, energy, stress, source, createdAt);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$MoodModelImplCopyWith<_$MoodModelImpl> get copyWith =>
      __$$MoodModelImplCopyWithImpl<_$MoodModelImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$MoodModelImplToJson(
      this,
    );
  }
}

abstract class _MoodModel implements MoodModel {
  const factory _MoodModel(
      {required final String id,
      required final String userId,
      @MoodTypeConverter() required final MoodType mood,
      required final int energy,
      required final int stress,
      final String source,
      final DateTime? createdAt}) = _$MoodModelImpl;

  factory _MoodModel.fromJson(Map<String, dynamic> json) =
      _$MoodModelImpl.fromJson;

  @override
  String get id;
  @override
  String get userId;
  @override
  @MoodTypeConverter()
  MoodType get mood;
  @override
  int get energy;
  @override
  int get stress;
  @override
  String get source;
  @override
  DateTime? get createdAt;
  @override
  @JsonKey(ignore: true)
  _$$MoodModelImplCopyWith<_$MoodModelImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
