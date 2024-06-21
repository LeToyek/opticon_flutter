// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'bluetooth_controller_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$BluetoothControllerState {
  BluetoothDevice? get bluetoothDevice => throw _privateConstructorUsedError;
  BluetoothState? get bluetoothState => throw _privateConstructorUsedError;
  int? get deviceState => throw _privateConstructorUsedError;
  List<BluetoothDevice> get devicesList => throw _privateConstructorUsedError;
  BluetoothConnection? get connection => throw _privateConstructorUsedError;
  String? get message => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $BluetoothControllerStateCopyWith<BluetoothControllerState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $BluetoothControllerStateCopyWith<$Res> {
  factory $BluetoothControllerStateCopyWith(BluetoothControllerState value,
          $Res Function(BluetoothControllerState) then) =
      _$BluetoothControllerStateCopyWithImpl<$Res, BluetoothControllerState>;
  @useResult
  $Res call(
      {BluetoothDevice? bluetoothDevice,
      BluetoothState? bluetoothState,
      int? deviceState,
      List<BluetoothDevice> devicesList,
      BluetoothConnection? connection,
      String? message});
}

/// @nodoc
class _$BluetoothControllerStateCopyWithImpl<$Res,
        $Val extends BluetoothControllerState>
    implements $BluetoothControllerStateCopyWith<$Res> {
  _$BluetoothControllerStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? bluetoothDevice = freezed,
    Object? bluetoothState = freezed,
    Object? deviceState = freezed,
    Object? devicesList = null,
    Object? connection = freezed,
    Object? message = freezed,
  }) {
    return _then(_value.copyWith(
      bluetoothDevice: freezed == bluetoothDevice
          ? _value.bluetoothDevice
          : bluetoothDevice // ignore: cast_nullable_to_non_nullable
              as BluetoothDevice?,
      bluetoothState: freezed == bluetoothState
          ? _value.bluetoothState
          : bluetoothState // ignore: cast_nullable_to_non_nullable
              as BluetoothState?,
      deviceState: freezed == deviceState
          ? _value.deviceState
          : deviceState // ignore: cast_nullable_to_non_nullable
              as int?,
      devicesList: null == devicesList
          ? _value.devicesList
          : devicesList // ignore: cast_nullable_to_non_nullable
              as List<BluetoothDevice>,
      connection: freezed == connection
          ? _value.connection
          : connection // ignore: cast_nullable_to_non_nullable
              as BluetoothConnection?,
      message: freezed == message
          ? _value.message
          : message // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$BluetoothControllerStateImplCopyWith<$Res>
    implements $BluetoothControllerStateCopyWith<$Res> {
  factory _$$BluetoothControllerStateImplCopyWith(
          _$BluetoothControllerStateImpl value,
          $Res Function(_$BluetoothControllerStateImpl) then) =
      __$$BluetoothControllerStateImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {BluetoothDevice? bluetoothDevice,
      BluetoothState? bluetoothState,
      int? deviceState,
      List<BluetoothDevice> devicesList,
      BluetoothConnection? connection,
      String? message});
}

/// @nodoc
class __$$BluetoothControllerStateImplCopyWithImpl<$Res>
    extends _$BluetoothControllerStateCopyWithImpl<$Res,
        _$BluetoothControllerStateImpl>
    implements _$$BluetoothControllerStateImplCopyWith<$Res> {
  __$$BluetoothControllerStateImplCopyWithImpl(
      _$BluetoothControllerStateImpl _value,
      $Res Function(_$BluetoothControllerStateImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? bluetoothDevice = freezed,
    Object? bluetoothState = freezed,
    Object? deviceState = freezed,
    Object? devicesList = null,
    Object? connection = freezed,
    Object? message = freezed,
  }) {
    return _then(_$BluetoothControllerStateImpl(
      bluetoothDevice: freezed == bluetoothDevice
          ? _value.bluetoothDevice
          : bluetoothDevice // ignore: cast_nullable_to_non_nullable
              as BluetoothDevice?,
      bluetoothState: freezed == bluetoothState
          ? _value.bluetoothState
          : bluetoothState // ignore: cast_nullable_to_non_nullable
              as BluetoothState?,
      deviceState: freezed == deviceState
          ? _value.deviceState
          : deviceState // ignore: cast_nullable_to_non_nullable
              as int?,
      devicesList: null == devicesList
          ? _value._devicesList
          : devicesList // ignore: cast_nullable_to_non_nullable
              as List<BluetoothDevice>,
      connection: freezed == connection
          ? _value.connection
          : connection // ignore: cast_nullable_to_non_nullable
              as BluetoothConnection?,
      message: freezed == message
          ? _value.message
          : message // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc

class _$BluetoothControllerStateImpl extends _BluetoothControllerState {
  _$BluetoothControllerStateImpl(
      {this.bluetoothDevice,
      this.bluetoothState,
      this.deviceState,
      final List<BluetoothDevice> devicesList = const [],
      this.connection,
      this.message})
      : _devicesList = devicesList,
        super._();

  @override
  final BluetoothDevice? bluetoothDevice;
  @override
  final BluetoothState? bluetoothState;
  @override
  final int? deviceState;
  final List<BluetoothDevice> _devicesList;
  @override
  @JsonKey()
  List<BluetoothDevice> get devicesList {
    if (_devicesList is EqualUnmodifiableListView) return _devicesList;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_devicesList);
  }

  @override
  final BluetoothConnection? connection;
  @override
  final String? message;

  @override
  String toString() {
    return 'BluetoothControllerState(bluetoothDevice: $bluetoothDevice, bluetoothState: $bluetoothState, deviceState: $deviceState, devicesList: $devicesList, connection: $connection, message: $message)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$BluetoothControllerStateImpl &&
            (identical(other.bluetoothDevice, bluetoothDevice) ||
                other.bluetoothDevice == bluetoothDevice) &&
            (identical(other.bluetoothState, bluetoothState) ||
                other.bluetoothState == bluetoothState) &&
            (identical(other.deviceState, deviceState) ||
                other.deviceState == deviceState) &&
            const DeepCollectionEquality()
                .equals(other._devicesList, _devicesList) &&
            (identical(other.connection, connection) ||
                other.connection == connection) &&
            (identical(other.message, message) || other.message == message));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      bluetoothDevice,
      bluetoothState,
      deviceState,
      const DeepCollectionEquality().hash(_devicesList),
      connection,
      message);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$BluetoothControllerStateImplCopyWith<_$BluetoothControllerStateImpl>
      get copyWith => __$$BluetoothControllerStateImplCopyWithImpl<
          _$BluetoothControllerStateImpl>(this, _$identity);
}

abstract class _BluetoothControllerState extends BluetoothControllerState {
  factory _BluetoothControllerState(
      {final BluetoothDevice? bluetoothDevice,
      final BluetoothState? bluetoothState,
      final int? deviceState,
      final List<BluetoothDevice> devicesList,
      final BluetoothConnection? connection,
      final String? message}) = _$BluetoothControllerStateImpl;
  _BluetoothControllerState._() : super._();

  @override
  BluetoothDevice? get bluetoothDevice;
  @override
  BluetoothState? get bluetoothState;
  @override
  int? get deviceState;
  @override
  List<BluetoothDevice> get devicesList;
  @override
  BluetoothConnection? get connection;
  @override
  String? get message;
  @override
  @JsonKey(ignore: true)
  _$$BluetoothControllerStateImplCopyWith<_$BluetoothControllerStateImpl>
      get copyWith => throw _privateConstructorUsedError;
}
