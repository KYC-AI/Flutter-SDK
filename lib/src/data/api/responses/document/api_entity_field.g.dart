// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'api_entity_field.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ApiEntityField _$ApiEntityFieldFromJson(Map<String, dynamic> json) =>
    ApiEntityField(
      confidence: (json['confidence'] as num).toDouble(),
      value: json['value'] as String,
    );

Map<String, dynamic> _$ApiEntityFieldToJson(ApiEntityField instance) =>
    <String, dynamic>{
      'confidence': instance.confidence,
      'value': instance.value,
    };
