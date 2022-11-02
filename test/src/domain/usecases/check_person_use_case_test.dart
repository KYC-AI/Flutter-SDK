import 'dart:io';

import 'package:flutter_test/flutter_test.dart';
import 'package:stargaze_kyc_sdk/src/domain/model/document/document_code.dart';
import 'package:stargaze_kyc_sdk/src/domain/usecases/check_person_use_case.dart';
import 'package:stargaze_kyc_sdk/src/presentation/injection/configure_dependencies.dart';

void main() {
  group('CheckPersonUseCase', () {
    test('success', () async {
      final dir = Directory.current.path;
      final fileDocument = File(dir + '/test/resources/ua_id_card_1.jpg');
      final fileFace = File(dir + '/test/resources/ua_id_card_face_1.jpg');

      // test
      final underTest = getIt<CheckPersonUseCase>();
      final result = await underTest.execute(documentCode: DocumentCode.uaIdCard, documentFile: fileDocument, faceFile: fileFace);

      // check
      expect(result, equals(true));
    });
  });
}
