import 'dart:math';

class DocumentInfo {
  final double? brightness;
  final String? content;
  final List<DocumentField>? fields;
  final DocumentLocation? location;
  final DocumentFace? face;

  DocumentInfo({
    required this.brightness,
    required this.content,
    required this.fields,
    required this.location,
    required this.face,
  });
}

class DocumentFace {
  final double top;

  final double bottom;

  final double left;

  final double right;

  final String? content;

  DocumentFace({
    required this.top,
    required this.bottom,
    required this.left,
    required this.right,
    required this.content,
  });
}

class DocumentLocation {
  final Point<double> topLeft;

  final Point<double> topRight;

  final Point<double> bottomLeft;

  final Point<double> bottomRight;

  DocumentLocation({
    required this.topLeft,
    required this.topRight,
    required this.bottomLeft,
    required this.bottomRight,
  });
}

class DocumentField {
  final String key;
  final String value;
  final double confidence;
  final DocumentFiledLanguage language;

  DocumentField({
    required this.key,
    required this.value,
    required this.confidence,
    required this.language,
  });
}

enum DocumentFiledLanguage {
  none,
  en,
  uk,
}
