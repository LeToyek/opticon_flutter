import 'dart:async';
import 'dart:convert';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bluetooth_serial/flutter_bluetooth_serial.dart';
import 'package:opticon_flutter/application/report_service.dart';
import 'package:opticon_flutter/application/services.dart';
import 'package:opticon_flutter/datasources/datasources.dart';
import 'package:opticon_flutter/domain/model/bluetooth_data_model.dart';
import 'package:opticon_flutter/domain/model/report_data_model.dart';
import 'package:opticon_flutter/ui/controller/bluetooth_controller/bluetooth_controller_state.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'bluetooth_controller.g.dart';

@riverpod
class BluetoothController extends _$BluetoothController {
  final FlutterBluetoothSerial _bluetooth = FlutterBluetoothSerial.instance;
  ReportService get _reportService => ref.read(reportServiceProvider);
  FirebaseAuth get _auth => ref.read(firebaseAuthProvider);

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
    try {
      state = state.copyWith(isButtonUnavailable: true);
      if (state.bluetoothDevice == null) {
        state = state.copyWith(message: 'No device selected');
      } else {
        // if (connection == null || (connection != null && !isConnected!)) {
        if (!state.isConnected) {
          final conn = await BluetoothConnection.toAddress(
              state.bluetoothDevice?.address);
          debugPrint('Connected to the device');
          state = state.copyWith(connection: conn);

          _connectionSubscription = conn.input?.listen(onData);
          state = state.copyWith(
              message: 'Device connected', isButtonUnavailable: false);
        }
      }
    } catch (e) {
      state = state.copyWith(
          errorMessage: 'Error occurred while connecting. Try again!');
      await Future.delayed(const Duration(seconds: 3));
      state = state.copyWith(errorMessage: '');
    }
  }

  onData(Uint8List data) async {
    // final dataString = utf8.decode(data);
    // print(dataString);
    final dataReceived = await _fromHexData(data);
    if (dataReceived != null) {
      state = state.copyWith(btData: dataReceived);
    }
  }

  Future<BluetoothDataModel?> _fromHexData(Uint8List data) async {
    String hexData = String.fromCharCodes(data);
    List<String> dataList =
        hexData.split(',').where((element) => element.isNotEmpty).toList();

    print("Data: $dataList");

    List<String> receivedData = [];
    if (dataList.length == 4) {
      receivedData =
          dataList.map((e) => int.parse(e, radix: 16).toString()).toList();

      if (receivedData[0] != "101") {
        print("BLINK COUNT: ${state.blinkCount}");

        print("BATTERY: ${receivedData[0]}%");
        print("KPM: ${receivedData[1]}");
        print("BPM: ${receivedData[2]}");
        print("BLINK DURATION: ${receivedData[3]}");

        final now = DateTime.now();
        final minute = now.minute;

        if (minute != 0 && state.minutePast == 0) {
          state = state.copyWith(minutePast: minute);
        }

        if (minute != state.minutePast) {
          try {
            print(" MINUTE $minute | PAST MINUTE ${state.minutePast}");
            await _reportService.postReportData(ReportDataModel(
              blinkCount: state.blinkCount,
              highestBlinkDuration: state.highestBlinkDuration,
              bpmValue: int.tryParse(receivedData[2])!,
              userId: _auth.currentUser!.uid,
              createdAt: now.toString(),
            ));
            state = state.copyWith(
                minutePast: minute,
                blinkCount: 0,
                prevKPM: 0,
                highestBlinkDuration: 0);
          } catch (e) {
            state = state.copyWith(
                errorMessage: 'Error occurred while posting data',
                minutePast: minute,
                blinkCount: 0,
                prevKPM: 0,
                highestBlinkDuration: 0);
          }
        }

        int kpm = int.parse(receivedData[1]);
        print("BLINK COUNT: ${state.blinkCount} | BLINK: ${receivedData[1]}");

        if (kpm > state.prevKPM) {
          int addBlink = kpm - state.prevKPM;
          state = state.copyWith(
            blinkCount: state.blinkCount + addBlink,
            blpmList: [...state.blpmList, addBlink],
            prevKPM: kpm,
            isBlink: true,
          );
        } else if (kpm < state.prevKPM) {
          state = state.copyWith(
            blinkCount: state.blinkCount + kpm,
            prevKPM: kpm,
            isBlink: true,
          );
        }
        int blinkDuration = int.parse(receivedData[3]);
        if (blinkDuration > state.highestBlinkDuration) {
          state = state.copyWith(highestBlinkDuration: blinkDuration);
        }

        state = state.copyWith(blpmList: [...state.blpmList], isBlink: false);

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
