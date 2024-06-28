import 'package:freezed_annotation/freezed_annotation.dart';

part 'report_data_model.freezed.dart';
part 'report_data_model.g.dart';

@freezed
class ReportDataModel with _$ReportDataModel {
  factory ReportDataModel({
    @JsonKey(name: 'bpm_value') int? bpmValue,
    @JsonKey(name: 'blink_count') int? blinkCount,
    @JsonKey(name: 'highest_blink_duration') int? highestBlinkDuration,
    @JsonKey(name: 'created_at') String? createdAt,
    @JsonKey(name: 'is_prediction') String? isPrediction,
    @JsonKey(name: 'user_id') String? userId,
  }) = _ReportDataModel;

  factory ReportDataModel.fromJson(Map<String, dynamic> json) =>
      _$ReportDataModelFromJson(json);
}
