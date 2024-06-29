import 'package:opticon_flutter/domain/model/predict_response.dart';
import 'package:opticon_flutter/domain/model/report_data_model.dart';
import 'package:opticon_flutter/domain/repositories/prediction_repositories.dart';

class PredicitonService {
  final PredicitonRepository _predictionRepository;

  PredicitonService(this._predictionRepository);

  // Future<List<>
  Future<PredictResponse> getPredictionData(
      List<ReportDataModel> reports) async {
    try {
      return await _predictionRepository.getPredictionData(reports);
    } catch (e) {
      rethrow;
    }
  }
}
