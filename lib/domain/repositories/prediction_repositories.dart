import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:opticon_flutter/datasources/iot_api_client.dart';
import 'package:opticon_flutter/domain/model/predict_response.dart';
import 'package:opticon_flutter/domain/model/report_data_model.dart';

class PredicitonRepository {
  final FirebaseFirestore _firestore;
  final FirebaseAuth _auth;
  final IotApiClient _iotApiClient;

  PredicitonRepository(this._firestore, this._auth, this._iotApiClient);

  Future<PredictResponse> getPredictionData(
      List<ReportDataModel> reports) async {
    try {
      final res = await _iotApiClient.post('/predict', data: {
        'reports': reports.map((e) => e.toJson()).toList(),
      });
      print('PREDICTION RESPONSE: ${res.data.toString()}');
      return PredictResponse.fromJson(res.data);
    } catch (e) {
      print('ERROR: $e');
      rethrow;
    }
  }
}
