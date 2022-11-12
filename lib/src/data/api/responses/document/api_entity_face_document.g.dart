// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'api_entity_face_document.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ApiEntityFace _$ApiEntityFaceFromJson(Map<String, dynamic> json) =>
    ApiEntityFace(
      location: ApiEntityLocationFace.fromJson(
          json['location'] as Map<String, dynamic>),
      content: json['content'] as String?,
    );

Map<String, dynamic> _$ApiEntityFaceToJson(ApiEntityFace instance) =>
    <String, dynamic>{
      'location': instance.location,
      'content': instance.content,
    };
