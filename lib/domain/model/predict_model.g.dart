// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'predict_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$PredictModelImpl _$$PredictModelImplFromJson(Map<String, dynamic> json) =>
    _$PredictModelImpl(
      avgBPMValue: (json['avgBPMValue'] as num?)?.toInt(),
      bpmSleepyThreshold: (json['bpmSleepyThreshold'] as num?)?.toInt(),
      avgBlinkValue: (json['avgBlinkValue'] as num?)?.toInt(),
      blinkSleepyThreshold: (json['blinkSleepyThreshold'] as num?)?.toInt(),
      heartBeatsMinutes: (json['heartBeatsMinutes'] as List<dynamic>?)
          ?.map((e) => HeartBeatModel.fromJson(e as Map<String, dynamic>))
          .toList(),
      blinkModels: (json['blinkModels'] as List<dynamic>?)
          ?.map((e) => BlinkModel.fromJson(e as Map<String, dynamic>))
          .toList(),
      status: json['status'] as String?,
      createdAt: json['createdAt'] as String?,
    );

Map<String, dynamic> _$$PredictModelImplToJson(_$PredictModelImpl instance) =>
    <String, dynamic>{
      'avgBPMValue': instance.avgBPMValue,
      'bpmSleepyThreshold': instance.bpmSleepyThreshold,
      'avgBlinkValue': instance.avgBlinkValue,
      'blinkSleepyThreshold': instance.blinkSleepyThreshold,
      'heartBeatsMinutes': instance.heartBeatsMinutes,
      'blinkModels': instance.blinkModels,
      'status': instance.status,
      'createdAt': instance.createdAt,
    };
