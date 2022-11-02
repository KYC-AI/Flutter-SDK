import 'dart:io';

import 'package:injectable/injectable.dart';
import 'package:scidart/numdart.dart';
import 'package:stargaze_kyc_sdk/src/domain/exception/document_exception.dart';
import 'package:stargaze_kyc_sdk/src/domain/exception/face_exception.dart';
import 'package:stargaze_kyc_sdk/src/domain/exception/kyc_sdk_exception.dart';
import 'package:stargaze_kyc_sdk/src/domain/model/document/document_check.dart';
import 'package:stargaze_kyc_sdk/src/domain/model/document/document_code.dart';
import 'package:stargaze_kyc_sdk/src/domain/model/face/face_check.dart';
import 'package:stargaze_kyc_sdk/src/domain/repository/api/api_verification_repository.dart';
import 'package:stargaze_kyc_sdk/src/presentation/injection/configure_dependencies.dart';

@LazySingleton()
class CheckPersonUseCase {
  final _apiVerificationRepository = getIt<ApiVerificationRepository>();

  Future<bool> execute({
    required DocumentCode documentCode,
    File? documentFile,
    String? documentUrl,
    File? faceFile,
    String? faceUrl,
  }) async {
    assert(documentFile != null || documentUrl != null);
    assert(faceFile != null || faceUrl != null);

    final List<DocumentCheck> documentChecks = [
      DocumentCheck.faceLocation,
      DocumentCheck.faceContent,
    ];

    final List<FaceCheck> faceChecks = [
      FaceCheck.representation,
    ];

    // 1. Check document photo
    final documentResult = documentFile != null
        ? await _apiVerificationRepository.checkDocumentFile(file: documentFile, code: documentCode, checks: documentChecks, page: 1)
        : await _apiVerificationRepository.checkDocumentUrl(documentUrl: documentUrl!, code: documentCode, checks: documentChecks, page: 1);
    final DocumentException documentStatus = DocumentException.values.firstWhere((element) => element.code == documentResult.status);
    if (DocumentException.ok != documentStatus) {
      throw documentStatus;
    }
    if (documentResult.document == null || documentResult.document!.face == null || documentResult.document!.face!.content == null) {
      throw KycSdkException.unknown;
    }

    // 2. Get face from document
    final faceFromDocument = documentResult.document!.face!.content!;

    // 3. Check face from document
    final documentFaceResult = await _apiVerificationRepository.checkFaceBase64(base64: faceFromDocument, checks: faceChecks);
    final FaceException documentFaceStatus = FaceException.values.firstWhere((element) => element.code == documentFaceResult.status);
    if (FaceException.ok != documentFaceStatus) {
      throw documentFaceStatus;
    }
    if (documentFaceResult.face == null || documentFaceResult.face!.representation == null) {
      throw KycSdkException.unknown;
    }

    // 4. Check face from photo
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

    // 5. Compare result from 4 and 5 points
    final distance = _getCosineDistance(documentFaceResult.face!.representation!.vector, faceResult.face!.representation!.vector);

    // TODO: need to compare [distance] with some value
    return false;
  }

  double _getCosineDistance(List<double> firstVector, List<double> secondVector) {
    final Array2d first = Array2d.fromVector(Array(firstVector), 1);
    final Array2d second = Array2d.fromVector(Array(secondVector), 1);
    final Array2d dot = matrixDot(first, second);

    // TODO: need to implements

    return 1;
  }
}
