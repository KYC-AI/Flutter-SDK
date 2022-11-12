import 'package:json_annotation/json_annotation.dart';
import 'package:meta/meta.dart';
import 'package:stargaze_kyc_sdk/src/data/api/responses/api_entity_location_face.dart';
import 'package:stargaze_kyc_sdk/src/data/api/responses/face/api_entity_face_landmarks.dart';
import 'package:stargaze_kyc_sdk/src/data/api/responses/face/api_entity_face_representation.dart';
import 'package:stargaze_kyc_sdk/src/data/api/responses/face/api_entity_face_spoofing.dart';

part 'api_entity_face.g.dart';

@JsonSerializable()
@internal
class ApiEntityFace {
  @JsonKey(name: 'location')
  final ApiEntityLocationFace? location;

  @JsonKey(name: 'brightness')
  final double? brightness;

  @JsonKey(name: 'rotation_angle')
  final double? rotationAngle;

  @JsonKey(name: 'representation')
  final ApiEntityFaceRepresentation? representation;

  @JsonKey(name: 'spoofing')
  final ApiEntityFaceSpoofing? spoofing;

  @JsonKey(name: 'landmarks')
  final ApiEntityFaceLandmarks? landmarks;

  @JsonKey(name: 'content')
  final String? content;

  ApiEntityFace({
    required this.location,
    required this.brightness,
    required this.rotationAngle,
    required this.representation,
    required this.spoofing,
    required this.landmarks,
    required this.content,
  });

  factory ApiEntityFace.fromJson(Map<String, dynamic> json) => _$ApiEntityFaceFromJson(json);

  Map<String, dynamic> toJson() => _$ApiEntityFaceToJson(this);
}
