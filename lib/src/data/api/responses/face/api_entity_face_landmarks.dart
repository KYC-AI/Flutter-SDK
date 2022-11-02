import 'package:json_annotation/json_annotation.dart';
import 'package:meta/meta.dart';
import 'package:stargaze_kyc_sdk/src/data/api/responses/api_entity_location_face.dart';
import 'package:stargaze_kyc_sdk/src/data/api/responses/face/api_entity_face_representation.dart';
import 'package:stargaze_kyc_sdk/src/data/api/responses/face/api_entity_face_spoofing.dart';

part 'api_entity_face_landmarks.g.dart';

@JsonSerializable()
@internal
class ApiEntityFaceLandmarks {
  @JsonKey(name: 'left_eye')
  final List<double>? leftEye;

  @JsonKey(name: 'right_eye')
  final List<double>? rightEye;

  @JsonKey(name: 'nose')
  final List<double>? nose;

  @JsonKey(name: 'left_mouth')
  final List<double>? leftMouth;

  @JsonKey(name: 'right_mouth')
  final List<double>? rightMouth;


  ApiEntityFaceLandmarks({
    required this.leftEye,
    required this.rightEye,
    required this.nose,
    required this.leftMouth,
    required this.rightMouth,
  });

  factory ApiEntityFaceLandmarks.fromJson(Map<String, dynamic> json) => _$ApiEntityFaceLandmarksFromJson(json);

  Map<String, dynamic> toJson() => _$ApiEntityFaceLandmarksToJson(this);
}
