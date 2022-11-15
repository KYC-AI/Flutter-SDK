import 'dart:io';

import 'package:injectable/injectable.dart';
import 'package:meta/meta.dart';
import 'package:ml_linalg/linalg.dart';
import 'package:stargaze_kyc_sdk/src/domain/exception/face_exception.dart';
import 'package:stargaze_kyc_sdk/src/domain/exception/kyc_sdk_exception.dart';
import 'package:stargaze_kyc_sdk/src/domain/model/document/document_info.dart';
import 'package:stargaze_kyc_sdk/src/domain/model/face/face_check.dart';
import 'package:stargaze_kyc_sdk/src/domain/repository/api/api_verification_repository.dart';
import 'package:stargaze_kyc_sdk/src/di/configure_dependencies.dart';

@LazySingleton()
@internal
class CheckPersonFromDocumentUseCase {
  final _apiVerificationRepository = getIt<ApiVerificationRepository>();

  Future<bool> execute({
    required DocumentInfo documentInfo,
    File? faceFile,
    String? faceUrl,
  }) async {
    assert(faceFile != null || faceUrl != null, 'faceFile or faceUrl should be not null');

    final List<FaceCheck> faceChecks = [
      FaceCheck.representation,
    ];

    // 1. Get face from document
    final faceFromDocument = documentInfo.face!.contentBase64!;

    // 2. Check face from document
    final documentFaceResult = await _apiVerificationRepository.checkFaceBase64(base64: faceFromDocument, checks: faceChecks);
    final FaceException documentFaceStatus = FaceException.values.firstWhere((element) => element.code == documentFaceResult.status);
    if (FaceException.ok != documentFaceStatus) {
      throw documentFaceStatus;
    }
    if (documentFaceResult.face == null || documentFaceResult.face!.representation == null) {
      throw KycSdkException.unknown;
    }

    // 3. Check face from photo
    final faceResult = faceFile != null
        ? await _apiVerificationRepository.checkFaceFile(file: faceFile, checks: faceChecks)
        : await _apiVerificationRepository.checkFaceUrl(faceUrl: faceUrl!, checks: faceChecks);
    final FaceException faceStatus = FaceException.values.firstWhere((element) => element.code == faceResult.status);
    if (FaceException.ok != faceStatus) {
      throw faceStatus;
    }
    if (faceResult.face == null || faceResult.face!.representation == null) {
      throw KycSdkException.unknown;
    }

    // 4. Compare result from 4 and 5 points
    final distance = _getCosineDistance(documentFaceResult.face!.representation!.vector, faceResult.face!.representation!.vector);

    return distance <= documentFaceResult.face!.representation!.recommendedThreshold;
  }

  double _getCosineDistance(List<double> firstVector, List<double> secondVector) {
    final vector1 = Vector.fromList(firstVector);
    final vector2 = Vector.fromList(secondVector);
    return 1 - vector1.dot(vector2) / (vector1.norm() * vector2.norm());
  }
}
