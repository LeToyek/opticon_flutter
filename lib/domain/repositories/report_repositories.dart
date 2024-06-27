import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:opticon_flutter/datasources/iot_api_client.dart';
import 'package:opticon_flutter/domain/model/blink_model.dart';
import 'package:opticon_flutter/domain/model/heart_beat_model.dart';
import 'package:opticon_flutter/domain/model/report_data_model.dart';
import 'package:opticon_flutter/domain/model/report_model.dart';

abstract class ReportRepositoryImpl {
  Future<ReportModel> getReportHours();
  Future<ReportModel> getReportDays();
  Future<ReportModel> getReportMonths();
}

class ReportRepository implements ReportRepositoryImpl {
  final IotApiClient _iotApiClient;
  final FirebaseFirestore _firestore;

  ReportRepository(this._iotApiClient, this._firestore);

  @override
  Future<ReportModel> getReportHours() async {
    return ReportModel(
      avgBPMValue: 80,
      avgOxygenValue: 90,
      avgBlinkValue: 10,
      createdAt: DateTime.now().toString(),
    );
  }

  @override
  Future<ReportModel> getReportDays() async {
    final currentTime = DateTime.now();
    var lastTime = currentTime.add(const Duration(minutes: 10));
    List<BlinkModel> blinkModels = [];
    List<HeartBeatModel> heartBeatsMinutes = [];

    final randomValBlink = [10, 21, 17, 18, 20, 15, 12, 10, 16, 14];
    final randomBPM = [80, 90, 85, 88, 92, 95, 100, 88, 90, 85];

    for (int i = 0; i < 10; i++) {
      lastTime = lastTime.add(const Duration(minutes: 10));
      blinkModels.add(
        BlinkModel(
          blinkValue: randomValBlink[i],
          createdAt: lastTime.toString(),
        ),
      );
      heartBeatsMinutes.add(
        HeartBeatModel(
          bpmValue: randomBPM[i],
          createdAt: lastTime.toString(),
        ),
      );
    }
    print("Blink: $blinkModels");
    print("heartBeatsMinutes: $heartBeatsMinutes");

    final avgBPMValue = heartBeatsMinutes.fold<int>(
            0, (previousValue, element) => previousValue + element.bpmValue!) ~/
        heartBeatsMinutes.length;
    final avgBlinkValue = blinkModels.fold<int>(0,
            (previousValue, element) => previousValue + element.blinkValue!) ~/
        blinkModels.length;

    print("Heart Beats: $heartBeatsMinutes");
    return ReportModel(
      avgBPMValue: avgBPMValue,
      avgBlinkValue: avgBlinkValue,
      avgOxygenValue: 90,
      blinkModels: blinkModels,
      heartBeatsMinutes: heartBeatsMinutes,
      status: 'healthy',
      createdAt: DateTime.now().toString(),
    );
  }

  @override
  Future<ReportModel> getReportMonths() {
    // TODO: implement getReportMonths
    throw UnimplementedError();
  }

  Future<void> postReportData(ReportDataModel reportDataModel) async {
    try {
      final res = await _firestore.collection('reports').add(
            reportDataModel.toJson(),
          );
    } catch (e) {
      rethrow;
    }
  }
}
