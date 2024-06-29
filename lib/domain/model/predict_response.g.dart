// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'predict_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$PredictResponseImpl _$$PredictResponseImplFromJson(
        Map<String, dynamic> json) =>
    _$PredictResponseImpl(
      inputData: (json['input_data'] as List<dynamic>?)
          ?.map((e) => (e as num).toInt())
          .toList(),
      predicitons: (json['predictions'] as List<dynamic>?)
          ?.map((e) => (e as num).toDouble())
          .toList(),
    );

Map<String, dynamic> _$$PredictResponseImplToJson(
        _$PredictResponseImpl instance) =>
    <String, dynamic>{
      'input_data': instance.inputData,
      'predictions': instance.predicitons,
    };
