// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'report_data_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$ReportDataModelImpl _$$ReportDataModelImplFromJson(
        Map<String, dynamic> json) =>
    _$ReportDataModelImpl(
      bpmValue: (json['bpm_value'] as num?)?.toInt(),
      blinkCount: (json['blink_count'] as num?)?.toInt(),
      blinkDuration: (json['blink_duration'] as num?)?.toDouble(),
      createdAt: json['created_at'] as String?,
      isPrediction: json['is_prediction'] as String?,
      userId: json['user_id'] as String?,
    );

Map<String, dynamic> _$$ReportDataModelImplToJson(
        _$ReportDataModelImpl instance) =>
    <String, dynamic>{
      'bpm_value': instance.bpmValue,
      'blink_count': instance.blinkCount,
      'blink_duration': instance.blinkDuration,
      'created_at': instance.createdAt,
      'is_prediction': instance.isPrediction,
      'user_id': instance.userId,
    };
