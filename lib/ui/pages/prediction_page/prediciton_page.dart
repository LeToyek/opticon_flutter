import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:gauge_indicator/gauge_indicator.dart';
import 'package:intl/intl.dart';
import 'package:ionicons/ionicons.dart';
import 'package:lottie/lottie.dart';
import 'package:opticon_flutter/domain/model/predict_model.dart';
import 'package:opticon_flutter/domain/model/report_data_model.dart';
import 'package:opticon_flutter/ui/controller/prediction_controller/prediction_controller.dart';
import 'package:opticon_flutter/ui/controller/prediction_controller/prediction_state.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

class PredictionPage extends ConsumerStatefulWidget {
  const PredictionPage({super.key});

  static const routePath = '/prediction';

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _PredictionPageState();
}

class _PredictionPageState extends ConsumerState<PredictionPage> {
  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;
    final textTheme = Theme.of(context).textTheme;
    final predictionController = ref.watch(predictionControllerProvider);
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.orange,
        centerTitle: true,
        foregroundColor: Colors.white,
        title: const Text(
          'Prediksi Keamanan',
        ),
      ),
      body: switch (predictionController) {
        InitialPredictionState() => Center(
            child: Lottie.asset('assets/loading_puzzle_gif.json', height: 100)),
        LoadingPredictionState() => Center(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Lottie.asset(
                  'assets/loading_puzzle_gif.json',
                  height: 100,
                ),
                const Text(
                  "Memproses Prediksi Anda...",
                  style:
                      TextStyle(fontWeight: FontWeight.bold, color: Colors.red),
                )
                    .animate(onPlay: (c) => c.loop())
                    .tint(color: Colors.orange)
                    .then(delay: const Duration(seconds: 1))
                    .tint(color: Colors.red)
                    .then(delay: const Duration(seconds: 1))
                    .tint(color: Colors.orange)
              ],
            ),
          ),
        LoadedPredictionState(
          report: final reports,
          bpmThreshold: final bpmThreshold,
          predictBPMFinal: final predictBPMFinal,
          predictBdFinal: final predictBdFinal,
          healthyScoreBPM: final healthyScoreBPM,
          predictFinal: final predictFinals,
          healthyScore: final healthyScore,
          title: final title,
          color: final colorTitle,
          description: final description,
          kpmThreshold: final kpmThreshold,
        ) =>
          SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.all(24.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Keamanan Prediksi Anda',
                    style: textTheme.titleMedium!.apply(
                        color: colorScheme.onBackground, fontWeightDelta: 2),
                  ),
                  const SizedBox(
                    height: 12,
                  ),
                  Center(
                    child: AnimatedRadialGauge(
                        duration: const Duration(seconds: 1),
                        curve: Curves.elasticOut,
                        radius: 100,

                        /// Gauge value.
                        value: 100 - (healthyScore * 100),
                        axis: GaugeAxis(
                          min: 0,
                          max: 100,
                          degrees: 270,
                          style: const GaugeAxisStyle(
                            thickness: 20,
                            background: Color(0xFFDFE2EC),
                            segmentSpacing: 4,
                          ),

                          /// Define the pointer that will indicate the progress (optional).
                          pointer: GaugePointer.needle(
                            width: 12,
                            height: 100,
                            borderRadius: 16,
                            color: colorScheme.onBackground,
                          ),

                          /// Define the progress bar (optional).
                          progressBar: const GaugeProgressBar.rounded(
                              color: Colors.transparent),

                          /// Define axis segments (optional).
                          segments: [
                            GaugeSegment(
                              from: 0,
                              to: 50,
                              // color: Color.fromARGB(255, 60, 80, 132),
                              gradient: GaugeAxisGradient(colors: [
                                colorScheme.surfaceVariant,
                                Colors.yellow.shade300,
                                // Colors.red
                              ]),
                              border: const GaugeBorder(
                                color: Colors.transparent,
                              ),
                              cornerRadius: Radius.zero,
                            ),
                            const GaugeSegment(
                                from: 50,
                                to: 100,
                                // color: Color.fromARGB(255, 60, 80, 132),
                                gradient: GaugeAxisGradient(
                                  colors: [
                                    Colors.yellow,
                                    Colors.redAccent,
                                    // Colors.red
                                  ],
                                ),
                                cornerRadius: Radius.zero,
                                border: GaugeBorder(color: Colors.transparent)),
                          ],

                          /// You can also, define the child builder.
                          /// You will build a value label in the following way, but you can use the widget of your choice.
                          ///
                          /// For non-value related widgets, take a look at the [child] parameter.
                          /// ```
                        )),
                  ),
                  const SizedBox(
                    height: 16,
                  ),
                  Center(
                    child: Column(
                      children: [
                        Text(
                          title,
                          style: textTheme.displaySmall!
                              .apply(color: colorTitle, fontWeightDelta: 2),
                        ),
                        Text(description,
                            textAlign: TextAlign.center,
                            style: textTheme.bodyMedium!.apply(
                                color:
                                    colorScheme.onBackground.withOpacity(0.6))),
                      ],
                    ),
                  ),
                  const SizedBox(
                    height: 16,
                  ),
                  Text(
                    'Kedipan Mata Per Menit',
                    style: textTheme.titleMedium!.apply(
                        color: colorScheme.onBackground, fontWeightDelta: 2),
                  ),
                  const SizedBox(
                    height: 16,
                  ),
                  SizedBox(
                    // width: MediaQuery.of(context).size.width * 0.8,
                    height: MediaQuery.of(context).size.height / 4,
                    child: SfCartesianChart(
                        legend: const Legend(
                          isVisible: true,
                          textStyle: TextStyle(
                              color: Colors.black, fontWeight: FontWeight.bold),
                        ),
                        tooltipBehavior: TooltipBehavior(
                            enable: true,
                            header: "Kedipan Mata",
                            format: 'point.y KPM'),
                        primaryXAxis: const CategoryAxis(
                          isVisible: true,
                          labelStyle:
                              TextStyle(color: Colors.black, fontSize: 12),
                        ),
                        primaryYAxis: const NumericAxis(
                          isVisible: true,
                          labelStyle:
                              TextStyle(color: Colors.black, fontSize: 12),
                        ),
                        series: <CartesianSeries<dynamic, String>>[
                          AreaSeries<ReportDataModel, String>(
                            // color: colorScheme.surfaceVariant,
                            name: 'Kedipan Mata',
                            animationDuration: 500,
                            borderWidth: 2,
                            borderColor: colorScheme.surfaceVariant,
                            color: colorScheme.surfaceVariant.withOpacity(0.3),
                            dataSource: reports?.reportData ?? [],
                            xValueMapper: (ReportDataModel data, _) =>
                                convertDateTimeToMinute(data.createdAt!),
                            yValueMapper: (ReportDataModel data, _) =>
                                data.blinkCount ?? 0,
                          ),
                          AreaSeries<PredictFinalModel, String>(
                            // color: colorScheme.surfaceVariant,
                            name: 'Prediksi',
                            animationDuration: 500,
                            borderWidth: 2,
                            borderColor: Colors.orange,
                            color: Colors.orange.withOpacity(0.3),
                            dataSource: predictFinals ?? [],
                            xValueMapper: (PredictFinalModel data, _) =>
                                convertDateTimeToMinute(data.predictTime),
                            yValueMapper: (PredictFinalModel data, _) =>
                                data.predictValue ?? 0,
                          ),
                          // add average bpm

                          LineSeries<ReportDataModel, String>(
                            color: colorScheme.primary,
                            enableTooltip: true,
                            name: 'Frekuensi Kedipan Mata Normal',
                            dataSource: [
                              ...reports!.reportData!,
                              ...predictFinals
                                  .map((prediction) => ReportDataModel(
                                        createdAt: prediction.predictTime,
                                        blinkCount:
                                            prediction.predictValue.toInt(),
                                      )),
                            ],
                            xValueMapper: (ReportDataModel data, _) =>
                                convertDateTimeToMinute(data.createdAt!),
                            yValueMapper: (ReportDataModel data, _) =>
                                kpmThreshold,
                          ),
                        ]),
                  ),
                  Row(
                    children: [
                      _buildItemResult(context,
                          itemIndex: "${reports.avgBlinkValue} KPM",
                          label: "Avg KPM",
                          icon: Ionicons.eye_outline),
                      _buildItemResult(context,
                          itemIndex: "${reports.highestBlinkDuration} detik",
                          label: "Blink Duration",
                          icon: Ionicons.eye_outline),
                    ],
                  ),
                  const SizedBox(
                    height: 16,
                  ),
                  Text(
                    'Detak Jantung Per Menit',
                    style: textTheme.titleMedium!.apply(
                        color: colorScheme.onBackground, fontWeightDelta: 2),
                  ),
                  const SizedBox(
                    height: 16,
                  ),
                  SizedBox(
                    // width: MediaQuery.of(context).size.width * 0.8,
                    height: MediaQuery.of(context).size.height / 4,
                    child: SfCartesianChart(
                        legend: const Legend(
                          isVisible: true,
                          textStyle: TextStyle(
                              color: Colors.black, fontWeight: FontWeight.bold),
                        ),
                        tooltipBehavior: TooltipBehavior(
                            enable: true,
                            header: "Detak Jantung",
                            format: 'point.y BPM'),
                        primaryXAxis: const CategoryAxis(
                          isVisible: true,
                          labelStyle:
                              TextStyle(color: Colors.black, fontSize: 12),
                        ),
                        primaryYAxis: const NumericAxis(
                          isVisible: true,
                          labelStyle:
                              TextStyle(color: Colors.black, fontSize: 12),
                        ),
                        series: <CartesianSeries<dynamic, String>>[
                          AreaSeries<ReportDataModel, String>(
                            // color: colorScheme.surfaceVariant,
                            name: 'Detak Jantung',
                            animationDuration: 500,
                            borderWidth: 2,
                            borderColor: colorScheme.surfaceVariant,
                            color: colorScheme.surfaceVariant.withOpacity(0.3),
                            dataSource: reports.reportData ?? [],
                            xValueMapper: (ReportDataModel data, _) =>
                                convertDateTimeToMinute(data.createdAt!),
                            yValueMapper: (ReportDataModel data, _) =>
                                data.bpmValue ?? 0,
                          ),
                          AreaSeries<PredictFinalModel, String>(
                            // color: colorScheme.surfaceVariant,
                            name: 'Prediksi',
                            animationDuration: 500,
                            borderWidth: 2,
                            borderColor: Colors.orange,
                            color: Colors.orange.withOpacity(0.3),
                            dataSource: predictBPMFinal ?? [],
                            xValueMapper: (PredictFinalModel data, _) =>
                                convertDateTimeToMinute(data.predictTime),
                            yValueMapper: (PredictFinalModel data, _) =>
                                data.predictValue ?? 0,
                          ),
                          // add average bpm

                          LineSeries<ReportDataModel, String>(
                            color: colorScheme.primary,
                            enableTooltip: true,
                            name: 'Detak Jantung Normal',
                            dataSource: [
                              ...reports.reportData!,
                              ...predictFinals
                                  .map((prediction) => ReportDataModel(
                                        createdAt: prediction.predictTime,
                                        blinkCount:
                                            prediction.predictValue.toInt(),
                                      )),
                            ],
                            xValueMapper: (ReportDataModel data, _) =>
                                convertDateTimeToMinute(data.createdAt!),
                            yValueMapper: (ReportDataModel data, _) =>
                                bpmThreshold,
                          ),
                        ]),
                  ),
                  Row(
                    children: [
                      _buildItemResult(context,
                          itemIndex: "${reports.avgBPMValue} BPM",
                          label: "Avg BPM",
                          icon: Ionicons.eye_outline),
                    ],
                  ),
                  const SizedBox(
                    height: 16,
                  ),
                  Text(
                    'Durasi Kedipan Per Menit',
                    style: textTheme.titleMedium!.apply(
                        color: colorScheme.onBackground, fontWeightDelta: 2),
                  ),
                  const SizedBox(
                    height: 16,
                  ),
                  SizedBox(
                    // width: MediaQuery.of(context).size.width * 0.8,
                    height: MediaQuery.of(context).size.height / 4,
                    child: SfCartesianChart(
                        legend: const Legend(
                          isVisible: true,
                          textStyle: TextStyle(
                              color: Colors.black, fontWeight: FontWeight.bold),
                        ),
                        tooltipBehavior: TooltipBehavior(
                            enable: true,
                            header: "Durasi Kedipan",
                            format: 'point.y Detik'),
                        primaryXAxis: const CategoryAxis(
                          isVisible: true,
                          labelStyle:
                              TextStyle(color: Colors.black, fontSize: 12),
                        ),
                        primaryYAxis: const NumericAxis(
                          isVisible: true,
                          labelStyle:
                              TextStyle(color: Colors.black, fontSize: 12),
                        ),
                        series: <CartesianSeries<dynamic, String>>[
                          AreaSeries<ReportDataModel, String>(
                            // color: colorScheme.surfaceVariant,
                            name: 'Durasi Kedipan',
                            animationDuration: 500,
                            borderWidth: 2,
                            borderColor: colorScheme.surfaceVariant,
                            color: colorScheme.surfaceVariant.withOpacity(0.3),
                            dataSource: reports.reportData ?? [],
                            xValueMapper: (ReportDataModel data, _) =>
                                convertDateTimeToMinute(data.createdAt!),
                            yValueMapper: (ReportDataModel data, _) =>
                                data.highestBlinkDuration! / 100 ?? 0,
                          ),
                          AreaSeries<PredictFinalModel, String>(
                            // color: colorScheme.surfaceVariant,
                            name: 'Prediksi',
                            animationDuration: 500,
                            borderWidth: 2,
                            borderColor: Colors.orange,
                            color: Colors.orange.withOpacity(0.3),
                            dataSource: predictBdFinal ?? [],
                            xValueMapper: (PredictFinalModel data, _) =>
                                convertDateTimeToMinute(data.predictTime),
                            yValueMapper: (PredictFinalModel data, _) =>
                                data.predictValue / 100 ?? 0,
                          ),
                          // add average bpm

                          LineSeries<ReportDataModel, String>(
                            color: colorScheme.primary,
                            enableTooltip: true,
                            name: 'Durasi Kedipan Mata Normal',
                            dataSource: [
                              ...reports.reportData!,
                              ...predictFinals
                                  .map((prediction) => ReportDataModel(
                                        createdAt: prediction.predictTime,
                                        blinkCount:
                                            prediction.predictValue.toInt(),
                                      )),
                            ],
                            xValueMapper: (ReportDataModel data, _) =>
                                convertDateTimeToMinute(data.createdAt!),
                            yValueMapper: (ReportDataModel data, _) => 1,
                          ),
                        ]),
                  ),
                  Row(
                    children: [
                      _buildItemResult(context,
                          itemIndex: "${reports.avgBPMValue} BPM",
                          label: "Avg BPM",
                          icon: Ionicons.eye_outline),
                    ],
                  )
                ],
              ),
            ),
          ),
        ErrorPredictionState(message: final message) => Text('Error: $message'),
      },
      // body: Padding(
      //   padding: const EdgeInsets.all(24.0),
      //   child: Column(
      //     crossAxisAlignment: CrossAxisAlignment.start,
      //     children: [
      //       Text(
      //         'Jadwal Kerja Efektif',
      //         style: textTheme.titleMedium!
      //             .apply(color: colorScheme.onBackground, fontWeightDelta: 2),
      //       ),
      //       Text(
      //         'Prediksi Jadwal Kerja Efektif Berdasarkan Data Detak Jantung dan Kedipan Mata menggunakan AI',
      //         style: textTheme.bodyMedium!.apply(
      //           color: colorScheme.onBackground.withOpacity(0.6),
      //         ),
      //       ),
      //     ],
      //   ),
      // ),
    );
  }

  String convertDateTimeToMinute(Timestamp timestamp) {
    DateTime dateTime = timestamp.toDate();
    String formattedDate = DateFormat('kk:mm').format(dateTime);
    return formattedDate;
  }

  Widget _buildItemResult(context,
      {required String itemIndex,
      required String label,
      required IconData icon}) {
    return Expanded(
      child: Container(
        padding: const EdgeInsets.all(16),
        margin: const EdgeInsets.symmetric(horizontal: 8),
        decoration: BoxDecoration(
          color: Theme.of(context).colorScheme.surface,
          borderRadius: BorderRadius.circular(12),
          boxShadow: [
            BoxShadow(
              color: Theme.of(context).colorScheme.primary.withOpacity(0.1),
              blurRadius: 10,
              offset: const Offset(0, 0),
            )
          ],
        ),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Container(
              padding: const EdgeInsets.all(8),
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: Theme.of(context).colorScheme.primary.withOpacity(0.1),
              ),
              child: Icon(
                icon,
                size: 24,
                color: Theme.of(context).colorScheme.primary,
              ),
            ),
            Container(
              margin: const EdgeInsets.only(left: 8),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    itemIndex,
                    style: Theme.of(context).textTheme.titleMedium!.apply(
                        color: Theme.of(context).colorScheme.onBackground,
                        fontWeightDelta: 2),
                  ),
                  Text(
                    label,
                    style: Theme.of(context).textTheme.bodySmall!.apply(
                          color: Theme.of(context)
                              .colorScheme
                              .onBackground
                              .withOpacity(0.4),
                        ),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
