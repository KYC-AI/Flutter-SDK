enum DocumentCheck {
  visualFields(value: 'visual_fields'),
  mrzFields(value: 'mrz_fields'),
  mrzStrings(value: 'mrz_strings'),
  fake(value: 'fake'),
  location(value: 'location'),
  brightness(value: 'brightness'),
  content(value: 'content'),
  faceLocation(value: 'location'),
  faceContent(value: 'content');

  final String value;

  const DocumentCheck({
    required this.value,
  });
}
