import 'dart:io';

import 'package:flutter_test/flutter_test.dart';
import 'package:stargaze_kyc_sdk/src/domain/usecases/get_face_info_use_case.dart';
import 'package:stargaze_kyc_sdk/src/presentation/injection/configure_dependencies.dart';

void main() {
  group('GetFaceInfoUseCase', () {
    test('success from file 1', () async {
      final dir = Directory.current.path;
      final fileFace = File(dir + '/test/resources/ua_id_card_face_1.jpg');

      // test
      final underTest = getIt<GetFaceInfoUseCase>();
      final result = await underTest.execute(faceFile: fileFace);

      // check
      expect(result, isNot(null));
      expect(result.brightness, isNot(null));
      expect(result.rotationAngle, isNot(null));
      expect(result.location, isNot(null));
      expect(result.spoofing, isNot(null));
      expect(result.landmarks, isNot(null));
      expect(result.representation, isNot(null));
    });

    test('success from file 2', () async {
      final dir = Directory.current.path;
      final fileFace = File(dir + '/test/resources/ua_id_card_face_2.jpg');

      // test
      final underTest = getIt<GetFaceInfoUseCase>();
      final result = await underTest.execute(faceFile: fileFace);

      // check
      expect(result, isNot(null));
      expect(result.brightness, isNot(null));
      expect(result.rotationAngle, isNot(null));
      expect(result.location, isNot(null));
      expect(result.spoofing, isNot(null));
      expect(result.landmarks, isNot(null));
      expect(result.representation, isNot(null));
    });

    test('success from url', () async {
      final fileUrl = 'http://t2.gstatic.com/licensed-image?q=tbn:ANd9GcRJXwouP8aDm0ML-Dq5RhW6awmybgURFbuhEkhZ588EI6a_o7xkqTXm3ze5H-xmmrXo';

      // test
      final underTest = getIt<GetFaceInfoUseCase>();
      final result = await underTest.execute(faceUrl: fileUrl);

      // check
      expect(result, isNot(null));
      expect(result.brightness, isNot(null));
      expect(result.rotationAngle, isNot(null));
      expect(result.location, isNot(null));
      expect(result.spoofing, isNot(null));
      expect(result.landmarks, isNot(null));
      expect(result.representation, isNot(null));
    });
  });
}
