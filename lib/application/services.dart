import 'package:opticon_flutter/application/battery_service.dart';
import 'package:opticon_flutter/application/bluetooth_service.dart';
import 'package:opticon_flutter/application/prediction_service.dart';
import 'package:opticon_flutter/application/report_service.dart';
import 'package:opticon_flutter/application/user_service.dart';
import 'package:opticon_flutter/domain/repositories/repositories.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'services.g.dart';

@riverpod
BatteryService batteryService(BatteryServiceRef ref) =>
    BatteryService(ref.watch(batteryRepositoryProvider));

@riverpod
ReportService reportService(ReportServiceRef ref) =>
    ReportService(ref.watch(reportRepositoryProvider));

@riverpod
UserService userService(UserServiceRef ref) =>
    UserService(ref.watch(userRepositoryProvider));

@riverpod
BluetoothService bluetoothService(BluetoothServiceRef ref) =>
    BluetoothService(ref.watch(bluetoothRepositoryProvider));

@riverpod
PredicitonService predictionService(PredictionServiceRef ref) =>
    PredicitonService(ref.watch(predictionRepositoryProvider));
