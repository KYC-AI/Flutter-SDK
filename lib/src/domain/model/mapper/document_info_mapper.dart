import 'dart:convert';
import 'dart:math';

import 'package:flutter/widgets.dart';
import 'package:injectable/injectable.dart';
import 'package:meta/meta.dart';
import 'package:stargaze_kyc_sdk/src/data/api/responses/document/api_entity_document.dart';
import 'package:stargaze_kyc_sdk/src/domain/model/document/document_info.dart';
import 'package:stargaze_kyc_sdk/src/domain/model/mapper/base/mapper.dart';

@LazySingleton()
@internal
class DocumentInfoMapper extends Mapper<ApiEntityDocument, DocumentInfo> {
  final _base64Decoder = Base64Decoder();

  @override
  DocumentInfo map(ApiEntityDocument value) {
    DocumentLocation? location;
    DocumentFace? face;
    List<DocumentField>? fields;

    if (value.location != null) {
      location = DocumentLocation(
        topLeft: Point(value.location!.topLeft[0], value.location!.topLeft[1]),
        topRight: Point(value.location!.topRight[0], value.location!.topRight[1]),
        bottomLeft: Point(value.location!.bottomLeft[0], value.location!.bottomLeft[1]),
        bottomRight: Point(value.location!.bottomRight[0], value.location!.bottomRight[1]),
      );
    }

    if (value.face != null) {
      face = DocumentFace(
        top: value.face!.location.top,
        bottom: value.face!.location.bottom,
        left: value.face!.location.left,
        right: value.face!.location.right,
        content: value.face!.content != null ? Image.memory(_base64Decoder.convert(value.face!.content!)) : null,
      );
    }

    if (value.visualFields != null) {
      fields = value.visualFields!
          .map((e) => DocumentField(
                key: e.field,
                value: e.value,
                confidence: e.confidence,
                language: _mapLanguage(e.lang),
              ))
          .toList();
    }

    return DocumentInfo(
      brightness: value.brightness,
      content: value.content != null ? Image.memory(_base64Decoder.convert(value.content!)) : null,
      fields: fields,
      location: location,
      face: face,
    );
  }

  DocumentFiledLanguage _mapLanguage(String? value) {
    if (value == 'en') {
      return DocumentFiledLanguage.en;
    }

    if (value == 'uk') {
      return DocumentFiledLanguage.uk;
    }

    return DocumentFiledLanguage.none;
  }
}
