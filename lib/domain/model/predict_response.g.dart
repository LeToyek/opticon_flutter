// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'predict_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$PredictResponseImpl _$$PredictResponseImplFromJson(
        Map<String, dynamic> json) =>
    _$PredictResponseImpl(
      predicitons: (json['predictions'] as List<dynamic>?)
          ?.map((e) => (e as num).toInt())
          .toList(),
      predicitonsBpm: (json['predictions_bpm'] as List<dynamic>?)
          ?.map((e) => (e as num).toInt())
          .toList(),
      predicitonsBd: (json['predictions_blink_duration'] as List<dynamic>?)
          ?.map((e) => (e as num).toInt())
          .toList(),
      accuracyBlinkCount: (json['accuracy_blink_count'] as num?)?.toDouble(),
      accuracyHighestBlinkDuration:
          (json['accuracy_highest_blink_duration'] as num?)?.toDouble(),
      accuracyBpm: (json['accuracy_bpm'] as num?)?.toDouble(),
      mse: (json['mse'] as num?)?.toDouble(),
      mae: (json['mae'] as num?)?.toDouble(),
    );

Map<String, dynamic> _$$PredictResponseImplToJson(
        _$PredictResponseImpl instance) =>
    <String, dynamic>{
      'predictions': instance.predicitons,
      'predictions_bpm': instance.predicitonsBpm,
      'predictions_blink_duration': instance.predicitonsBd,
      'accuracy_blink_count': instance.accuracyBlinkCount,
      'accuracy_highest_blink_duration': instance.accuracyHighestBlinkDuration,
      'accuracy_bpm': instance.accuracyBpm,
      'mse': instance.mse,
      'mae': instance.mae,
    };
