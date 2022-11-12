enum FaceCheck {
  representation(value: 'representation'),
  spoofing(value: 'spoofing'),
  location(value: 'location'),
  landmarks(value: 'landmarks'),
  rotationAngle(value: 'rotation_angle'),
  brightness(value: 'brightness'),
  content(value: 'content');

  final String value;

  const FaceCheck({
    required this.value,
  });
}
