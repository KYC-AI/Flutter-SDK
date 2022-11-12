import 'dart:math';

import 'package:flutter/widgets.dart';
import 'package:stargaze_kyc_sdk/src/domain/model/document/document_code.dart';

class DocumentInfo {
  final DocumentCode documentCode;
  final double? brightness;
  final Image? content;
  final List<DocumentField>? fields;
  final List<DocumentField>? mrzFields;
  final List<DocumentString>? mrzStrings;
  final DocumentLocation? location;
  final DocumentFace? face;


  DocumentInfo({
    required this.documentCode,
    required this.brightness,
    required this.content,
    required this.fields,
    required this.mrzFields,
    required this.mrzStrings,
    required this.location,
    required this.face,
  });
}

class DocumentFace {
  final double top;

  final double bottom;

  final double left;

  final double right;

  final Image? content;

  final String? contentBase64;

  DocumentFace({
    required this.top,
    required this.bottom,
    required this.left,
    required this.right,
    required this.content,
    required this.contentBase64,
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

class DocumentString {
  final String value;
  final double confidence;

  DocumentString({
    required this.value,
    required this.confidence,
  });
}

enum DocumentFiledLanguage {
  none,
  en,
  uk,
}
