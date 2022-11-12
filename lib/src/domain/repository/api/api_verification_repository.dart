import 'dart:io';

import 'package:meta/meta.dart';
import 'package:stargaze_kyc_sdk/src/data/api/responses/document/api_entity_check_document.dart';
import 'package:stargaze_kyc_sdk/src/data/api/responses/face/api_entity_check_face.dart';
import 'package:stargaze_kyc_sdk/src/domain/model/document/document_check.dart';
import 'package:stargaze_kyc_sdk/src/domain/model/document/document_code.dart';
import 'package:stargaze_kyc_sdk/src/domain/model/face/face_check.dart';

@internal
abstract class ApiVerificationRepository {
  Future<ApiEntityCheckDocument> checkDocumentFile({
    required File file,
    required DocumentCode code,
    required List<DocumentCheck> checks,
    required int page,
  });

  Future<ApiEntityCheckDocument> checkDocumentUrl({
    required String documentUrl,
    required DocumentCode code,
    required List<DocumentCheck> checks,
    required int page,
  });

  Future<ApiEntityCheckFace> checkFaceBase64({
    required String base64,
    required List<FaceCheck> checks,
  });

  Future<ApiEntityCheckFace> checkFaceFile({
    required File file,
    required List<FaceCheck> checks,
  });

  Future<ApiEntityCheckFace> checkFaceUrl({
    required String faceUrl,
    required List<FaceCheck> checks,
  });
}
