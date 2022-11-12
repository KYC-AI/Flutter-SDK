import 'package:flutter/widgets.dart';

class FaceInfo {
  final double? brightness;

  final double? rotationAngle;

  final FaceLocations? location;

  final FaceSpoofing? spoofing;

  final FaceLandmarks? landmarks;

  final FaceRepresentation? representation;

  final Image? content;

  FaceInfo({
    required this.brightness,
    required this.rotationAngle,
    required this.location,
    required this.spoofing,
    required this.landmarks,
    required this.representation,
    required this.content,
  });
}

class FaceRepresentation {
  final int version;

  final double recommendedThreshold;

  final List<double> vector;

  FaceRepresentation({
    required this.version,
    required this.recommendedThreshold,
    required this.vector,
  });
}

class FaceLandmarks {
  final List<double>? leftEye;

  final List<double>? rightEye;

  final List<double>? nose;

  final List<double>? leftMouth;

  final List<double>? rightMouth;

  FaceLandmarks({
    required this.leftEye,
    required this.rightEye,
    required this.nose,
    required this.leftMouth,
    required this.rightMouth,
  });
}

class FaceSpoofing {
  final double probability;

  FaceSpoofing({
    required this.probability,
  });
}

class FaceLocations {
  final double top;

  final double bottom;

  final double left;

  final double right;

  FaceLocations({
    required this.top,
    required this.bottom,
    required this.left,
    required this.right,
  });
}
