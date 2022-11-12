// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'api_entity_face_representation.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ApiEntityFaceRepresentation _$ApiEntityFaceRepresentationFromJson(
        Map<String, dynamic> json) =>
    ApiEntityFaceRepresentation(
      version: json['version'] as int,
      recommendedThreshold: (json['recommended_threshold'] as num).toDouble(),
      vector: (json['vector'] as List<dynamic>)
          .map((e) => (e as num).toDouble())
          .toList(),
    );

Map<String, dynamic> _$ApiEntityFaceRepresentationToJson(
        ApiEntityFaceRepresentation instance) =>
    <String, dynamic>{
      'version': instance.version,
      'recommended_threshold': instance.recommendedThreshold,
      'vector': instance.vector,
    };
