import 'dart:io';

import 'package:flutter_test/flutter_test.dart';
import 'package:stargaze_kyc_sdk/src/domain/model/document/document_code.dart';
import 'package:stargaze_kyc_sdk/src/domain/usecases/get_document_info_use_case.dart';
import 'package:stargaze_kyc_sdk/src/di/configure_dependencies.dart';

void main() {
  group('usaPassportCard', () {
    test('success from file page 1', () async {
      final dir = Directory.current.path;
      final fileDocument = File(dir + '/test/resources/usa_passport_card_1_page_1.jpg');

      // test
      final underTest = getIt<GetDocumentInfoUseCase>();
      final result = await underTest.execute(documentCode: DocumentCode.usaPassportCard, page: 1, documentFile: fileDocument);

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

  group('uaForeignPassport', () {
    test('success from file', () async {
      final dir = Directory.current.path;
      final fileDocument = File(dir + '/test/resources/ua_foreign_passport_1.jpg');

      // test
      final underTest = getIt<GetDocumentInfoUseCase>();
      final result = await underTest.execute(documentCode: DocumentCode.uaForeignPassport, page: 1, documentFile: fileDocument);

      // check
      expect(result, isNot(null));
      expect(result.brightness, isNot(null));
      expect(result.content, isNot(null));
      expect(result.fields, isNot(null));
      expect(result.fields!.length, equals(13));
      expect(result.mrzFields, isNot(null));
      expect(result.mrzFields!.length, equals(15));
      expect(result.mrzStrings, isNot(null));
      expect(result.mrzStrings!.length, equals(2));
      expect(result.location, isNot(null));
      expect(result.face, isNot(null));
    });
  });

  group('uaIdCard', () {
    group('GetDocumentInfoUseCase page 1', () {
      test('success from file', () async {
        final dir = Directory.current.path;
        final fileDocument = File(dir + '/test/resources/ua_id_card_1_page_1.jpg');

        // test
        final underTest = getIt<GetDocumentInfoUseCase>();
        final result = await underTest.execute(documentCode: DocumentCode.uaIdCard, page: 1, documentFile: fileDocument);

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
        final fileDocument = File(dir + '/test/resources/ua_id_card_2_page_1.jpg');

        // test
        final underTest = getIt<GetDocumentInfoUseCase>();
        final result = await underTest.execute(documentCode: DocumentCode.uaIdCard, page: 1, documentFile: fileDocument);

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
        final result = await underTest.execute(documentCode: DocumentCode.uaIdCard, page: 1, documentUrl: urlDocument);

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

    group('GetDocumentInfoUseCase page 2', () {
      test('success from file', () async {
        final dir = Directory.current.path;
        final fileDocument = File(dir + '/test/resources/ua_id_card_3_page_2.jpg');

        // test
        final underTest = getIt<GetDocumentInfoUseCase>();
        final result = await underTest.execute(documentCode: DocumentCode.uaIdCard, page: 2, documentFile: fileDocument);

        // check
        expect(result, isNot(null));
        expect(result.brightness, isNot(null));
        expect(result.content, isNot(null));
        expect(result.fields, isNot(null));
        expect(result.fields!.length, equals(5));
        expect(result.location, isNot(null));
        expect(result.face, equals(null));
      });
    });
  });
}
