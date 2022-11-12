enum DocumentException implements Exception {
  ok(0, 'OK.'),
  marginSmall(103, 'Margins around the document are very small.'),
  marginBig(104, 'Margins around the document are very big.'),
  resolutionLow(105, 'Resolution lower than 600x600.'),
  resolutionHeight(106, 'Resolution bigger than 6528x6528.'),
  documentNotDetected(114, 'Cant detect document body.'),
  incorrectDocumentType(119, 'Incorrect document type or page.'),
  downloadFiled(120, 'Image download failed.');

  final int code;

  final String message;

  const DocumentException(this.code, this.message);
}
