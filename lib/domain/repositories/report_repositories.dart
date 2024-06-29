import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:opticon_flutter/datasources/iot_api_client.dart';
import 'package:opticon_flutter/domain/model/report_data_model.dart';
import 'package:opticon_flutter/domain/model/report_model.dart';

abstract class ReportRepositoryImpl {
  Future<ReportModel> getReportHours();
  Future<ReportResponse?> getAverageBpmForToday();
  Future<ReportModel> getReportMonths();
}

class ReportRepository implements ReportRepositoryImpl {
  final IotApiClient _iotApiClient;
  final FirebaseFirestore _firestore;
  final FirebaseAuth _auth;

  ReportRepository(this._iotApiClient, this._firestore, this._auth);

  @override
  Future<ReportModel> getReportHours() async {
    return ReportModel(
      avgBPMValue: 80,
      avgBlinkValue: 10,
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
      print('reportDataModel: ${reportDataModel.toJson()}');
      final modelJson = reportDataModel.toJson();
      modelJson['createdAt'] = FieldValue.serverTimestamp();
      final res = await _firestore.collection('reports').add(
            modelJson,
          );
    } catch (e) {
      rethrow;
    }
  }

  @override
  Future<ReportResponse?> getAverageBpmForToday() async {
    try {
      final now = DateTime.now();

      DateTime startOfDay = DateTime(now.year, now.month, now.day, 0, 0, 0);
      DateTime endOfDay = DateTime(now.year, now.month, now.day, 23, 59, 59);

      // Convert to Timestamps
      Timestamp startTimestamp = Timestamp.fromDate(startOfDay);
      Timestamp endTimestamp = Timestamp.fromDate(endOfDay);
      final res = await _firestore
          .collection('reports')
          .where('user_id', isEqualTo: _auth.currentUser!.uid)
          .where('createdAt', isGreaterThanOrEqualTo: startTimestamp)
          .where('createdAt', isLessThanOrEqualTo: endTimestamp)
          .orderBy('createdAt')
          .get();

      print('res: ${res.docs}');
      if (res.docs.isNotEmpty) {
        final List<ReportDataModel> data = res.docs
            .map((doc) => ReportDataModel.fromJson(doc.data()))
            .toList();

        // Extract bpm_values and calculate the average
        final List<double> blinkCounts =
            data.map((report) => report.blinkCount!.toDouble()).toList();
        print("SUCCESS 1");
        final double avgBlPM =
            blinkCounts.reduce((a, b) => a + b) / blinkCounts.length;
        print("SUCCESS 2");
        final int highestBlinkDuration = data
            .map((report) => report.highestBlinkDuration!)
            .reduce((a, b) => a > b ? a : b);
        print("SUCCESS 3");

        return ReportResponse(
            avgBlPM: avgBlPM,
            reports: data,
            highestBlinkDuration: highestBlinkDuration);
      }
      return null;
    } catch (e) {
      throw Exception(
          'Error occurred while fetching reports for user ID: ${_auth.currentUser!.uid} $e');
    }
  }
}

class ReportResponse {
  final double avgBlPM;
  final int highestBlinkDuration;
  final List<ReportDataModel> reports;

  ReportResponse({
    required this.avgBlPM,
    required this.reports,
    required this.highestBlinkDuration,
  });
}
