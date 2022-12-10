import 'dart:io';

import 'package:flutter_test/flutter_test.dart';
import 'package:stargaze_kyc_sdk/src/domain/model/document/document_type.dart';
import 'package:stargaze_kyc_sdk/src/domain/usecases/check_person_use_case.dart';
import 'package:stargaze_kyc_sdk/src/di/configure_dependencies.dart';

void main() {
  group('CheckPersonUseCase', () {
    test('success from files 1', () async {
      final dir = Directory.current.path;
      final fileDocument = File(dir + '/test/resources/ua_id_card_1_page_1.jpg');
      final fileFace = File(dir + '/test/resources/ua_id_card_face_1.jpg');

      // test
      final underTest = getIt<CheckPersonUseCase>();
      final result = await underTest.execute(documentType: DocumentType.uaIdCard, documentFile: fileDocument, faceFile: fileFace);

      // check
      expect(result, equals(true));
    });

    test('success from files 2', () async {
      final dir = Directory.current.path;
      final fileDocument = File(dir + '/test/resources/ua_id_card_2_page_1.jpg');
      final fileFace = File(dir + '/test/resources/ua_id_card_face_2.jpg');

      // test
      final underTest = getIt<CheckPersonUseCase>();
      final result = await underTest.execute(documentType: DocumentType.uaIdCard, documentFile: fileDocument, faceFile: fileFace);

      // check
      expect(result, equals(true));
    });

    test('error from urls', () async {
      final urlDocument = 'https://beztabu.net/uploads/1200x670_DIR/media_news/2017/11/1264c0bc14a61e045be7791df0272e85e68d8b9a.jpg';
      final urlFace = 'http://t2.gstatic.com/licensed-image?q=tbn:ANd9GcRJXwouP8aDm0ML-Dq5RhW6awmybgURFbuhEkhZ588EI6a_o7xkqTXm3ze5H-xmmrXo';

      // test
      final underTest = getIt<CheckPersonUseCase>();
      final result = await underTest.execute(documentType: DocumentType.uaIdCard, documentUrl: urlDocument, faceUrl: urlFace);

      // check
      expect(result, equals(false));
    });
  });
}
