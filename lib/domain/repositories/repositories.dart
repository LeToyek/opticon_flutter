import 'package:opticon_flutter/datasources/datasources.dart';
import 'package:opticon_flutter/domain/repositories/battery_repositories.dart';
import 'package:opticon_flutter/domain/repositories/bluetooth_repositories.dart';
import 'package:opticon_flutter/domain/repositories/heart_beat_repositories.dart';
import 'package:opticon_flutter/domain/repositories/prediction_repositories.dart';
import 'package:opticon_flutter/domain/repositories/report_repositories.dart';
import 'package:opticon_flutter/domain/repositories/user_repositories.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'repositories.g.dart';

@riverpod
BatteryRepository batteryRepository(BatteryRepositoryRef ref) =>
    BatteryRepository(ref.watch(iotApiClientProvider));

@riverpod
HeartBeatRepository heartBeatRepository(HeartBeatRepositoryRef ref) =>
    HeartBeatRepository(ref.watch(iotApiClientProvider));

@riverpod
ReportRepository reportRepository(ReportRepositoryRef ref) => ReportRepository(
    ref.watch(iotApiClientProvider), ref.watch(firebaseFirestoreProvider));

@riverpod
UserRepository userRepository(UserRepositoryRef ref) =>
    UserRepository(ref.watch(firebaseAuthProvider));

@riverpod
BluetoothRepository bluetoothRepository(BluetoothRepositoryRef ref) =>
    BluetoothRepository(ref.watch(firebaseFirestoreProvider));

@riverpod
PredicitonRepository predictionRepository(PredictionRepositoryRef ref) =>
    PredicitonRepository(ref.watch(firebaseFirestoreProvider));
