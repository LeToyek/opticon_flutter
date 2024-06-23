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
    state = state.copyWith(deviceState: 0);

    await state.connection?.close();
    state = state.copyWith(message: 'Device disconnected');
  }

  Future<void> connect() async {
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
        state = state.copyWith(message: 'Device connected');
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
    if (dataList.length >= 4) {
      receivedData =
          dataList.map((e) => int.parse(e, radix: 16).toString()).toList();

      print("Baterai: ${receivedData[0]}%");
      print("KPM: ${receivedData[1]}");
      print("BlPM: ${receivedData[2]}");
      print("BPM: ${receivedData[3]}");

      return BluetoothDataModel(
        battery: receivedData[0],
        blinkDuration: receivedData[1],
        blinkCount: receivedData[2],
        ppgValue: receivedData[3],
      );
    }
    return null;
  }
}
