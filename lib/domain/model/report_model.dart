import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:opticon_flutter/domain/model/blink_model.dart';
import 'package:opticon_flutter/domain/model/heart_beat_model.dart';
import 'package:opticon_flutter/domain/model/report_data_model.dart';

part 'report_model.freezed.dart';
part 'report_model.g.dart';

@freezed
class ReportModel with _$ReportModel {
  const factory ReportModel({
    int? avgBPMValue,
    int? avgBlinkValue,
    List<HeartBeatModel>? heartBeatsMinutes,
    List<BlinkModel>? blinkModels,
    double? highestBlinkDuration,
    List<ReportDataModel>? reportData,
    String? status,
    String? createdAt,
  }) = _ReportModel;

  factory ReportModel.fromJson(Map<String, dynamic> json) =>
      _$ReportModelFromJson(json);
}
