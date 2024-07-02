import 'package:intl/intl.dart';
import 'package:opticon_flutter/application/report_service.dart';
import 'package:opticon_flutter/application/services.dart';
import 'package:opticon_flutter/ui/controller/report_controller/report_state.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'report_controller.g.dart';

@riverpod
class ReportController extends _$ReportController {
  ReportService get _service => ref.read(reportServiceProvider);
  @override
  ReportState build() {
    fetchReport();
    return InitialReportState();
  }

  void fetchReport() async {
    state = LoadingReportState();
    final data = await _service.getReportDays();
    // data.reportData!.sort((a, b) => a.createdAt!.compareTo(b.createdAt!));
    final startHours = data.reportData!.first.createdAt!;
    final endHours = data.reportData!.last.createdAt!;

    //Timestamp to DateTime
    final DateTime start =
        DateTime.fromMillisecondsSinceEpoch(startHours.millisecondsSinceEpoch);
    final DateTime end =
        DateTime.fromMillisecondsSinceEpoch(endHours.millisecondsSinceEpoch);

    // start - end
    final diff = end.difference(start);
    final diffMinutes = diff.inMinutes;
    final hours = diffMinutes ~/ 60;
    final minutes = diffMinutes % 60;
    final walkingHours = '$hours:$minutes h';
    state = LoadedReportState(
      report: data,
      startHours: DateFormat('HH:mm').format(start).toString(),
      endHours: DateFormat('HH:mm').format(end).toString(),
      walkingHours: walkingHours,
    );
  }
}
