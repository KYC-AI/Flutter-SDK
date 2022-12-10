import 'dart:io';

import 'package:flutter_test/flutter_test.dart';
import 'package:stargaze_kyc_sdk/src/domain/model/document/document_check.dart';
import 'package:stargaze_kyc_sdk/src/domain/model/document/document_type.dart';
import 'package:stargaze_kyc_sdk/src/domain/model/face/face_check.dart';
import 'package:stargaze_kyc_sdk/src/domain/repository/api/api_verification_repository.dart';
import 'package:stargaze_kyc_sdk/src/di/configure_dependencies.dart';

void main() {
  group('checkDocumentFile', () {
    test('success', () async {
      final dir = Directory.current.path;
      final file = File(dir + '/test/resources/ua_id_card_1_page_1.jpg');

      // test
      final underTest = getIt<ApiVerificationRepository>();
      final result = await underTest.checkDocumentFile(
        file: file,
        code: DocumentType.uaIdCard,
        checks: [
          DocumentCheck.visualFields,
          DocumentCheck.mrzFields,
          DocumentCheck.mrzStrings,
          DocumentCheck.fake,
          DocumentCheck.location,
          DocumentCheck.brightness,
          DocumentCheck.content,
          DocumentCheck.faceLocation,
          DocumentCheck.faceContent,
        ],
        page: 1,
      );

      // check
      expect(result, isNot(null));
    });
  });

  group('checkDocumentUrl', () {
    test('success', () async {
      final documentUrl = 'https://beztabu.net/uploads/1200x670_DIR/media_news/2017/11/1264c0bc14a61e045be7791df0272e85e68d8b9a.jpg';

      // test
      final underTest = getIt<ApiVerificationRepository>();
      final result = await underTest.checkDocumentUrl(
        documentUrl: documentUrl,
        code: DocumentType.uaIdCard,
        checks: [
          DocumentCheck.visualFields,
          DocumentCheck.mrzFields,
          DocumentCheck.mrzStrings,
          DocumentCheck.fake,
          DocumentCheck.location,
          DocumentCheck.brightness,
          DocumentCheck.content,
          DocumentCheck.faceLocation,
          DocumentCheck.faceContent,
        ],
        page: 1,
      );

      // check
      expect(result, isNot(null));
    });
  });

  group('checkFaceFile', () {
    test('success', () async {
      final dir = Directory.current.path;
      final file = File(dir + '/test/resources/ua_id_card_face_1.jpg');

      // test
      final underTest = getIt<ApiVerificationRepository>();
      final result = await underTest.checkFaceFile(
        file: file,
        checks: [
          FaceCheck.representation,
          FaceCheck.spoofing,
          FaceCheck.location,
          FaceCheck.landmarks,
          FaceCheck.rotationAngle,
          FaceCheck.brightness,
          FaceCheck.content,
        ],
      );

      // check
      expect(result, isNot(null));
    });
  });
}
