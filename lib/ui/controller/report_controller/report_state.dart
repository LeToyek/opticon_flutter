import 'package:opticon_flutter/domain/model/report_model.dart';

sealed class ReportState {
  ReportModel? report;

  ReportState({this.report});
}

class InitialReportState extends ReportState {
  InitialReportState() : super();
}

class LoadingReportState extends ReportState {
  LoadingReportState() : super();
}

class LoadedReportState extends ReportState {
  String startHours;
  String endHours;
  String walkingHours;
  LoadedReportState(
      {required ReportModel report,
      required this.walkingHours,
      required this.startHours,
      required this.endHours})
      : super(report: report);
}

class ErrorReportState extends ReportState {
  final String message;

  ErrorReportState({required this.message}) : super();
}
