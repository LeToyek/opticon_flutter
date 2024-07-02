import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:intl/intl.dart';
import 'package:ionicons/ionicons.dart';
import 'package:opticon_flutter/domain/model/report_data_model.dart';
import 'package:opticon_flutter/ui/controller/report_controller/report_controller.dart';
import 'package:opticon_flutter/ui/controller/report_controller/report_state.dart';
import 'package:opticon_flutter/ui/pages/prediction_page/prediciton_page.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

class LaporanPage extends ConsumerWidget {
  const LaporanPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final colorScheme = Theme.of(context).colorScheme;
    final reportState = ref.watch(reportControllerProvider);
    final size = MediaQuery.of(context).size;
    final textTheme = Theme.of(context).textTheme;

    return Scaffold(
        appBar: AppBar(
          backgroundColor: colorScheme.primary,
          centerTitle: true,
          foregroundColor: Colors.white,
          title: const Text(
            'Laporan',
          ),
        ),
        body: switch (reportState) {
          InitialReportState() => const Center(
              child: CircularProgressIndicator(),
            ),
          LoadingReportState() => const Center(
              child: CircularProgressIndicator(),
            ),
          LoadedReportState(
            endHours: final endHours,
            startHours: final startHours,
            walkingHours: final walkingHours,
            report: final report
          ) =>
            SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.all(24.0),
                child: Center(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      SizedBox(
                        // margin: const EdgeInsets.only(bottom: 16),
                        height: size.height / 6,
                        child: Row(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            _buildWidgetDuration(context,
                                timeIndex: startHours,
                                label: "Start Time",
                                icon: Ionicons.car_sport_outline),
                            _buildWidgetDuration(context,
                                timeIndex: endHours,
                                label: "End Time",
                                icon: Ionicons.moon_outline,
                                isCenter: true),
                            _buildWidgetDuration(context,
                                timeIndex: walkingHours,
                                label: "End Time",
                                icon: Ionicons.time_outline)
                          ],
                        ),
                      ),
                      const SizedBox(
                        height: 16,
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Kedipan Mata Per Menit',
                            style: textTheme.titleMedium!.apply(
                                color: colorScheme.onBackground,
                                fontWeightDelta: 2),
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
                                      color: Colors.black,
                                      fontWeight: FontWeight.bold),
                                ),
                                tooltipBehavior: TooltipBehavior(
                                    enable: true,
                                    header: "Kedipan Mata",
                                    format: 'point.y KPM'),
                                primaryXAxis: const CategoryAxis(
                                  isVisible: true,
                                  labelStyle: TextStyle(
                                      color: Colors.black, fontSize: 12),
                                ),
                                primaryYAxis: const NumericAxis(
                                  isVisible: true,
                                  labelStyle: TextStyle(
                                      color: Colors.black, fontSize: 12),
                                ),
                                series: <CartesianSeries<ReportDataModel,
                                    String>>[
                                  AreaSeries<ReportDataModel, String>(
                                    // color: colorScheme.surfaceVariant,
                                    name: 'Kedipan Mata',
                                    animationDuration: 500,
                                    borderWidth: 2,
                                    borderColor: colorScheme.surfaceVariant,
                                    color: colorScheme.surfaceVariant
                                        .withOpacity(0.3),
                                    dataSource: report?.reportData ?? [],
                                    xValueMapper: (ReportDataModel data, _) =>
                                        convertDateTimeToMinute(
                                            data.createdAt!),
                                    yValueMapper: (ReportDataModel data, _) =>
                                        data.blinkCount ?? 0,
                                  ),
                                  // add average bpm

                                  LineSeries<ReportDataModel, String>(
                                    color: colorScheme.primary,
                                    enableTooltip: true,
                                    name: 'Rata-rata',
                                    dataSource: report?.reportData ?? [],
                                    xValueMapper: (ReportDataModel data, _) =>
                                        convertDateTimeToMinute(
                                            data.createdAt!),
                                    yValueMapper: (ReportDataModel data, _) =>
                                        report?.avgBlinkValue ?? 0,
                                  ),
                                ]),
                          ),
                          Row(
                            children: [
                              _buildItemResult(context,
                                  itemIndex: "${report?.avgBlinkValue} KPM",
                                  label: "Avg KPM",
                                  icon: Ionicons.eye_outline),
                              _buildItemResult(context,
                                  itemIndex:
                                      "${report?.highestBlinkDuration} detik",
                                  label: "Blink Duration",
                                  icon: Ionicons.eye_outline),
                            ],
                          )
                        ],
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Detak Jantung Per Menit',
                            style: textTheme.titleMedium!.apply(
                                color: colorScheme.onBackground,
                                fontWeightDelta: 2),
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
                                      color: Colors.black,
                                      fontWeight: FontWeight.bold),
                                ),
                                tooltipBehavior: TooltipBehavior(
                                    enable: true,
                                    header: "Kedipan Mata",
                                    format: 'point.y KPM'),
                                primaryXAxis: const CategoryAxis(
                                  isVisible: true,
                                  labelStyle: TextStyle(
                                      color: Colors.black, fontSize: 12),
                                ),
                                primaryYAxis: const NumericAxis(
                                  isVisible: true,
                                  labelStyle: TextStyle(
                                      color: Colors.black, fontSize: 12),
                                ),
                                series: <CartesianSeries<ReportDataModel,
                                    String>>[
                                  AreaSeries<ReportDataModel, String>(
                                    // color: colorScheme.surfaceVariant,
                                    name: 'Kedipan Mata',
                                    animationDuration: 500,
                                    borderWidth: 2,
                                    borderColor: colorScheme.surfaceVariant,
                                    color: colorScheme.surfaceVariant
                                        .withOpacity(0.3),
                                    dataSource: report?.reportData ?? [],
                                    xValueMapper: (ReportDataModel data, _) =>
                                        convertDateTimeToMinute(
                                            data.createdAt!),
                                    yValueMapper: (ReportDataModel data, _) =>
                                        data.bpmValue ?? 0,
                                  ),
                                  // add average bpm

                                  LineSeries<ReportDataModel, String>(
                                    color: colorScheme.primary,
                                    enableTooltip: true,
                                    name: 'Rata-rata',
                                    dataSource: report?.reportData ?? [],
                                    xValueMapper: (ReportDataModel data, _) =>
                                        convertDateTimeToMinute(
                                            data.createdAt!),
                                    yValueMapper: (ReportDataModel data, _) =>
                                        report?.avgBPMValue ?? 0,
                                  ),
                                ]),
                          ),
                          Row(
                            children: [
                              _buildItemResult(context,
                                  itemIndex: "${report?.avgBPMValue} BPM",
                                  label: "Avg BPM",
                                  icon: Ionicons.heart_outline)
                            ],
                          )
                        ],
                      ),
                      const SizedBox(
                        height: 16,
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Jadwal Kerja Efektif',
                            style: textTheme.titleMedium!.apply(
                                color: colorScheme.onBackground,
                                fontWeightDelta: 2),
                          ),
                          Text(
                            'Prediksi Jadwal Kerja Efektif Berdasarkan Data Detak Jantung dan Kedipan Mata menggunakan AI',
                            style: textTheme.bodyMedium!.apply(
                              color: colorScheme.onBackground.withOpacity(0.6),
                            ),
                          ),
                          const SizedBox(
                            height: 16,
                          ),
                          InkWell(
                            onTap: () {
                              Navigator.pushNamed(
                                  context, PredictionPage.routePath);
                            },
                            child: ListTile(
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(12),
                                  side: const BorderSide(
                                      width: 1, color: Colors.orange)),
                              leading: const Icon(
                                Ionicons.sparkles,
                                color: Colors.orange,
                              ),
                              title: Text(
                                "Prediksi Keamanan (AI)",
                                style: textTheme.labelLarge!
                                    .apply(fontWeightDelta: 2),
                              ),
                            )
                                .animate(
                                  onPlay: (c) => c.repeat(reverse: true),
                                )
                                .custom(
                                  duration: 1.seconds,
                                  builder: (context, value, child) {
                                    return DecoratedBox(
                                      decoration: BoxDecoration(
                                          color: colorScheme.surface,
                                          borderRadius:
                                              BorderRadius.circular(12),
                                          boxShadow: [
                                            // breathing shadow
                                            BoxShadow(
                                              color: Colors.orange
                                                  .withOpacity(0.5),
                                              // map value from 0 to 1 to 0 to 8
                                              blurRadius: 10 * value,
                                              offset: const Offset(0, 0),
                                            ),
                                          ]),
                                      child: child,
                                    );
                                  },
                                ),
                          ),
                          const SizedBox(
                            height: 16,
                          ),
                        ],
                      )
                    ],
                  ),
                ),
              ),
            ),
          ErrorReportState(message: final message) => Center(
              child: Text(message),
            ),
        });
  }

  Widget _buildWidgetDuration(context,
      {required String timeIndex,
      required String label,
      required IconData icon,
      bool isCenter = false}) {
    return Expanded(
      child: Container(
        padding: const EdgeInsets.all(16),
        margin: const EdgeInsets.symmetric(horizontal: 8),
        decoration: BoxDecoration(
          color: Theme.of(context).colorScheme.surface,
          borderRadius: BorderRadius.circular(12),
          // border: Border.all(color: Colors.grey, width: 1)
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
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
            const SizedBox(
              height: 4,
            ),
            Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text(
                  timeIndex,
                  style: Theme.of(context).textTheme.titleMedium!.apply(
                      color: Theme.of(context).colorScheme.onBackground,
                      // fontSizeDelta: 4,
                      fontWeightDelta: 2),
                ),
                const SizedBox(
                  height: 4,
                ),
                Text(
                  label,
                  style: Theme.of(context).textTheme.bodyMedium!.apply(
                        color: Theme.of(context).colorScheme.onBackground,
                      ),
                ),
              ],
            )
          ],
        ),
      ),
    );
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

  String convertDateTimeToMinute(Timestamp timestamp) {
    DateTime dateTime = timestamp.toDate();
    String formattedDate = DateFormat('kk:mm').format(dateTime);
    return formattedDate;
  }

  String getMessage({required String status}) {
    return status == 'healthy'
        ? 'Selamat! Data menunjukkan bahwa tubuh anda dalam keadaan sehat. Silahkan lihat grafik di bawah ini!'
        : 'Anda dalam kondisi tidak sehat, segera periksakan diri ke dokter!';
  }

  String getStatus({required String status}) {
    return status == 'healthy' ? 'Sehat' : 'Tidak Sehat';
  }

  Color getColor(context, {required String status}) {
    {
      final colorScheme = Theme.of(context).colorScheme;
      return status == 'healthy'
          ? colorScheme.surfaceVariant
          : colorScheme.error;
    }
  }

  Image getImage({required String status}) {
    return status == 'healthy'
        ? Image.asset(
            'assets/man_i.png',
          )
        : Image.asset('assets/pin_double_i.png');
  }
}
