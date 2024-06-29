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
  @JsonKey(name: 'input_data')
  List<int>? get inputData => throw _privateConstructorUsedError;
  @JsonKey(name: 'predictions')
  List<double>? get predicitons => throw _privateConstructorUsedError;

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
      {@JsonKey(name: 'input_data') List<int>? inputData,
      @JsonKey(name: 'predictions') List<double>? predicitons});
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
    Object? inputData = freezed,
    Object? predicitons = freezed,
  }) {
    return _then(_value.copyWith(
      inputData: freezed == inputData
          ? _value.inputData
          : inputData // ignore: cast_nullable_to_non_nullable
              as List<int>?,
      predicitons: freezed == predicitons
          ? _value.predicitons
          : predicitons // ignore: cast_nullable_to_non_nullable
              as List<double>?,
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
      {@JsonKey(name: 'input_data') List<int>? inputData,
      @JsonKey(name: 'predictions') List<double>? predicitons});
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
    Object? inputData = freezed,
    Object? predicitons = freezed,
  }) {
    return _then(_$PredictResponseImpl(
      inputData: freezed == inputData
          ? _value._inputData
          : inputData // ignore: cast_nullable_to_non_nullable
              as List<int>?,
      predicitons: freezed == predicitons
          ? _value._predicitons
          : predicitons // ignore: cast_nullable_to_non_nullable
              as List<double>?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$PredictResponseImpl implements _PredictResponse {
  _$PredictResponseImpl(
      {@JsonKey(name: 'input_data') final List<int>? inputData,
      @JsonKey(name: 'predictions') final List<double>? predicitons})
      : _inputData = inputData,
        _predicitons = predicitons;

  factory _$PredictResponseImpl.fromJson(Map<String, dynamic> json) =>
      _$$PredictResponseImplFromJson(json);

  final List<int>? _inputData;
  @override
  @JsonKey(name: 'input_data')
  List<int>? get inputData {
    final value = _inputData;
    if (value == null) return null;
    if (_inputData is EqualUnmodifiableListView) return _inputData;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  final List<double>? _predicitons;
  @override
  @JsonKey(name: 'predictions')
  List<double>? get predicitons {
    final value = _predicitons;
    if (value == null) return null;
    if (_predicitons is EqualUnmodifiableListView) return _predicitons;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  @override
  String toString() {
    return 'PredictResponse(inputData: $inputData, predicitons: $predicitons)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$PredictResponseImpl &&
            const DeepCollectionEquality()
                .equals(other._inputData, _inputData) &&
            const DeepCollectionEquality()
                .equals(other._predicitons, _predicitons));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(_inputData),
      const DeepCollectionEquality().hash(_predicitons));

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
          {@JsonKey(name: 'input_data') final List<int>? inputData,
          @JsonKey(name: 'predictions') final List<double>? predicitons}) =
      _$PredictResponseImpl;

  factory _PredictResponse.fromJson(Map<String, dynamic> json) =
      _$PredictResponseImpl.fromJson;

  @override
  @JsonKey(name: 'input_data')
  List<int>? get inputData;
  @override
  @JsonKey(name: 'predictions')
  List<double>? get predicitons;
  @override
  @JsonKey(ignore: true)
  _$$PredictResponseImplCopyWith<_$PredictResponseImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
