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
      fields = [];

      if (value.visualFields!.gender != null) {
        fields.add(DocumentField(
          key: 'gender',
          value: value.visualFields!.gender!.value,
          confidence: value.visualFields!.gender!.confidence,
          language: DocumentFiledLanguage.none,
        ));
      }

      if (value.visualFields!.expirationDate != null) {
        fields.add(DocumentField(
          key: 'expirationDate',
          value: value.visualFields!.expirationDate!.value,
          confidence: value.visualFields!.expirationDate!.confidence,
          language: DocumentFiledLanguage.none,
        ));
      }

      if (value.visualFields!.dob != null) {
        fields.add(DocumentField(
          key: 'dob',
          value: value.visualFields!.dob!.value,
          confidence: value.visualFields!.dob!.confidence,
          language: DocumentFiledLanguage.none,
        ));
      }

      if (value.visualFields!.recordNumber != null) {
        fields.add(DocumentField(
          key: 'recordNumber',
          value: value.visualFields!.recordNumber!.value,
          confidence: value.visualFields!.recordNumber!.confidence,
          language: DocumentFiledLanguage.none,
        ));
      }

      if (value.visualFields!.documentNumber != null) {
        fields.add(DocumentField(
          key: 'documentNumber',
          value: value.visualFields!.documentNumber!.value,
          confidence: value.visualFields!.documentNumber!.confidence,
          language: DocumentFiledLanguage.none,
        ));
      }

      if (value.visualFields!.middleNameUk != null) {
        fields.add(DocumentField(
          key: 'middleNameUk',
          value: value.visualFields!.middleNameUk!.value,
          confidence: value.visualFields!.middleNameUk!.confidence,
          language: DocumentFiledLanguage.uk,
        ));
      }

      if (value.visualFields!.lastNameEn != null) {
        fields.add(DocumentField(
          key: 'lastNameEn',
          value: value.visualFields!.lastNameEn!.value,
          confidence: value.visualFields!.lastNameEn!.confidence,
          language: DocumentFiledLanguage.en,
        ));
      }

      if (value.visualFields!.lastNameUk != null) {
        fields.add(DocumentField(
          key: 'lastNameUk',
          value: value.visualFields!.lastNameUk!.value,
          confidence: value.visualFields!.lastNameUk!.confidence,
          language: DocumentFiledLanguage.uk,
        ));
      }

      if (value.visualFields!.firstNameEn != null) {
        fields.add(DocumentField(
          key: 'firstNameEn',
          value: value.visualFields!.firstNameEn!.value,
          confidence: value.visualFields!.firstNameEn!.confidence,
          language: DocumentFiledLanguage.en,
        ));
      }

      if (value.visualFields!.firstNameUk != null) {
        fields.add(DocumentField(
          key: 'firstNameUk',
          value: value.visualFields!.firstNameUk!.value,
          confidence: value.visualFields!.firstNameUk!.confidence,
          language: DocumentFiledLanguage.uk,
        ));
      }
    }

    return DocumentInfo(
      brightness: value.brightness,
      content: value.content != null ? Image.memory(_base64Decoder.convert(value.content!)) : null,
      fields: fields,
      location: location,
      face: face,
    );
  }
}
