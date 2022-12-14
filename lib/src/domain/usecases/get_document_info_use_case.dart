import 'dart:io';

import 'package:injectable/injectable.dart';
import 'package:meta/meta.dart';
import 'package:stargaze_kyc_sdk/src/domain/exception/document_exception.dart';
import 'package:stargaze_kyc_sdk/src/domain/exception/kyc_sdk_exception.dart';
import 'package:stargaze_kyc_sdk/src/domain/model/document/document_check.dart';
import 'package:stargaze_kyc_sdk/src/domain/model/document/document_type.dart';
import 'package:stargaze_kyc_sdk/src/domain/model/document/document_info.dart';
import 'package:stargaze_kyc_sdk/src/domain/model/mapper/document_info_mapper.dart';
import 'package:stargaze_kyc_sdk/src/domain/repository/api/api_verification_repository.dart';
import 'package:stargaze_kyc_sdk/src/di/configure_dependencies.dart';

@LazySingleton()
@internal
class GetDocumentInfoUseCase {
  final _apiVerificationRepository = getIt<ApiVerificationRepository>();
  final _documentInfoMapper = getIt<DocumentInfoMapper>();

  Future<DocumentInfo> execute({
    required DocumentType documentCode,
    required int page,
    File? documentFile,
    String? documentUrl,
  }) async {
    assert(documentFile != null || documentUrl != null, 'documentFile or documentUrl should be not null');

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
        ? await _apiVerificationRepository.checkDocumentFile(file: documentFile, code: documentCode, checks: checks, page: page)
        : await _apiVerificationRepository.checkDocumentUrl(documentUrl: documentUrl!, code: documentCode, checks: checks, page: page);

    final DocumentException documentStatus = DocumentException.values.firstWhere((element) => element.code == result.status);
    if (DocumentException.ok != documentStatus) {
      throw documentStatus;
    }
    if (result.document == null) {
      throw KycSdkException.unknown;
    }

    return _documentInfoMapper.map(value: result.document!, type: documentCode);
  }
}
