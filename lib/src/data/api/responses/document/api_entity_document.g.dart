// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'api_entity_document.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ApiEntityDocument _$ApiEntityDocumentFromJson(Map<String, dynamic> json) =>
    ApiEntityDocument(
      fake: json['fake'] as String?,
      brightness: (json['brightness'] as num?)?.toDouble(),
      content: json['content'] as String?,
      location: json['location'] == null
          ? null
          : ApiEntityLocationDocument.fromJson(
              json['location'] as Map<String, dynamic>),
      face: json['face'] == null
          ? null
          : ApiEntityFace.fromJson(json['face'] as Map<String, dynamic>),
      visualFields: json['visual_fields'] == null
          ? null
          : ApiEntityVisualFields.fromJson(
              json['visual_fields'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$ApiEntityDocumentToJson(ApiEntityDocument instance) =>
    <String, dynamic>{
      'fake': instance.fake,
      'brightness': instance.brightness,
      'content': instance.content,
      'location': instance.location,
      'face': instance.face,
      'visual_fields': instance.visualFields,
    };
