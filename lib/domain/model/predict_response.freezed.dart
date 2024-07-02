// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'predict_response.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

PredictResponse _$PredictResponseFromJson(Map<String, dynamic> json) {
  return _PredictResponse.fromJson(json);
}

/// @nodoc
mixin _$PredictResponse {
// @JsonKey(name: 'input_data') List<int>? inputData,
  @JsonKey(name: 'predictions')
  List<int>? get predicitons => throw _privateConstructorUsedError;
  @JsonKey(name: 'predictions_bpm')
  List<int>? get predicitonsBpm => throw _privateConstructorUsedError;
  @JsonKey(name: 'predictions_blink_duration')
  List<int>? get predicitonsBd => throw _privateConstructorUsedError;
  @JsonKey(name: 'accuracy_blink_count')
  double? get accuracyBlinkCount => throw _privateConstructorUsedError;
  @JsonKey(name: 'accuracy_highest_blink_duration')
  double? get accuracyHighestBlinkDuration =>
      throw _privateConstructorUsedError;
  @JsonKey(name: 'accuracy_bpm')
  double? get accuracyBpm => throw _privateConstructorUsedError;
  @JsonKey(name: 'mse')
  double? get mse => throw _privateConstructorUsedError;
  @JsonKey(name: 'mae')
  double? get mae => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $PredictResponseCopyWith<PredictResponse> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $PredictResponseCopyWith<$Res> {
  factory $PredictResponseCopyWith(
          PredictResponse value, $Res Function(PredictResponse) then) =
      _$PredictResponseCopyWithImpl<$Res, PredictResponse>;
  @useResult
  $Res call(
      {@JsonKey(name: 'predictions') List<int>? predicitons,
      @JsonKey(name: 'predictions_bpm') List<int>? predicitonsBpm,
      @JsonKey(name: 'predictions_blink_duration') List<int>? predicitonsBd,
      @JsonKey(name: 'accuracy_blink_count') double? accuracyBlinkCount,
      @JsonKey(name: 'accuracy_highest_blink_duration')
      double? accuracyHighestBlinkDuration,
      @JsonKey(name: 'accuracy_bpm') double? accuracyBpm,
      @JsonKey(name: 'mse') double? mse,
      @JsonKey(name: 'mae') double? mae});
}

/// @nodoc
class _$PredictResponseCopyWithImpl<$Res, $Val extends PredictResponse>
    implements $PredictResponseCopyWith<$Res> {
  _$PredictResponseCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? predicitons = freezed,
    Object? predicitonsBpm = freezed,
    Object? predicitonsBd = freezed,
    Object? accuracyBlinkCount = freezed,
    Object? accuracyHighestBlinkDuration = freezed,
    Object? accuracyBpm = freezed,
    Object? mse = freezed,
    Object? mae = freezed,
  }) {
    return _then(_value.copyWith(
      predicitons: freezed == predicitons
          ? _value.predicitons
          : predicitons // ignore: cast_nullable_to_non_nullable
              as List<int>?,
      predicitonsBpm: freezed == predicitonsBpm
          ? _value.predicitonsBpm
          : predicitonsBpm // ignore: cast_nullable_to_non_nullable
              as List<int>?,
      predicitonsBd: freezed == predicitonsBd
          ? _value.predicitonsBd
          : predicitonsBd // ignore: cast_nullable_to_non_nullable
              as List<int>?,
      accuracyBlinkCount: freezed == accuracyBlinkCount
          ? _value.accuracyBlinkCount
          : accuracyBlinkCount // ignore: cast_nullable_to_non_nullable
              as double?,
      accuracyHighestBlinkDuration: freezed == accuracyHighestBlinkDuration
          ? _value.accuracyHighestBlinkDuration
          : accuracyHighestBlinkDuration // ignore: cast_nullable_to_non_nullable
              as double?,
      accuracyBpm: freezed == accuracyBpm
          ? _value.accuracyBpm
          : accuracyBpm // ignore: cast_nullable_to_non_nullable
              as double?,
      mse: freezed == mse
          ? _value.mse
          : mse // ignore: cast_nullable_to_non_nullable
              as double?,
      mae: freezed == mae
          ? _value.mae
          : mae // ignore: cast_nullable_to_non_nullable
              as double?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$PredictResponseImplCopyWith<$Res>
    implements $PredictResponseCopyWith<$Res> {
  factory _$$PredictResponseImplCopyWith(_$PredictResponseImpl value,
          $Res Function(_$PredictResponseImpl) then) =
      __$$PredictResponseImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: 'predictions') List<int>? predicitons,
      @JsonKey(name: 'predictions_bpm') List<int>? predicitonsBpm,
      @JsonKey(name: 'predictions_blink_duration') List<int>? predicitonsBd,
      @JsonKey(name: 'accuracy_blink_count') double? accuracyBlinkCount,
      @JsonKey(name: 'accuracy_highest_blink_duration')
      double? accuracyHighestBlinkDuration,
      @JsonKey(name: 'accuracy_bpm') double? accuracyBpm,
      @JsonKey(name: 'mse') double? mse,
      @JsonKey(name: 'mae') double? mae});
}

/// @nodoc
class __$$PredictResponseImplCopyWithImpl<$Res>
    extends _$PredictResponseCopyWithImpl<$Res, _$PredictResponseImpl>
    implements _$$PredictResponseImplCopyWith<$Res> {
  __$$PredictResponseImplCopyWithImpl(
      _$PredictResponseImpl _value, $Res Function(_$PredictResponseImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? predicitons = freezed,
    Object? predicitonsBpm = freezed,
    Object? predicitonsBd = freezed,
    Object? accuracyBlinkCount = freezed,
    Object? accuracyHighestBlinkDuration = freezed,
    Object? accuracyBpm = freezed,
    Object? mse = freezed,
    Object? mae = freezed,
  }) {
    return _then(_$PredictResponseImpl(
      predicitons: freezed == predicitons
          ? _value._predicitons
          : predicitons // ignore: cast_nullable_to_non_nullable
              as List<int>?,
      predicitonsBpm: freezed == predicitonsBpm
          ? _value._predicitonsBpm
          : predicitonsBpm // ignore: cast_nullable_to_non_nullable
              as List<int>?,
      predicitonsBd: freezed == predicitonsBd
          ? _value._predicitonsBd
          : predicitonsBd // ignore: cast_nullable_to_non_nullable
              as List<int>?,
      accuracyBlinkCount: freezed == accuracyBlinkCount
          ? _value.accuracyBlinkCount
          : accuracyBlinkCount // ignore: cast_nullable_to_non_nullable
              as double?,
      accuracyHighestBlinkDuration: freezed == accuracyHighestBlinkDuration
          ? _value.accuracyHighestBlinkDuration
          : accuracyHighestBlinkDuration // ignore: cast_nullable_to_non_nullable
              as double?,
      accuracyBpm: freezed == accuracyBpm
          ? _value.accuracyBpm
          : accuracyBpm // ignore: cast_nullable_to_non_nullable
              as double?,
      mse: freezed == mse
          ? _value.mse
          : mse // ignore: cast_nullable_to_non_nullable
              as double?,
      mae: freezed == mae
          ? _value.mae
          : mae // ignore: cast_nullable_to_non_nullable
              as double?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$PredictResponseImpl implements _PredictResponse {
  _$PredictResponseImpl(
      {@JsonKey(name: 'predictions') final List<int>? predicitons,
      @JsonKey(name: 'predictions_bpm') final List<int>? predicitonsBpm,
      @JsonKey(name: 'predictions_blink_duration')
      final List<int>? predicitonsBd,
      @JsonKey(name: 'accuracy_blink_count') this.accuracyBlinkCount,
      @JsonKey(name: 'accuracy_highest_blink_duration')
      this.accuracyHighestBlinkDuration,
      @JsonKey(name: 'accuracy_bpm') this.accuracyBpm,
      @JsonKey(name: 'mse') this.mse,
      @JsonKey(name: 'mae') this.mae})
      : _predicitons = predicitons,
        _predicitonsBpm = predicitonsBpm,
        _predicitonsBd = predicitonsBd;

  factory _$PredictResponseImpl.fromJson(Map<String, dynamic> json) =>
      _$$PredictResponseImplFromJson(json);

// @JsonKey(name: 'input_data') List<int>? inputData,
  final List<int>? _predicitons;
// @JsonKey(name: 'input_data') List<int>? inputData,
  @override
  @JsonKey(name: 'predictions')
  List<int>? get predicitons {
    final value = _predicitons;
    if (value == null) return null;
    if (_predicitons is EqualUnmodifiableListView) return _predicitons;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  final List<int>? _predicitonsBpm;
  @override
  @JsonKey(name: 'predictions_bpm')
  List<int>? get predicitonsBpm {
    final value = _predicitonsBpm;
    if (value == null) return null;
    if (_predicitonsBpm is EqualUnmodifiableListView) return _predicitonsBpm;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  final List<int>? _predicitonsBd;
  @override
  @JsonKey(name: 'predictions_blink_duration')
  List<int>? get predicitonsBd {
    final value = _predicitonsBd;
    if (value == null) return null;
    if (_predicitonsBd is EqualUnmodifiableListView) return _predicitonsBd;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  @override
  @JsonKey(name: 'accuracy_blink_count')
  final double? accuracyBlinkCount;
  @override
  @JsonKey(name: 'accuracy_highest_blink_duration')
  final double? accuracyHighestBlinkDuration;
  @override
  @JsonKey(name: 'accuracy_bpm')
  final double? accuracyBpm;
  @override
  @JsonKey(name: 'mse')
  final double? mse;
  @override
  @JsonKey(name: 'mae')
  final double? mae;

  @override
  String toString() {
    return 'PredictResponse(predicitons: $predicitons, predicitonsBpm: $predicitonsBpm, predicitonsBd: $predicitonsBd, accuracyBlinkCount: $accuracyBlinkCount, accuracyHighestBlinkDuration: $accuracyHighestBlinkDuration, accuracyBpm: $accuracyBpm, mse: $mse, mae: $mae)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$PredictResponseImpl &&
            const DeepCollectionEquality()
                .equals(other._predicitons, _predicitons) &&
            const DeepCollectionEquality()
                .equals(other._predicitonsBpm, _predicitonsBpm) &&
            const DeepCollectionEquality()
                .equals(other._predicitonsBd, _predicitonsBd) &&
            (identical(other.accuracyBlinkCount, accuracyBlinkCount) ||
                other.accuracyBlinkCount == accuracyBlinkCount) &&
            (identical(other.accuracyHighestBlinkDuration,
                    accuracyHighestBlinkDuration) ||
                other.accuracyHighestBlinkDuration ==
                    accuracyHighestBlinkDuration) &&
            (identical(other.accuracyBpm, accuracyBpm) ||
                other.accuracyBpm == accuracyBpm) &&
            (identical(other.mse, mse) || other.mse == mse) &&
            (identical(other.mae, mae) || other.mae == mae));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(_predicitons),
      const DeepCollectionEquality().hash(_predicitonsBpm),
      const DeepCollectionEquality().hash(_predicitonsBd),
      accuracyBlinkCount,
      accuracyHighestBlinkDuration,
      accuracyBpm,
      mse,
      mae);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$PredictResponseImplCopyWith<_$PredictResponseImpl> get copyWith =>
      __$$PredictResponseImplCopyWithImpl<_$PredictResponseImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$PredictResponseImplToJson(
      this,
    );
  }
}

abstract class _PredictResponse implements PredictResponse {
  factory _PredictResponse(
      {@JsonKey(name: 'predictions') final List<int>? predicitons,
      @JsonKey(name: 'predictions_bpm') final List<int>? predicitonsBpm,
      @JsonKey(name: 'predictions_blink_duration')
      final List<int>? predicitonsBd,
      @JsonKey(name: 'accuracy_blink_count') final double? accuracyBlinkCount,
      @JsonKey(name: 'accuracy_highest_blink_duration')
      final double? accuracyHighestBlinkDuration,
      @JsonKey(name: 'accuracy_bpm') final double? accuracyBpm,
      @JsonKey(name: 'mse') final double? mse,
      @JsonKey(name: 'mae') final double? mae}) = _$PredictResponseImpl;

  factory _PredictResponse.fromJson(Map<String, dynamic> json) =
      _$PredictResponseImpl.fromJson;

  @override // @JsonKey(name: 'input_data') List<int>? inputData,
  @JsonKey(name: 'predictions')
  List<int>? get predicitons;
  @override
  @JsonKey(name: 'predictions_bpm')
  List<int>? get predicitonsBpm;
  @override
  @JsonKey(name: 'predictions_blink_duration')
  List<int>? get predicitonsBd;
  @override
  @JsonKey(name: 'accuracy_blink_count')
  double? get accuracyBlinkCount;
  @override
  @JsonKey(name: 'accuracy_highest_blink_duration')
  double? get accuracyHighestBlinkDuration;
  @override
  @JsonKey(name: 'accuracy_bpm')
  double? get accuracyBpm;
  @override
  @JsonKey(name: 'mse')
  double? get mse;
  @override
  @JsonKey(name: 'mae')
  double? get mae;
  @override
  @JsonKey(ignore: true)
  _$$PredictResponseImplCopyWith<_$PredictResponseImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
