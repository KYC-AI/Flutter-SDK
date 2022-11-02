// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'api_entity_face.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ApiEntityFace _$ApiEntityFaceFromJson(Map<String, dynamic> json) =>
    ApiEntityFace(
      location: json['location'] == null
          ? null
          : ApiEntityLocationFace.fromJson(
              json['location'] as Map<String, dynamic>),
      brightness: (json['brightness'] as num?)?.toDouble(),
      rotationAngle: (json['rotation_angle'] as num?)?.toDouble(),
      representation: json['representation'] == null
          ? null
          : ApiEntityFaceRepresentation.fromJson(
              json['representation'] as Map<String, dynamic>),
      spoofing: json['spoofing'] == null
          ? null
          : ApiEntityFaceSpoofing.fromJson(
              json['spoofing'] as Map<String, dynamic>),
      landmarks: json['landmarks'] == null
          ? null
          : ApiEntityFaceLandmarks.fromJson(
              json['landmarks'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$ApiEntityFaceToJson(ApiEntityFace instance) =>
    <String, dynamic>{
      'location': instance.location,
      'brightness': instance.brightness,
      'rotation_angle': instance.rotationAngle,
      'representation': instance.representation,
      'spoofing': instance.spoofing,
      'landmarks': instance.landmarks,
    };
