import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_bluetooth_serial/flutter_bluetooth_serial.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:opticon_flutter/ui/controller/bluetooth_controller/bluetooth_controller.dart';

class QRPage extends ConsumerStatefulWidget {
  const QRPage({super.key});

  static const String routePath = '/qr';

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _QRPageState();
}

class _QRPageState extends ConsumerState<QRPage> {
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

  List<String> receivedData = [];

  bool isDisconnecting = false;

  Map<String, Color> colors = {
    'onBorderColor': Colors.green,
    'offBorderColor': Colors.red,
    'neutralBorderColor': Colors.transparent,
    'onTextColor': Colors.green,
    'offTextColor': Colors.red,
    'neutralTextColor': Colors.blue,
  };

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) async {
      ref.read(bluetoothControllerProvider.notifier).connectToDevice();
    });
  }

  // Now, its time to build the UI
  @override
  Widget build(BuildContext context) {
    final state = ref.watch(bluetoothControllerProvider);
    final notifier = ref.watch(bluetoothControllerProvider.notifier);
    final colorScheme = Theme.of(context).colorScheme;
    ref.listen(
        bluetoothControllerProvider.select<String?>((value) => value.message),
        onMessage);

    return MaterialApp(
      home: Scaffold(
        key: _scaffoldKey,
        appBar: AppBar(
          foregroundColor: Colors.white,
          title: const Text(
            "Flutter Bluetooth",
          ),
          backgroundColor: colorScheme.primary,
          actions: <Widget>[
            ElevatedButton.icon(
              icon: const Icon(
                Icons.refresh,
                color: Colors.white,
              ),
              label: const Text(
                "Refresh",
                style: TextStyle(
                  color: Colors.white,
                ),
              ),
              // shape: RoundedRectangleBorder(
              //   borderRadius: BorderRadius.circular(30),
              // ),
              // splashColor: Colors.deepPurple,
              onPressed: () async {
                await notifier.getPairedDevices();
              },
            ),
          ],
        ),
        body: Column(
          mainAxisSize: MainAxisSize.max,
          children: <Widget>[
            Visibility(
              visible: state.bluetoothDevice != null &&
                  state.bluetoothState == BluetoothState.STATE_ON,
              child: const LinearProgressIndicator(
                backgroundColor: Colors.yellow,
                valueColor: AlwaysStoppedAnimation<Color>(Colors.red),
              ),
            ),
            const Padding(
              padding: EdgeInsets.all(10),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: <Widget>[
                  Expanded(
                    child: Text(
                      'Enable Bluetooth',
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 16,
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Stack(
              children: <Widget>[
                Column(
                  children: <Widget>[
                    const Padding(
                      padding: EdgeInsets.only(top: 10),
                      child: Text(
                        "PAIRED DEVICES",
                        style: TextStyle(fontSize: 24, color: Colors.blue),
                        textAlign: TextAlign.center,
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: <Widget>[
                          const Text(
                            'Device:',
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          DropdownButton(
                            items: _getDeviceItems(state.devicesList),
                            onChanged: notifier.changeDevice,
                            value: state.devicesList.isNotEmpty
                                ? state.bluetoothDevice
                                : null,
                          ),
                          ElevatedButton(
                            onPressed: state.bluetoothDevice == null
                                ? null
                                : state.isConnected
                                    ? notifier.disconnect
                                    : notifier.connect,
                            child: Text(
                                state.isConnected ? 'Disconnect' : 'Connect'),
                          ),
                        ],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(16.0),
                      child: Card(
                        shape: RoundedRectangleBorder(
                          side: BorderSide(
                            color: state.deviceState == 0
                                ? colors['neutralBorderColor']!
                                : state.deviceState == 1
                                    ? colors['onBorderColor']!
                                    : colors['offBorderColor']!,
                            width: 3,
                          ),
                          borderRadius: BorderRadius.circular(4.0),
                        ),
                        elevation: state.deviceState == 0 ? 4 : 0,
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Row(
                            children: <Widget>[
                              Expanded(
                                child: Text(
                                  "DEVICE 1",
                                  style: TextStyle(
                                    fontSize: 20,
                                    color: state.deviceState == 0
                                        ? colors['neutralTextColor']
                                        : state.deviceState == 1
                                            ? colors['onTextColor']
                                            : colors['offTextColor'],
                                  ),
                                ),
                              ),
                              ElevatedButton(
                                onPressed: state.isConnected
                                    ? notifier.sendOnMessageToBluetooth
                                    : null,
                                child: const Text("ON"),
                              ),
                              ElevatedButton(
                                onPressed: state.isConnected
                                    ? notifier.sendOffMessageToBluetooth
                                    : null,
                                child: const Text("OFF"),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
                Container(
                  color: Colors.blue,
                ),
              ],
            ),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.all(20),
                child: Center(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      const Text(
                        "NOTE: If you cannot find the device in the list, please pair the device by going to the bluetooth settings",
                        style: TextStyle(
                          fontSize: 15,
                          fontWeight: FontWeight.bold,
                          color: Colors.red,
                        ),
                      ),
                      const SizedBox(height: 15),
                      ElevatedButton(
                        // elevation: 2,
                        child: const Text("Bluetooth Settings"),
                        onPressed: () {
                          FlutterBluetoothSerial.instance.openSettings();
                        },
                      ),
                    ],
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }

  void onMessage(dynamic previous, dynamic next) {
    if (next != null) {
      show(next);
    }
  }

  // Create the List of devices to be shown in Dropdown Menu
  List<DropdownMenuItem<BluetoothDevice>> _getDeviceItems(
      List<BluetoothDevice> devicesList) {
    List<DropdownMenuItem<BluetoothDevice>> items = [];
    if (devicesList.isEmpty) {
      items.add(const DropdownMenuItem(
        child: Text('NONE'),
      ));
    } else {
      for (var device in devicesList) {
        items.add(DropdownMenuItem(
          value: device,
          child: Text(device.name ?? ''),
        ));
      }
    }
    return items;
  }

  // Method to connect to bluetooth
  // void _connect() async {
  //   setState(() {
  //     _isButtonUnavailable = true;
  //   });
  //   if (_device == null) {
  //     show('No device selected');
  //   } else {
  //     // if (connection == null || (connection != null && !isConnected!)) {
  //     if (!isConnected!) {
  //       await BluetoothConnection.toAddress(_device?.address).then((conn) {
  //         debugPrint('Connected to the device');
  //         connection = conn;
  //         setState(() {
  //           _connected = true;
  //         });

  //         connection?.input?.listen(
  //           (Uint8List data) {
  //             // decode data to json then get the value

  //             final dataString = utf8.decode(data);
  //             print(dataString);
  //             processReceivedData(data);
  //           },
  //           onDone: () {
  //             if (isDisconnecting) {
  //               debugPrint('Disconnecting locally!');
  //             } else {
  //               debugPrint('Disconnected remotely!');
  //             }
  //             if (mounted) {
  //               setState(() {});
  //             }
  //           },
  //         ).onDone(() {
  //           if (isDisconnecting) {
  //             debugPrint('Disconnecting locally!');
  //           } else {
  //             debugPrint('Disconnected remotely!');
  //           }
  //           if (mounted) {
  //             setState(() {});
  //           }
  //         });
  //       }).catchError((error) {
  //         debugPrint('Cannot connect, exception occurred');
  //         debugPrint(error);
  //       });
  //       show('Device connected');

  //       setState(() => _isButtonUnavailable = false);
  //     }
  //   }
  // }

  // void _onDataReceived(Uint8List data) {
  //   // Allocate buffer for parsed data
  //   int backspacesCounter = 0;
  //   data.forEach((byte) {
  //     if (byte == 8 || byte == 127) {
  //       backspacesCounter++;
  //     }
  //   });
  //   Uint8List buffer = Uint8List(data.length - backspacesCounter);
  //   int bufferIndex = buffer.length;

  //   // Apply backspace control character
  //   backspacesCounter = 0;
  //   for (int i = data.length - 1; i >= 0; i--) {
  //     if (data[i] == 8 || data[i] == 127) {
  //       backspacesCounter++;
  //     } else {
  //       if (backspacesCounter > 0) {
  //         backspacesCounter--;
  //       } else {
  //         buffer[--bufferIndex] = data[i];
  //       }
  //     }
  //   }
  // }

  // Method to disconnect bluetooth

  // Method to send message,
  // for turning the Bluetooth device on

  // Method to show a Snackbar,
  // taking message as the text
  Future show(
    String message, {
    Duration duration = const Duration(seconds: 3),
  }) async {
    await Future.delayed(const Duration(milliseconds: 100));
    // _scaffoldKey.currentState.showSnackBar(
    //   SnackBar(
    //     content: Text(
    //       message,
    //     ),
    //     duration: duration,
    //   ),
    // );
    ScaffoldMessenger.of(_scaffoldKey.currentContext!).showSnackBar(
      SnackBar(
        content: Text(
          message,
        ),
        duration: duration,
      ),
    );
  }
}
