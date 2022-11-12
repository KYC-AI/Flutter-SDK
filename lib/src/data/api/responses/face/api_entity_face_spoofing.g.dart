// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'api_entity_face_spoofing.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ApiEntityFaceSpoofing _$ApiEntityFaceSpoofingFromJson(
        Map<String, dynamic> json) =>
    ApiEntityFaceSpoofing(
      probability: (json['probability'] as num).toDouble(),
    );

Map<String, dynamic> _$ApiEntityFaceSpoofingToJson(
        ApiEntityFaceSpoofing instance) =>
    <String, dynamic>{
      'probability': instance.probability,
    };
