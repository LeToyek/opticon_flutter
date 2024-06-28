import 'package:opticon_flutter/domain/model/report_data_model.dart';
import 'package:opticon_flutter/domain/model/report_model.dart';
import 'package:opticon_flutter/domain/repositories/report_repositories.dart';

abstract class ReportServiceImpl {
  Future<ReportModel> getReportHours();
  Future<ReportModel> getReportDays();
  Future<ReportModel> getReportMonths();
}

class ReportService implements ReportServiceImpl {
  final ReportRepository _reportRepository;

  ReportService(this._reportRepository);

  @override
  Future<ReportModel> getReportDays() async {
    try {
      final res = await _reportRepository.getAverageBpmForToday();
      final today = DateTime.now();
      if (res != null) {
        return ReportModel(
            avgBPMValue: 90,
            avgBlinkValue: int.parse(res.avgBlPM.floor().toString()),
            createdAt: today.toString(),
            reportData: res.reports);
      }
      return ReportModel(
        avgBPMValue: 90,
        avgBlinkValue: 10,
        createdAt: today.toString(),
      );
    } catch (e) {
      rethrow;
    }
  }

  @override
  Future<ReportModel> getReportHours() {
    return _reportRepository.getReportHours();
  }

  @override
  Future<ReportModel> getReportMonths() {
    return _reportRepository.getReportMonths();
  }

  Future<void> postReportData(ReportDataModel reportDataModel) async {
    try {
      return await _reportRepository.postReportData(reportDataModel);
    } catch (e) {
      rethrow;
    }
  }
}
