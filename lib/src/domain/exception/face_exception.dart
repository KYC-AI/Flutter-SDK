enum FaceException implements Exception {
  ok(0, 'OK.'),
  resolutionLow(105, 'Resolution lower than 240x240.'),
  resolutionHeight(106, 'Resolution bigger than 6528x6528.'),
  faceNotDetected(115, 'Face not detected.'),
  moreThanOneFace(118, 'More than one person.');

  final int code;

  final String message;

  const FaceException(this.code, this.message);
}
