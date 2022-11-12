// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'api_entity_string.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ApiEntityString _$ApiEntityStringFromJson(Map<String, dynamic> json) =>
    ApiEntityString(
      confidence: (json['confidence'] as num).toDouble(),
      value: json['value'] as String,
    );

Map<String, dynamic> _$ApiEntityStringToJson(ApiEntityString instance) =>
    <String, dynamic>{
      'confidence': instance.confidence,
      'value': instance.value,
    };
