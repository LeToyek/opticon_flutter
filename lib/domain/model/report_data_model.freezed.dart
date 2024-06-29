// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'report_data_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

ReportDataModel _$ReportDataModelFromJson(Map<String, dynamic> json) {
  return _ReportDataModel.fromJson(json);
}

/// @nodoc
mixin _$ReportDataModel {
  @JsonKey(name: 'bpm_value')
  int? get bpmValue => throw _privateConstructorUsedError;
  @JsonKey(name: 'blink_count')
  int? get blinkCount => throw _privateConstructorUsedError;
  @JsonKey(name: 'highest_blink_duration')
  int? get highestBlinkDuration => throw _privateConstructorUsedError;
  @TimestampConverter()
  Timestamp? get createdAt => throw _privateConstructorUsedError;
  @JsonKey(name: 'is_prediction')
  String? get isPrediction => throw _privateConstructorUsedError;
  @JsonKey(name: 'user_id')
  String? get userId => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $ReportDataModelCopyWith<ReportDataModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ReportDataModelCopyWith<$Res> {
  factory $ReportDataModelCopyWith(
          ReportDataModel value, $Res Function(ReportDataModel) then) =
      _$ReportDataModelCopyWithImpl<$Res, ReportDataModel>;
  @useResult
  $Res call(
      {@JsonKey(name: 'bpm_value') int? bpmValue,
      @JsonKey(name: 'blink_count') int? blinkCount,
      @JsonKey(name: 'highest_blink_duration') int? highestBlinkDuration,
      @TimestampConverter() Timestamp? createdAt,
      @JsonKey(name: 'is_prediction') String? isPrediction,
      @JsonKey(name: 'user_id') String? userId});
}

/// @nodoc
class _$ReportDataModelCopyWithImpl<$Res, $Val extends ReportDataModel>
    implements $ReportDataModelCopyWith<$Res> {
  _$ReportDataModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? bpmValue = freezed,
    Object? blinkCount = freezed,
    Object? highestBlinkDuration = freezed,
    Object? createdAt = freezed,
    Object? isPrediction = freezed,
    Object? userId = freezed,
  }) {
    return _then(_value.copyWith(
      bpmValue: freezed == bpmValue
          ? _value.bpmValue
          : bpmValue // ignore: cast_nullable_to_non_nullable
              as int?,
      blinkCount: freezed == blinkCount
          ? _value.blinkCount
          : blinkCount // ignore: cast_nullable_to_non_nullable
              as int?,
      highestBlinkDuration: freezed == highestBlinkDuration
          ? _value.highestBlinkDuration
          : highestBlinkDuration // ignore: cast_nullable_to_non_nullable
              as int?,
      createdAt: freezed == createdAt
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as Timestamp?,
      isPrediction: freezed == isPrediction
          ? _value.isPrediction
          : isPrediction // ignore: cast_nullable_to_non_nullable
              as String?,
      userId: freezed == userId
          ? _value.userId
          : userId // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$ReportDataModelImplCopyWith<$Res>
    implements $ReportDataModelCopyWith<$Res> {
  factory _$$ReportDataModelImplCopyWith(_$ReportDataModelImpl value,
          $Res Function(_$ReportDataModelImpl) then) =
      __$$ReportDataModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: 'bpm_value') int? bpmValue,
      @JsonKey(name: 'blink_count') int? blinkCount,
      @JsonKey(name: 'highest_blink_duration') int? highestBlinkDuration,
      @TimestampConverter() Timestamp? createdAt,
      @JsonKey(name: 'is_prediction') String? isPrediction,
      @JsonKey(name: 'user_id') String? userId});
}

/// @nodoc
class __$$ReportDataModelImplCopyWithImpl<$Res>
    extends _$ReportDataModelCopyWithImpl<$Res, _$ReportDataModelImpl>
    implements _$$ReportDataModelImplCopyWith<$Res> {
  __$$ReportDataModelImplCopyWithImpl(
      _$ReportDataModelImpl _value, $Res Function(_$ReportDataModelImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? bpmValue = freezed,
    Object? blinkCount = freezed,
    Object? highestBlinkDuration = freezed,
    Object? createdAt = freezed,
    Object? isPrediction = freezed,
    Object? userId = freezed,
  }) {
    return _then(_$ReportDataModelImpl(
      bpmValue: freezed == bpmValue
          ? _value.bpmValue
          : bpmValue // ignore: cast_nullable_to_non_nullable
              as int?,
      blinkCount: freezed == blinkCount
          ? _value.blinkCount
          : blinkCount // ignore: cast_nullable_to_non_nullable
              as int?,
      highestBlinkDuration: freezed == highestBlinkDuration
          ? _value.highestBlinkDuration
          : highestBlinkDuration // ignore: cast_nullable_to_non_nullable
              as int?,
      createdAt: freezed == createdAt
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as Timestamp?,
      isPrediction: freezed == isPrediction
          ? _value.isPrediction
          : isPrediction // ignore: cast_nullable_to_non_nullable
              as String?,
      userId: freezed == userId
          ? _value.userId
          : userId // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$ReportDataModelImpl implements _ReportDataModel {
  _$ReportDataModelImpl(
      {@JsonKey(name: 'bpm_value') this.bpmValue,
      @JsonKey(name: 'blink_count') this.blinkCount,
      @JsonKey(name: 'highest_blink_duration') this.highestBlinkDuration,
      @TimestampConverter() this.createdAt,
      @JsonKey(name: 'is_prediction') this.isPrediction,
      @JsonKey(name: 'user_id') this.userId});

  factory _$ReportDataModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$ReportDataModelImplFromJson(json);

  @override
  @JsonKey(name: 'bpm_value')
  final int? bpmValue;
  @override
  @JsonKey(name: 'blink_count')
  final int? blinkCount;
  @override
  @JsonKey(name: 'highest_blink_duration')
  final int? highestBlinkDuration;
  @override
  @TimestampConverter()
  final Timestamp? createdAt;
  @override
  @JsonKey(name: 'is_prediction')
  final String? isPrediction;
  @override
  @JsonKey(name: 'user_id')
  final String? userId;

  @override
  String toString() {
    return 'ReportDataModel(bpmValue: $bpmValue, blinkCount: $blinkCount, highestBlinkDuration: $highestBlinkDuration, createdAt: $createdAt, isPrediction: $isPrediction, userId: $userId)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ReportDataModelImpl &&
            (identical(other.bpmValue, bpmValue) ||
                other.bpmValue == bpmValue) &&
            (identical(other.blinkCount, blinkCount) ||
                other.blinkCount == blinkCount) &&
            (identical(other.highestBlinkDuration, highestBlinkDuration) ||
                other.highestBlinkDuration == highestBlinkDuration) &&
            (identical(other.createdAt, createdAt) ||
                other.createdAt == createdAt) &&
            (identical(other.isPrediction, isPrediction) ||
                other.isPrediction == isPrediction) &&
            (identical(other.userId, userId) || other.userId == userId));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, bpmValue, blinkCount,
      highestBlinkDuration, createdAt, isPrediction, userId);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$ReportDataModelImplCopyWith<_$ReportDataModelImpl> get copyWith =>
      __$$ReportDataModelImplCopyWithImpl<_$ReportDataModelImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$ReportDataModelImplToJson(
      this,
    );
  }
}

abstract class _ReportDataModel implements ReportDataModel {
  factory _ReportDataModel(
      {@JsonKey(name: 'bpm_value') final int? bpmValue,
      @JsonKey(name: 'blink_count') final int? blinkCount,
      @JsonKey(name: 'highest_blink_duration') final int? highestBlinkDuration,
      @TimestampConverter() final Timestamp? createdAt,
      @JsonKey(name: 'is_prediction') final String? isPrediction,
      @JsonKey(name: 'user_id') final String? userId}) = _$ReportDataModelImpl;

  factory _ReportDataModel.fromJson(Map<String, dynamic> json) =
      _$ReportDataModelImpl.fromJson;

  @override
  @JsonKey(name: 'bpm_value')
  int? get bpmValue;
  @override
  @JsonKey(name: 'blink_count')
  int? get blinkCount;
  @override
  @JsonKey(name: 'highest_blink_duration')
  int? get highestBlinkDuration;
  @override
  @TimestampConverter()
  Timestamp? get createdAt;
  @override
  @JsonKey(name: 'is_prediction')
  String? get isPrediction;
  @override
  @JsonKey(name: 'user_id')
  String? get userId;
  @override
  @JsonKey(ignore: true)
  _$$ReportDataModelImplCopyWith<_$ReportDataModelImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
