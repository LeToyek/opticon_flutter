// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'predict_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$PredictModelImpl _$$PredictModelImplFromJson(Map<String, dynamic> json) =>
    _$PredictModelImpl(
      inputData: (json['input_data'] as List<dynamic>)
          .map((e) => (e as num).toInt())
          .toList(),
      predictions: (json['predictions'] as List<dynamic>)
          .map((e) => (e as num).toDouble())
          .toList(),
    );

Map<String, dynamic> _$$PredictModelImplToJson(_$PredictModelImpl instance) =>
    <String, dynamic>{
      'input_data': instance.inputData,
      'predictions': instance.predictions,
    };
