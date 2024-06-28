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
      final res = await _firestore.collection('reports').add(
            reportDataModel.toJson(),
          );
    } catch (e) {
      rethrow;
    }
  }

  @override
  Future<ReportResponse?> getAverageBpmForToday() async {
    try {
      final now = DateTime.now();
      final startOfDay =
          Timestamp.fromDate(DateTime(now.year, now.month, now.day - 1));
      final endOfDay = Timestamp.fromDate(
          DateTime(now.year, now.month, now.day, 23, 59, 59));

      final res = await _firestore
          .collection('reports')
          .where('user_id', isEqualTo: _auth.currentUser!.uid)
          .where('created_at', isGreaterThanOrEqualTo: startOfDay)
          .where('created_at', isLessThanOrEqualTo: endOfDay)
          .get();

      print('res: ${res.docs}');
      if (res.docs.isNotEmpty) {
        final List<ReportDataModel> data = res.docs
            .map((doc) => ReportDataModel.fromJson(doc.data()))
            .toList();

        // Extract bpm_values and calculate the average
        final List<double> bpmValues =
            data.map((report) => report.bpmValue!.toDouble()).toList();
        print("SUCCESS 1");
        final double avgBlPM =
            bpmValues.reduce((a, b) => a + b) / bpmValues.length;
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
