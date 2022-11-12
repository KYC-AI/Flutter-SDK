// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'api_entity_check_face.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ApiEntityCheckFace _$ApiEntityCheckFaceFromJson(Map<String, dynamic> json) =>
    ApiEntityCheckFace(
      status: json['status'] as int? ?? 0,
      message: json['message'] as String? ?? '',
      requestId: json['request_id'] as String? ?? '',
      face: json['face'] == null
          ? null
          : ApiEntityFace.fromJson(json['face'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$ApiEntityCheckFaceToJson(ApiEntityCheckFace instance) =>
    <String, dynamic>{
      'status': instance.status,
      'message': instance.message,
      'request_id': instance.requestId,
      'face': instance.face,
    };
