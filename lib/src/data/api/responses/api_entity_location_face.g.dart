// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'api_entity_location_face.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ApiEntityLocationFace _$ApiEntityLocationFaceFromJson(
        Map<String, dynamic> json) =>
    ApiEntityLocationFace(
      top: (json['top'] as num).toDouble(),
      bottom: (json['bottom'] as num).toDouble(),
      left: (json['left'] as num).toDouble(),
      right: (json['right'] as num).toDouble(),
    );

Map<String, dynamic> _$ApiEntityLocationFaceToJson(
        ApiEntityLocationFace instance) =>
    <String, dynamic>{
      'top': instance.top,
      'bottom': instance.bottom,
      'left': instance.left,
      'right': instance.right,
    };
