import 'dart:io';

import 'package:injectable/injectable.dart';
import 'package:meta/meta.dart';
import 'package:stargaze_kyc_sdk/src/domain/exception/face_exception.dart';
import 'package:stargaze_kyc_sdk/src/domain/exception/kyc_sdk_exception.dart';
import 'package:stargaze_kyc_sdk/src/domain/model/face/face_check.dart';
import 'package:stargaze_kyc_sdk/src/domain/model/face/face_info.dart';
import 'package:stargaze_kyc_sdk/src/domain/model/mapper/face_info_mapper.dart';
import 'package:stargaze_kyc_sdk/src/domain/repository/api/api_verification_repository.dart';
import 'package:stargaze_kyc_sdk/src/di/configure_dependencies.dart';

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

    final FaceException documentFaceStatus = FaceException.values.firstWhere((element) => element.code == result.status);
    if (FaceException.ok != documentFaceStatus) {
      throw documentFaceStatus;
    }
    if (result.face == null || result.face!.representation == null) {
      throw KycSdkException.unknown;
    }

    return _faceInfoMapper.map(value: result.face!);
  }
}
