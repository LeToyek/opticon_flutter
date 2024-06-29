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
      highestBlinkDuration: (json['highest_blink_duration'] as num?)?.toInt(),
      createdAt: _$JsonConverterFromJson<Object, Timestamp>(
          json['createdAt'], const TimestampConverter().fromJson),
      isPrediction: json['is_prediction'] as String?,
      userId: json['user_id'] as String?,
    );

Map<String, dynamic> _$$ReportDataModelImplToJson(
        _$ReportDataModelImpl instance) =>
    <String, dynamic>{
      'bpm_value': instance.bpmValue,
      'blink_count': instance.blinkCount,
      'highest_blink_duration': instance.highestBlinkDuration,
      'createdAt': _$JsonConverterToJson<Object, Timestamp>(
          instance.createdAt, const TimestampConverter().toJson),
      'is_prediction': instance.isPrediction,
      'user_id': instance.userId,
    };

Value? _$JsonConverterFromJson<Json, Value>(
  Object? json,
  Value? Function(Json json) fromJson,
) =>
    json == null ? null : fromJson(json as Json);

Json? _$JsonConverterToJson<Json, Value>(
  Value? value,
  Json? Function(Value value) toJson,
) =>
    value == null ? null : toJson(value);
