import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:opticon_flutter/domain/utils/timestamp_converter.dart';

part 'report_data_model.freezed.dart';
part 'report_data_model.g.dart';

@freezed
class ReportDataModel with _$ReportDataModel {
  factory ReportDataModel({
    @JsonKey(name: 'bpm_value') int? bpmValue,
    @JsonKey(name: 'blink_count') int? blinkCount,
    @JsonKey(name: 'highest_blink_duration') int? highestBlinkDuration,
    @TimestampConverter() Timestamp? createdAt,
    @JsonKey(name: 'is_prediction') String? isPrediction,
    @JsonKey(name: 'user_id') String? userId,
  }) = _ReportDataModel;

  factory ReportDataModel.fromJson(Map<String, dynamic> json) =>
      _$ReportDataModelFromJson(json);
}
