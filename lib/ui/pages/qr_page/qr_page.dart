import 'dart:async';

import 'package:awesome_ripple_animation/awesome_ripple_animation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:opticon_flutter/ui/controller/bluetooth_controller/bluetooth_controller.dart';
import 'package:opticon_flutter/ui/pages/iot_page/iot_device_page.dart';

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

  final ScrollController _scrollController = ScrollController();

  void _scrollToTop() {
    _scrollController.animateTo(
      0.0,
      duration: const Duration(seconds: 1),
      curve: Curves.easeInOut,
    );
  }

  // Now, its time to build the UI
  @override
  Widget build(BuildContext context) {
    final state = ref.watch(bluetoothControllerProvider);
    final notifier = ref.watch(bluetoothControllerProvider.notifier);
    final colorScheme = Theme.of(context).colorScheme;
    final size = MediaQuery.of(context).size;
    ref.listen(
        bluetoothControllerProvider.select<String?>((value) => value.message),
        onMessage);

    ref.listen(
      bluetoothControllerProvider.select((value) => value.errorMessage),
      onError,
    );
    return MaterialApp(
      home: Scaffold(
          key: _scaffoldKey,
          body: Center(
            child: SingleChildScrollView(
              controller: _scrollController,
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  children: [
                    SizedBox(
                      height: size.height / 6,
                    ),
                    RippleAnimation(
                      repeat: true,
                      color: state.isConnected
                          ? colorScheme.surfaceVariant
                          : state.isButtonUnavailable &&
                                  state.errorMessage.isEmpty
                              ? Colors.blue
                              : colorScheme.primary,
                      minRadius: 90,
                      ripplesCount: 6,
                      size: Size(size.height / 5, size.height / 5),
                      child: CircleAvatar(
                        backgroundColor: state.isConnected
                            ? colorScheme.surfaceVariant
                            : state.isButtonUnavailable &&
                                    state.errorMessage.isEmpty
                                ? Colors.blue
                                : colorScheme.primary,
                        radius: 100,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            state.isConnected
                                ? Text(
                                    state.bluetoothDevice?.name ?? '',
                                    style: const TextStyle(
                                      color: Colors.white,
                                      fontSize: 12,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  )
                                : const Icon(
                                    Icons.bluetooth_outlined,
                                    color: Colors.white,
                                    size: 56,
                                  )
                          ],
                        ),
                      ),
                    ),
                    SizedBox(
                      height: size.height / 6,
                    ),
                    state.isConnected
                        ? showConnected(state, notifier, context, colorScheme)
                        : showChooseDevice(
                            state, notifier, context, colorScheme),
                  ],
                ),
              ),
            ),
          )),
    );
  }

  void onError(previous, next) {
    show(
      next,
    );
  }

  Widget showConnected(state, notifier, context, colorScheme) {
    return Column(
      children: [
        Text(
          'Terhubung dengan ${state.bluetoothDevice?.name}',
          style:
              Theme.of(context).textTheme.bodyLarge!.apply(fontWeightDelta: 2),
        ),
        Text(
          'Silahkan lihat data anda dengan menekan tombol lihat di bawah ini',
          style: Theme.of(context).textTheme.bodyMedium,
          textAlign: TextAlign.center,
        ),
        const SizedBox(
          height: 16,
        ),
        Container(
          padding: const EdgeInsets.all(16),
          decoration: BoxDecoration(
            color: colorScheme.surfaceVariant.withOpacity(0.8),
            borderRadius: BorderRadius.circular(8),
          ),
          child: InkWell(
            onTap: () {
              Navigator.pushNamed(context, IOTDevice.routePath);
            },
            child: Center(
              child: Text(
                'Lihat Data IOT',
                style: Theme.of(context)
                    .textTheme
                    .bodyLarge!
                    .apply(color: Colors.white, fontWeightDelta: 2),
              ),
            ),
          ),
        ),
        const SizedBox(
          height: 16,
        ),
        Row(
          children: [
            Expanded(
                flex: 2,
                child: InkWell(
                  onTap: () {
                    notifier.disconnect();
                  },
                  child: Container(
                    padding: const EdgeInsets.all(16),
                    decoration: BoxDecoration(
                      color: Colors.red.shade300,
                      borderRadius: BorderRadius.circular(8),
                    ),
                    child: Center(
                      child: Text(
                        'Disconnect',
                        style: Theme.of(context)
                            .textTheme
                            .bodyLarge!
                            .apply(color: Colors.white, fontWeightDelta: 2),
                      ),
                    ),
                  ),
                )),
            const SizedBox(
              width: 16,
            ),
            Expanded(
                flex: 1,
                child: InkWell(
                  onTap: () {
                    Navigator.pop(context);
                  },
                  child: Container(
                    padding: const EdgeInsets.all(16),
                    decoration: BoxDecoration(
                      color: Colors.red.shade300,
                      borderRadius: BorderRadius.circular(8),
                    ),
                    child: Center(
                      child: Text(
                        'Kembali',
                        style: Theme.of(context)
                            .textTheme
                            .bodyLarge!
                            .apply(color: Colors.white, fontWeightDelta: 2),
                      ),
                    ),
                  ),
                )),
          ],
        )
      ],
    );
  }

  Widget showChooseDevice(state, notifier, context, colorScheme) {
    return Column(
      children: [
        Text(
          'Menghubungkan ke perangkat IOT',
          style:
              Theme.of(context).textTheme.bodyLarge!.apply(fontWeightDelta: 2),
        ),
        Text(
          'Silahkan pilih perangkat dengan nama "ESP" di depan, lalu tekan tombol "Connect"',
          style: Theme.of(context).textTheme.bodyMedium,
          textAlign: TextAlign.center,
        ),
        state.devicesList.isEmpty
            ? const Text('No devices found')
            : ListView.builder(
                itemCount: state.devicesList.length,
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                itemBuilder: (context, index) {
                  final device = state.devicesList[index];
                  return AnimatedContainer(
                    duration: const Duration(milliseconds: 500),
                    margin: const EdgeInsets.symmetric(vertical: 8),
                    decoration: BoxDecoration(
                      color: state.bluetoothDevice?.address == device.address
                          ? colorScheme.primary.withOpacity(0.8)
                          : Colors.white,
                      boxShadow: [
                        BoxShadow(
                          color: colorScheme.primary.withOpacity(0.2),
                          blurRadius: 8,
                          offset: const Offset(0, 4),
                        )
                      ],
                      borderRadius: BorderRadius.circular(8.0),
                    ),
                    child: ListTile(
                      title: Text(device.name ?? ''),
                      onTap: () {
                        notifier.changeDevice(device);
                      },
                    ),
                  );
                }),
        const SizedBox(
          height: 16,
        ),
        Row(
          children: [
            Expanded(
                flex: 2,
                child: InkWell(
                  onTap: () {
                    _scrollToTop();
                    notifier.connect();
                  },
                  child: Container(
                    padding: const EdgeInsets.all(16),
                    decoration: BoxDecoration(
                      color: Colors.blue.shade300,
                      borderRadius: BorderRadius.circular(8),
                    ),
                    child: Center(
                      child: Text(
                        'Connect',
                        style: Theme.of(context)
                            .textTheme
                            .bodyLarge!
                            .apply(color: Colors.white, fontWeightDelta: 2),
                      ),
                    ),
                  ),
                )),
            const SizedBox(
              width: 16,
            ),
            Expanded(
                flex: 1,
                child: InkWell(
                  onTap: () {
                    Navigator.pop(context);
                  },
                  child: Container(
                    padding: const EdgeInsets.all(16),
                    decoration: BoxDecoration(
                      color: Colors.red.shade300,
                      borderRadius: BorderRadius.circular(8),
                    ),
                    child: Center(
                      child: Text(
                        'Kembali',
                        style: Theme.of(context)
                            .textTheme
                            .bodyLarge!
                            .apply(color: Colors.white, fontWeightDelta: 2),
                      ),
                    ),
                  ),
                )),
          ],
        )
      ],
    );
  }

  void onMessage(dynamic previous, dynamic next) {
    if (next != null) {
      show(next);
    }
  }

  // taking message as the text
  Future show(
    String message, {
    bool isError = false,
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
        backgroundColor: isError ? Colors.red : null,
        content: Text(
          message,
        ),
        duration: duration,
      ),
    );
  }
}
