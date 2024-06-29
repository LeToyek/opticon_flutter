import 'package:flutter/material.dart';
import 'package:opticon_flutter/domain/model/predict_model.dart';
import 'package:opticon_flutter/domain/model/predict_response.dart';
import 'package:opticon_flutter/domain/model/report_model.dart';

sealed class PredictionState {
  PredictResponse? predictResponse;
  ReportModel? report;

  PredictionState({this.report, this.predictResponse});
}

class InitialPredictionState extends PredictionState {
  InitialPredictionState() : super();
}

class LoadingPredictionState extends PredictionState {
  LoadingPredictionState() : super();
}

class LoadedPredictionState extends PredictionState {
  final List<PredictFinalModel> predictFinal;
  final double healthyScore;
  final String title, description;
  final Color color;
  LoadedPredictionState(
      {required ReportModel report,
      required PredictResponse predictResponse,
      required this.healthyScore,
      required this.title,
      required this.description,
      required this.color,
      required this.predictFinal})
      : super(report: report, predictResponse: predictResponse);
}

class ErrorPredictionState extends PredictionState {
  final String message;

  ErrorPredictionState({required this.message}) : super();
}
