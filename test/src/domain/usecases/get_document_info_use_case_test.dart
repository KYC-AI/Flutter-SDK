import 'dart:io';

import 'package:flutter_test/flutter_test.dart';
import 'package:stargaze_kyc_sdk/src/domain/model/document/document_code.dart';
import 'package:stargaze_kyc_sdk/src/domain/usecases/get_document_info_use_case.dart';
import 'package:stargaze_kyc_sdk/src/presentation/injection/configure_dependencies.dart';

void main() {
  group('GetDocumentInfoUseCase', () {
    test('success from file', () async {
      final dir = Directory.current.path;
      final fileDocument = File(dir + '/test/resources/ua_id_card_1.jpg');

      // test
      final underTest = getIt<GetDocumentInfoUseCase>();
      final result = await underTest.execute(documentCode: DocumentCode.uaIdCard, documentFile: fileDocument);

      // check
      expect(result, isNot(null));
      expect(result.brightness, isNot(null));
      expect(result.content, isNot(null));
      expect(result.fields, isNot(null));
      expect(result.fields!.length, equals(10));
      expect(result.location, isNot(null));
      expect(result.face, isNot(null));
    });

    test('success from file', () async {
      final dir = Directory.current.path;
      final fileDocument = File(dir + '/test/resources/ua_id_card_2.jpg');

      // test
      final underTest = getIt<GetDocumentInfoUseCase>();
      final result = await underTest.execute(documentCode: DocumentCode.uaIdCard, documentFile: fileDocument);

      // check
      expect(result, isNot(null));
      expect(result.brightness, isNot(null));
      expect(result.content, isNot(null));
      expect(result.fields, isNot(null));
      expect(result.fields!.length, equals(10));
      expect(result.location, isNot(null));
      expect(result.face, isNot(null));
    });

    test('success from url', () async {
      final urlDocument = 'https://beztabu.net/uploads/1200x670_DIR/media_news/2017/11/1264c0bc14a61e045be7791df0272e85e68d8b9a.jpg';

      // test
      final underTest = getIt<GetDocumentInfoUseCase>();
      final result = await underTest.execute(documentCode: DocumentCode.uaIdCard, documentUrl: urlDocument);

      // check
      expect(result, isNot(null));
      expect(result.brightness, isNot(null));
      expect(result.content, isNot(null));
      expect(result.fields, isNot(null));
      expect(result.fields!.length, equals(10));
      expect(result.location, isNot(null));
      expect(result.face, isNot(null));
    });
  });
}
