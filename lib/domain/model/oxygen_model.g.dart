// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'oxygen_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$OxygenModelImpl _$$OxygenModelImplFromJson(Map<String, dynamic> json) =>
    _$OxygenModelImpl(
      oxygenValue: (json['oxygen_value'] as num?)?.toInt(),
      createdAt: json['created_at'] as String?,
    );

Map<String, dynamic> _$$OxygenModelImplToJson(_$OxygenModelImpl instance) =>
    <String, dynamic>{
      'oxygen_value': instance.oxygenValue,
      'created_at': instance.createdAt,
    };
