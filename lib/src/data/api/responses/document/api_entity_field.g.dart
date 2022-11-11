// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'api_entity_field.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ApiEntityField _$ApiEntityFieldFromJson(Map<String, dynamic> json) =>
    ApiEntityField(
      field: json['field'] as String,
      confidence: (json['confidence'] as num).toDouble(),
      value: json['value'] as String,
      lang: json['lang'] as String?,
    );

Map<String, dynamic> _$ApiEntityFieldToJson(ApiEntityField instance) =>
    <String, dynamic>{
      'field': instance.field,
      'confidence': instance.confidence,
      'value': instance.value,
      'lang': instance.lang,
    };
