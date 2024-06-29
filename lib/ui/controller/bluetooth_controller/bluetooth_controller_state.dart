import 'package:flutter_bluetooth_serial/flutter_bluetooth_serial.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:opticon_flutter/domain/model/bluetooth_data_model.dart';

part 'bluetooth_controller_state.freezed.dart';

@freezed
class BluetoothControllerState with _$BluetoothControllerState {
  BluetoothControllerState._();

  factory BluetoothControllerState(
      {BluetoothDevice? bluetoothDevice,
      BluetoothState? bluetoothState,
      int? deviceState,
      @Default([]) List<BluetoothDevice> devicesList,
      BluetoothConnection? connection,
      String? message,
      BluetoothDataModel? btData,
      @Default(0) int blinkCount,
      @Default(false) bool isBlink,
      @Default(0) int minutePast,
      @Default(0) int prevBlinkCount,
      @Default(0) int highestBlinkDuration,
      @Default("") String errorMessage,
      @Default([]) List<int> blpmList,
      @Default([]) List<int> bpmList,
      @Default(0) int prevKPM,
      @Default(0) int secPrevKpm,
      @Default(false) bool isButtonUnavailable}) = _BluetoothControllerState;

  bool get isConnected => connection != null && connection!.isConnected;
}
