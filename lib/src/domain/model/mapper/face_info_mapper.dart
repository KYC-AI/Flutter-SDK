import 'dart:convert';

import 'package:flutter/widgets.dart';
import 'package:injectable/injectable.dart';
import 'package:meta/meta.dart';
import 'package:stargaze_kyc_sdk/src/data/api/responses/face/api_entity_face.dart';
import 'package:stargaze_kyc_sdk/src/domain/model/face/face_info.dart';
import 'package:stargaze_kyc_sdk/src/domain/model/mapper/base/mapper.dart';

@LazySingleton()
@internal
class FaceInfoMapper extends Mapper<ApiEntityFace, FaceInfo> {
  final _base64Decoder = Base64Decoder();

  @override
  FaceInfo map(ApiEntityFace value) {
    FaceLocations? location;
    FaceSpoofing? spoofing;
    FaceLandmarks? landmarks;
    FaceRepresentation? representation;

    if (value.location != null) {
      location = FaceLocations(
        top: value.location!.top,
        bottom: value.location!.bottom,
        left: value.location!.left,
        right: value.location!.right,
      );
    }

    if (value.spoofing != null) {
      spoofing = FaceSpoofing(probability: value.spoofing!.probability);
    }

    if (value.landmarks != null) {
      landmarks = FaceLandmarks(
        leftEye: value.landmarks!.leftEye,
        rightEye: value.landmarks!.rightEye,
        nose: value.landmarks!.nose,
        leftMouth: value.landmarks!.leftMouth,
        rightMouth: value.landmarks!.rightMouth,
      );
    }

    if (value.representation != null) {
      representation = FaceRepresentation(
        version: value.representation!.version,
        recommendedThreshold: value.representation!.recommendedThreshold,
        vector: value.representation!.vector,
      );
    }

    return FaceInfo(
      brightness: value.brightness,
      rotationAngle: value.rotationAngle,
      location: location,
      spoofing: spoofing,
      landmarks: landmarks,
      representation: representation,
      content: value.content != null ? Image.memory(_base64Decoder.convert(value.content!)) : null,
    );
  }
}
