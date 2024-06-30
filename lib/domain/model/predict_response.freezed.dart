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
      @JsonKey(name: 'predictions_blink_duration') List<int>? predicitonsBd});
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
      @JsonKey(name: 'predictions_blink_duration') List<int>? predicitonsBd});
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
      final List<int>? predicitonsBd})
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
  String toString() {
    return 'PredictResponse(predicitons: $predicitons, predicitonsBpm: $predicitonsBpm, predicitonsBd: $predicitonsBd)';
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
                .equals(other._predicitonsBd, _predicitonsBd));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(_predicitons),
      const DeepCollectionEquality().hash(_predicitonsBpm),
      const DeepCollectionEquality().hash(_predicitonsBd));

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
      final List<int>? predicitonsBd}) = _$PredictResponseImpl;

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
  @JsonKey(ignore: true)
  _$$PredictResponseImplCopyWith<_$PredictResponseImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
