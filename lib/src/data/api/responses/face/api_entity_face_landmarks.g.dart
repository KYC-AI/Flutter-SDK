// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'api_entity_face_landmarks.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ApiEntityFaceLandmarks _$ApiEntityFaceLandmarksFromJson(
        Map<String, dynamic> json) =>
    ApiEntityFaceLandmarks(
      leftEye: (json['left_eye'] as List<dynamic>?)
          ?.map((e) => (e as num).toDouble())
          .toList(),
      rightEye: (json['right_eye'] as List<dynamic>?)
          ?.map((e) => (e as num).toDouble())
          .toList(),
      nose: (json['nose'] as List<dynamic>?)
          ?.map((e) => (e as num).toDouble())
          .toList(),
      leftMouth: (json['left_mouth'] as List<dynamic>?)
          ?.map((e) => (e as num).toDouble())
          .toList(),
      rightMouth: (json['right_mouth'] as List<dynamic>?)
          ?.map((e) => (e as num).toDouble())
          .toList(),
    );

Map<String, dynamic> _$ApiEntityFaceLandmarksToJson(
        ApiEntityFaceLandmarks instance) =>
    <String, dynamic>{
      'left_eye': instance.leftEye,
      'right_eye': instance.rightEye,
      'nose': instance.nose,
      'left_mouth': instance.leftMouth,
      'right_mouth': instance.rightMouth,
    };
