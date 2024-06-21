import 'package:opticon_flutter/domain/repositories/bluetooth_repositories.dart';

class BluetoothService {
  final BluetoothRepository _bluetoothRepository;

  BluetoothService(this._bluetoothRepository);

  Future<void> enableBluetooth() async {
    await _bluetoothRepository.enableBluetooth();
  }
}
