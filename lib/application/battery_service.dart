import 'package:opticon_flutter/domain/model/battery_model.dart';
import 'package:opticon_flutter/domain/repositories/battery_repositories.dart';

class BatteryService {
  final BatteryRepository _batteryRepository;

  BatteryService(this._batteryRepository);

  Future<void> getBattery() async {
    await _batteryRepository.getBatteryLevel();
  }

  Future<BatteryModel> getDummyBattery() async {
    final result = await _batteryRepository.getDummyBatteryLevel();
    final response = BatteryModel(
      batteryValue: result.batteryValue,
      createdAt: result.createdAt,
    );

    return response;
  }
}
