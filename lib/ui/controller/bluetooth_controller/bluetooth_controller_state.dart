import 'package:flutter_bluetooth_serial/flutter_bluetooth_serial.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'bluetooth_controller_state.freezed.dart';

@freezed
class BluetoothControllerState with _$BluetoothControllerState {
  const BluetoothControllerState._();

  factory BluetoothControllerState({
    BluetoothDevice? bluetoothDevice,
    BluetoothState? bluetoothState,
    int? deviceState,
    @Default([]) List<BluetoothDevice> devicesList,
    BluetoothConnection? connection,
    String? message,
  }) = _BluetoothControllerState;

  bool get isConnected => connection != null && connection!.isConnected;
}
