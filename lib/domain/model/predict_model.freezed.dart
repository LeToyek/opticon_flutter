// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'predict_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

PredictModel _$PredictModelFromJson(Map<String, dynamic> json) {
  return _PredictModel.fromJson(json);
}

/// @nodoc
mixin _$PredictModel {
  @JsonKey(name: 'input_data')
  List<int> get inputData => throw _privateConstructorUsedError;
  @JsonKey(name: 'predictions')
  List<double> get predictions => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $PredictModelCopyWith<PredictModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $PredictModelCopyWith<$Res> {
  factory $PredictModelCopyWith(
          PredictModel value, $Res Function(PredictModel) then) =
      _$PredictModelCopyWithImpl<$Res, PredictModel>;
  @useResult
  $Res call(
      {@JsonKey(name: 'input_data') List<int> inputData,
      @JsonKey(name: 'predictions') List<double> predictions});
}

/// @nodoc
class _$PredictModelCopyWithImpl<$Res, $Val extends PredictModel>
    implements $PredictModelCopyWith<$Res> {
  _$PredictModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? inputData = null,
    Object? predictions = null,
  }) {
    return _then(_value.copyWith(
      inputData: null == inputData
          ? _value.inputData
          : inputData // ignore: cast_nullable_to_non_nullable
              as List<int>,
      predictions: null == predictions
          ? _value.predictions
          : predictions // ignore: cast_nullable_to_non_nullable
              as List<double>,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$PredictModelImplCopyWith<$Res>
    implements $PredictModelCopyWith<$Res> {
  factory _$$PredictModelImplCopyWith(
          _$PredictModelImpl value, $Res Function(_$PredictModelImpl) then) =
      __$$PredictModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: 'input_data') List<int> inputData,
      @JsonKey(name: 'predictions') List<double> predictions});
}

/// @nodoc
class __$$PredictModelImplCopyWithImpl<$Res>
    extends _$PredictModelCopyWithImpl<$Res, _$PredictModelImpl>
    implements _$$PredictModelImplCopyWith<$Res> {
  __$$PredictModelImplCopyWithImpl(
      _$PredictModelImpl _value, $Res Function(_$PredictModelImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? inputData = null,
    Object? predictions = null,
  }) {
    return _then(_$PredictModelImpl(
      inputData: null == inputData
          ? _value._inputData
          : inputData // ignore: cast_nullable_to_non_nullable
              as List<int>,
      predictions: null == predictions
          ? _value._predictions
          : predictions // ignore: cast_nullable_to_non_nullable
              as List<double>,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$PredictModelImpl implements _PredictModel {
  _$PredictModelImpl(
      {@JsonKey(name: 'input_data') required final List<int> inputData,
      @JsonKey(name: 'predictions') required final List<double> predictions})
      : _inputData = inputData,
        _predictions = predictions;

  factory _$PredictModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$PredictModelImplFromJson(json);

  final List<int> _inputData;
  @override
  @JsonKey(name: 'input_data')
  List<int> get inputData {
    if (_inputData is EqualUnmodifiableListView) return _inputData;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_inputData);
  }

  final List<double> _predictions;
  @override
  @JsonKey(name: 'predictions')
  List<double> get predictions {
    if (_predictions is EqualUnmodifiableListView) return _predictions;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_predictions);
  }

  @override
  String toString() {
    return 'PredictModel(inputData: $inputData, predictions: $predictions)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$PredictModelImpl &&
            const DeepCollectionEquality()
                .equals(other._inputData, _inputData) &&
            const DeepCollectionEquality()
                .equals(other._predictions, _predictions));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(_inputData),
      const DeepCollectionEquality().hash(_predictions));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$PredictModelImplCopyWith<_$PredictModelImpl> get copyWith =>
      __$$PredictModelImplCopyWithImpl<_$PredictModelImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$PredictModelImplToJson(
      this,
    );
  }
}

abstract class _PredictModel implements PredictModel {
  factory _PredictModel(
      {@JsonKey(name: 'input_data') required final List<int> inputData,
      @JsonKey(name: 'predictions')
      required final List<double> predictions}) = _$PredictModelImpl;

  factory _PredictModel.fromJson(Map<String, dynamic> json) =
      _$PredictModelImpl.fromJson;

  @override
  @JsonKey(name: 'input_data')
  List<int> get inputData;
  @override
  @JsonKey(name: 'predictions')
  List<double> get predictions;
  @override
  @JsonKey(ignore: true)
  _$$PredictModelImplCopyWith<_$PredictModelImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
