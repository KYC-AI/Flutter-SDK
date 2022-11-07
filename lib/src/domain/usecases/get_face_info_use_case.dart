import 'dart:io';

import 'package:injectable/injectable.dart';
import 'package:meta/meta.dart';
import 'package:stargaze_kyc_sdk/src/domain/model/face/face_check.dart';
import 'package:stargaze_kyc_sdk/src/domain/model/face/face_info.dart';
import 'package:stargaze_kyc_sdk/src/domain/model/mapper/face_info_mapper.dart';
import 'package:stargaze_kyc_sdk/src/domain/repository/api/api_verification_repository.dart';
import 'package:stargaze_kyc_sdk/src/presentation/injection/configure_dependencies.dart';

@LazySingleton()
@internal
class GetFaceInfoUseCase {
  final _apiVerificationRepository = getIt<ApiVerificationRepository>();
  final _faceInfoMapper = getIt<FaceInfoMapper>();

  Future<FaceInfo> execute({
    File? faceFile,
    String? faceUrl,
  }) async {
    assert(faceFile != null || faceUrl != null, 'faceFile or faceUrl should be not null');

    final List<FaceCheck> checks = [
      FaceCheck.location,
      FaceCheck.brightness,
      FaceCheck.content,
      FaceCheck.representation,
      FaceCheck.spoofing,
      FaceCheck.landmarks,
      FaceCheck.rotationAngle,
    ];

    // Get face info
    final result = faceFile != null
        ? await _apiVerificationRepository.checkFaceFile(file: faceFile, checks: checks)
        : await _apiVerificationRepository.checkFaceUrl(faceUrl: faceUrl!, checks: checks);

    return _faceInfoMapper.map(result.face!);
  }
}
