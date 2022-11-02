// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'api_entity_location_document.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ApiEntityLocationDocument _$ApiEntityLocationDocumentFromJson(
        Map<String, dynamic> json) =>
    ApiEntityLocationDocument(
      topLeft: (json['top_left'] as List<dynamic>?)
              ?.map((e) => (e as num).toDouble())
              .toList() ??
          [0.0, 0.0],
      topRight: (json['top_right'] as List<dynamic>?)
              ?.map((e) => (e as num).toDouble())
              .toList() ??
          [0.0, 0.0],
      bottomLeft: (json['bottom_left'] as List<dynamic>?)
              ?.map((e) => (e as num).toDouble())
              .toList() ??
          [0.0, 0.0],
      bottomRight: (json['bottom_right'] as List<dynamic>?)
              ?.map((e) => (e as num).toDouble())
              .toList() ??
          [0.0, 0.0],
    );

Map<String, dynamic> _$ApiEntityLocationDocumentToJson(
        ApiEntityLocationDocument instance) =>
    <String, dynamic>{
      'top_left': instance.topLeft,
      'top_right': instance.topRight,
      'bottom_left': instance.bottomLeft,
      'bottom_right': instance.bottomRight,
    };
