import 'dart:io';

import 'package:injectable/injectable.dart';
import 'package:stargaze_kyc_sdk/src/domain/model/document/document_check.dart';
import 'package:stargaze_kyc_sdk/src/domain/model/document/document_code.dart';
import 'package:stargaze_kyc_sdk/src/domain/model/document/document_info.dart';
import 'package:stargaze_kyc_sdk/src/domain/repository/api/api_verification_repository.dart';
import 'package:stargaze_kyc_sdk/src/presentation/injection/configure_dependencies.dart';

@LazySingleton()
class GetDocumentInfoUseCase {
  final _apiVerificationRepository = getIt<ApiVerificationRepository>();

  Future<DocumentInfo> execute(
    File? documentFile,
    String? documentUrl,
    DocumentCode documentCode,
  ) async {
    assert(documentFile == null && documentUrl == null);

    final List<DocumentCheck> checks = [
      DocumentCheck.visualFields,
      DocumentCheck.mrzFields,
      DocumentCheck.mrzStrings,
      DocumentCheck.fake,
      DocumentCheck.location,
      DocumentCheck.brightness,
      DocumentCheck.content,
      DocumentCheck.faceLocation,
      DocumentCheck.faceContent,
    ];

    // Get document info
    final result = documentFile != null
        ? await _apiVerificationRepository.checkDocumentFile(file: documentFile, code: documentCode, checks: checks, page: 1)
        : await _apiVerificationRepository.checkDocumentUrl(documentUrl: documentUrl!, code: documentCode, checks: checks, page: 1);

    // TODO: need to parse parameters

    return DocumentInfo();
  }
}
