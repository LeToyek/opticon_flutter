import 'dart:async';
import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bluetooth_serial/flutter_bluetooth_serial.dart';
import 'package:opticon_flutter/domain/model/bluetooth_data_model.dart';
import 'package:opticon_flutter/ui/controller/bluetooth_controller/bluetooth_controller_state.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'bluetooth_controller.g.dart';

@riverpod
class BluetoothController extends _$BluetoothController {
  final FlutterBluetoothSerial _bluetooth = FlutterBluetoothSerial.instance;
  StreamSubscription? _bluetoothSubscription;
  StreamSubscription? _connectionSubscription;
  @override
  BluetoothControllerState build() {
    ref.onDispose(dispose);
    return BluetoothControllerState();
  }

  void dispose() {
    _bluetoothSubscription?.cancel();
    _connectionSubscription?.cancel();
  }

  changeDevice(BluetoothDevice? device) {
    state = state.copyWith(bluetoothDevice: device);
  }

  void sendOnMessageToBluetooth() async {
    Uint8List data = utf8.encode("1" "\r\n");
    state.connection?.output.add(data);
    await state.connection?.output.allSent;
    state = state.copyWith(message: 'Device Turned On', deviceState: 1);
  }

  // Method to send message,
  // for turning the Bluetooth device off
  void sendOffMessageToBluetooth() async {
    Uint8List data = utf8.encode("0" "\r\n");
    state.connection?.output.add(data);
    await state.connection?.output.allSent;
    state = state.copyWith(message: 'Device Turned Off', deviceState: -1);
  }

  Future<void> connectToDevice() async {
    // Get current state
    final bluetoothState = await _bluetooth.state;
    state = state.copyWith(bluetoothState: bluetoothState, deviceState: 0);
    enableBluetooth();

    // Listen for further state changes
    _bluetoothSubscription = FlutterBluetoothSerial.instance
        .onStateChanged()
        .listen(onBluetoothChange);
  }

  void onBluetoothChange(BluetoothState bState) {
    state = state.copyWith(bluetoothState: bState);
    if (state.bluetoothState == BluetoothState.STATE_OFF) {
      state = state.copyWith(isButtonUnavailable: true);
    }
    getPairedDevices();
  }

  Future<void> enableBluetooth() async {
    // Retrieving the current Bluetooth state
    final bluetoothState = state.bluetoothState;
    // If the bluetooth is off, then turn it on first
    // and then retrieve the devices that are paired.
    if (bluetoothState == BluetoothState.STATE_OFF) {
      await FlutterBluetoothSerial.instance.requestEnable();
      await getPairedDevices();
      // return true;
    } else {
      await getPairedDevices();
    }
    // return false;
  }

  Future<void> getPairedDevices() async {
    List<BluetoothDevice> devices = [];

    // To get the list of paired devices
    try {
      devices = await _bluetooth.getBondedDevices();
    } on PlatformException {
      debugPrint("Error");
    }

    // Store the [devices] list in the [_devicesList] for accessing
    // the list outside this class
    state = state.copyWith(devicesList: devices);
  }

  Future<void> disconnect() async {
    state = state.copyWith(
        deviceState: 0, isButtonUnavailable: true, bluetoothDevice: null);

    await state.connection?.close();
    await _connectionSubscription?.cancel();
    state = state.copyWith(
        message: 'Device disconnected', isButtonUnavailable: false);
  }

  Future<void> connect() async {
    state = state.copyWith(isButtonUnavailable: true);
    if (state.bluetoothDevice == null) {
      state = state.copyWith(message: 'No device selected');
    } else {
      // if (connection == null || (connection != null && !isConnected!)) {
      if (!state.isConnected) {
        final conn =
            await BluetoothConnection.toAddress(state.bluetoothDevice?.address);
        debugPrint('Connected to the device');
        state = state.copyWith(connection: conn);

        _connectionSubscription = conn.input?.listen(onData);
        state = state.copyWith(
            message: 'Device connected', isButtonUnavailable: false);
      }
    }
  }

  onData(Uint8List data) {
    // final dataString = utf8.decode(data);
    // print(dataString);
    final dataReceived = _fromHexData(data);
    if (dataReceived != null) {
      state = state.copyWith(btData: dataReceived);
    }
  }

  BluetoothDataModel? _fromHexData(Uint8List data) {
    String hexData = String.fromCharCodes(data);
    List<String> dataList =
        hexData.split(',').where((element) => element.isNotEmpty).toList();

    print("Data: $dataList");

    List<String> receivedData = [];
    if (dataList.length == 3) {
      receivedData =
          dataList.map((e) => int.parse(e, radix: 16).toString()).toList();

      if (receivedData[0] != "101") {
        // print("BPM: ${receivedData[3]}");
        print("BATTERY: ${receivedData[0]}%");
        print("BLPM: ${receivedData[1]}");
        print("BPM: ${receivedData[2]}");

        final double convertedBlPM = int.tryParse(receivedData[2])! / 100;

        // get the time now, is the time minute is different with the past minute (state.minutePast)
        final now = DateTime.now();
        final minute = now.minute;
        if (minute != state.minutePast) {
          state = state.copyWith(minutePast: minute);
          state = state.copyWith(blinkCount: 0);
        }

        if (convertedBlPM > 0.8) {
          print("IS BLINKING $convertedBlPM");
          state =
              state.copyWith(blinkCount: state.blinkCount + 1, isBlink: true);
          print("BLINK COUNT: ${state.blinkCount}");
        } else {
          state = state.copyWith(isBlink: false);
        }
        return BluetoothDataModel(
          battery: receivedData[0],
          blinkDuration: receivedData[1],
          blinkCount: state.blinkCount.toString(),
          ppgValue: receivedData[2],
        );
      }
    }
    return null;
  }
}
