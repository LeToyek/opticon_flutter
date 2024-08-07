import 'package:cloud_firestore_platform_interface/src/timestamp.dart';
import 'package:flutter/material.dart';
import 'package:opticon_flutter/application/prediction_service.dart';
import 'package:opticon_flutter/application/report_service.dart';
import 'package:opticon_flutter/application/services.dart';
import 'package:opticon_flutter/domain/model/predict_model.dart';
import 'package:opticon_flutter/ui/controller/prediction_controller/prediction_state.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'prediction_controller.g.dart';

@riverpod
class PredictionController extends _$PredictionController {
  PredicitonService get _service => ref.read(predictionServiceProvider);
  ReportService get _reportService => ref.read(reportServiceProvider);
  final int kpmThreshold = 15;
  @override
  PredictionState build() {
    fetchPrediction();
    return LoadingPredictionState();
  }

  void fetchPrediction() async {
    try {
      state = LoadingPredictionState();
      final reports = await _reportService.getReportDays();
      final predicts = await _service.getPredictionData(reports.reportData!);
      int healthyCounter = 0;
      int bpmHealthyCounter = 0;
      int bdHealthyCounter = 0;
      int bpmThreshold = 0;
      List<PredictFinalModel> predictFinals = [];
      List<PredictFinalModel> predictFinalBPM = [];
      List<PredictFinalModel> predictFinalBd = [];
      if (reports.reportData != null &&
          reports.reportData!.isNotEmpty &&
          predicts.predicitons!.isNotEmpty) {
        final Timestamp? lastReportTimestamp =
            reports.reportData!.last.createdAt;
        for (var i = 0; i < predicts.predicitons!.length; i++) {
          Timestamp predictionTimestamp = Timestamp.fromDate(
              lastReportTimestamp!.toDate().add(Duration(minutes: i + 1)));
          predictFinals.add(PredictFinalModel(
              predictValue: predicts.predicitons![i],
              predictTime: predictionTimestamp));
          predictFinalBPM.add(PredictFinalModel(
              predictValue: predicts.predicitonsBpm![i],
              predictTime: predictionTimestamp));
          predictFinalBd.add(PredictFinalModel(
              predictValue: predicts.predicitonsBd![i],
              predictTime: predictionTimestamp));

          if (predicts.predicitons![i] > kpmThreshold) {
            healthyCounter++;
          }

          int avgBPMFinal = predictFinalBPM
                  .map((e) => e.predictValue)
                  .reduce((value, element) => value + element) ~/
              predictFinalBPM.length;
          bpmThreshold = avgBPMFinal - 8;

          if (predicts.predicitonsBpm![i] > bpmThreshold) {
            bpmHealthyCounter++;
          }
          if (predicts.predicitonsBd![i] / 100 <= 0.8) {
            bdHealthyCounter++;
          }
        }
      }
      final healthScoreFinal =
          (healthyCounter + bpmHealthyCounter + bdHealthyCounter) /
              (predicts.predicitons!.length * 3);
      final message = getMessage(healthScoreFinal);

      state = LoadedPredictionState(
        color: message['color'],
        description: message['description'],
        title: message['title'],
        report: reports,
        predictResponse: predicts,
        healthyScore: healthyCounter / predicts.predicitons!.length,
        predictFinal: predictFinals,
        kpmThreshold: kpmThreshold,
        healthyScoreBPM: bpmHealthyCounter / predicts.predicitons!.length,
        predictBPMFinal: predictFinalBPM,
        predictBdFinal: predictFinalBd,
        bpmThreshold: bpmThreshold,
        healthyFinalScore: healthScoreFinal,
      );
    } catch (e) {
      state = ErrorPredictionState(
        message: e.toString(),
      );
    }
    // final heartBeatData = await _service.heartBeatPredict();
  }

  Map<String, dynamic> getMessage(double healthyScore) {
    if (healthyScore > 0.66) {
      return {
        'title': 'Aman',
        'description':
            'Anda dalam kondisi yang aman untuk berkendara, tetap jaga kesehatan dan keamanan anda',
        'color': const Color(0xFF00CC83)
      };
    } else if (healthyScore > 0.33) {
      return {
        'title': 'Waspada',
        'description':
            'Anda dalam kondisi yang perlu diwaspadai, segera istirahat dan jangan berkendara',
        'color': Colors.orange
      };
    } else {
      return {
        'title': 'Bahaya',
        'description':
            'Anda dalam kondisi yang sangat berbahaya, segera istirahat dan jangan berkendara',
        'color': Colors.red
      };
    }
  }
}
