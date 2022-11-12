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
      visualFields: (json['visual_fields'] as List<dynamic>?)
          ?.map((e) => ApiEntityField.fromJson(e as Map<String, dynamic>))
          .toList(),
      mrzFields: (json['mrz_fields'] as List<dynamic>?)
          ?.map((e) => ApiEntityField.fromJson(e as Map<String, dynamic>))
          .toList(),
      mrzStrings: (json['mrz_strings'] as List<dynamic>?)
          ?.map((e) => ApiEntityString.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$ApiEntityDocumentToJson(ApiEntityDocument instance) =>
    <String, dynamic>{
      'fake': instance.fake,
      'brightness': instance.brightness,
      'content': instance.content,
      'location': instance.location,
      'face': instance.face,
      'visual_fields': instance.visualFields,
      'mrz_fields': instance.mrzFields,
      'mrz_strings': instance.mrzStrings,
    };
