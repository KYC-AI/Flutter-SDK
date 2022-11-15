import 'dart:async';
import 'dart:convert';
import 'dart:io';

import 'package:injectable/injectable.dart';
import 'package:meta/meta.dart';
import 'package:stargaze_kyc_sdk/src/data/api/base/base_api_repository.dart';
import 'package:stargaze_kyc_sdk/src/data/api/responses/document/api_entity_check_document.dart';
import 'package:stargaze_kyc_sdk/src/data/api/responses/face/api_entity_check_face.dart';
import 'package:stargaze_kyc_sdk/src/domain/model/document/document_check.dart';
import 'package:stargaze_kyc_sdk/src/domain/model/document/document_code.dart';
import 'package:stargaze_kyc_sdk/src/domain/model/face/face_check.dart';
import 'package:stargaze_kyc_sdk/src/domain/repository/api/api_verification_repository.dart';
import 'package:stargaze_kyc_sdk/src/general/log_helper.dart';

@LazySingleton(as: ApiVerificationRepository)
@internal
class ApiVerificationRepositoryImpl extends BaseApiRepository with LogHelper implements ApiVerificationRepository {
  static const tag = 'ApiVerificationRepositoryImpl';

  ApiVerificationRepositoryImpl(
    super.apiBaseRepository,
    super.configureRepository,
  );

  @override
  String getBasePath() {
    return '';
  }

  @override
  Future<ApiEntityCheckDocument> checkDocumentFile({
    required File file,
    required DocumentCode code,
    required List<DocumentCheck> checks,
    required int page,
  }) async {
    final String url = getApiUrl('documents');
    tLog.d(tag, 'checkDocumentFile, url: $url');

    final Map<String, dynamic> body = {
      'image': {
        'document_code': code.code,
        'page_num': page,
        'content': _imageToBase64(file),
      },
      'return': _prepareDocumentReturn(checks),
    };

    final response = await executeRequest(
      requestType: RequestType.post,
      url: url,
      body: json.encode(body),
    );

    if (await validateResponse(response) == true) {
      final decodedBody = utf8.decode(response.bodyBytes);
      return ApiEntityCheckDocument.fromJson(json.decode(decodedBody) as Map<String, dynamic>);
    } else {
      throw Exception('Exception from : ${runtimeType.toString()}');
    }
  }

  @override
  Future<ApiEntityCheckDocument> checkDocumentUrl({
    required String documentUrl,
    required DocumentCode code,
    required List<DocumentCheck> checks,
    required int page,
  }) async {
    final String url = getApiUrl('documents');
    tLog.d(tag, 'checkDocumentUrl, url: $url');

    final Map<String, dynamic> body = {
      'image': {
        'document_code': code.code,
        'page_num': page,
        'url': documentUrl,
      },
      'return': _prepareDocumentReturn(checks),
    };

    final response = await executeRequest(
      requestType: RequestType.post,
      url: url,
      body: json.encode(body),
    );

    if (await validateResponse(response) == true) {
      final decodedBody = utf8.decode(response.bodyBytes);
      return ApiEntityCheckDocument.fromJson(json.decode(decodedBody) as Map<String, dynamic>);
    } else {
      throw Exception('Exception from : ${runtimeType.toString()}');
    }
  }

  @override
  Future<ApiEntityCheckFace> checkFaceFile({
    required File file,
    required List<FaceCheck> checks,
  }) async {
    final String url = getApiUrl('faces');
    tLog.d(tag, 'checkFaceFile, url: $url');

    final Map<String, dynamic> body = {
      'image': {
        'content': _imageToBase64(file),
      },
      'return': _prepareFaceReturn(checks),
    };

    final response = await executeRequest(
      requestType: RequestType.post,
      url: url,
      body: json.encode(body),
    );

    if (await validateResponse(response) == true) {
      final decodedBody = utf8.decode(response.bodyBytes);
      return ApiEntityCheckFace.fromJson(json.decode(decodedBody) as Map<String, dynamic>);
    } else {
      throw Exception('Exception from : ${runtimeType.toString()}');
    }
  }

  @override
  Future<ApiEntityCheckFace> checkFaceUrl({
    required String faceUrl,
    required List<FaceCheck> checks,
  }) async {
    final String url = getApiUrl('faces');
    tLog.d(tag, 'checkFaceUrl, url: $url');

    final Map<String, dynamic> body = {
      'image': {
        'url': faceUrl,
      },
      'return': _prepareFaceReturn(checks),
    };

    final response = await executeRequest(
      requestType: RequestType.post,
      url: url,
      body: json.encode(body),
    );

    if (await validateResponse(response) == true) {
      final decodedBody = utf8.decode(response.bodyBytes);
      return ApiEntityCheckFace.fromJson(json.decode(decodedBody) as Map<String, dynamic>);
    } else {
      throw Exception('Exception from : ${runtimeType.toString()}');
    }
  }

  @override
  Future<ApiEntityCheckFace> checkFaceBase64({required String base64, required List<FaceCheck> checks}) async {
    final String url = getApiUrl('faces');
    tLog.d(tag, 'checkFaceBase64, url: $url');

    final Map<String, dynamic> body = {
      'image': {
        'content': base64,
      },
      'return': _prepareFaceReturn(checks),
    };

    final response = await executeRequest(
      requestType: RequestType.post,
      url: url,
      body: json.encode(body),
    );

    if (await validateResponse(response) == true) {
      final decodedBody = utf8.decode(response.bodyBytes);
      return ApiEntityCheckFace.fromJson(json.decode(decodedBody) as Map<String, dynamic>);
    } else {
      throw Exception('Exception from : ${runtimeType.toString()}');
    }
  }

  dynamic _prepareDocumentReturn(List<DocumentCheck> documentChecks) {
    return {
      DocumentCheck.visualFields.value: documentChecks.contains(DocumentCheck.visualFields),
      DocumentCheck.mrzStrings.value: documentChecks.contains(DocumentCheck.mrzStrings),
      DocumentCheck.fake.value: documentChecks.contains(DocumentCheck.fake),
      DocumentCheck.location.value: documentChecks.contains(DocumentCheck.location),
      DocumentCheck.brightness.value: documentChecks.contains(DocumentCheck.brightness),
      DocumentCheck.content.value: documentChecks.contains(DocumentCheck.content),
      'face': {
        DocumentCheck.faceLocation.value: documentChecks.contains(DocumentCheck.faceLocation),
        DocumentCheck.faceContent.value: documentChecks.contains(DocumentCheck.faceContent),
      },
    };
  }

  dynamic _prepareFaceReturn(List<FaceCheck> faceChecks) {
    return {
      FaceCheck.representation.value: faceChecks.contains(FaceCheck.representation),
      FaceCheck.spoofing.value: faceChecks.contains(FaceCheck.spoofing),
      FaceCheck.location.value: faceChecks.contains(FaceCheck.location),
      FaceCheck.landmarks.value: faceChecks.contains(FaceCheck.landmarks),
      FaceCheck.rotationAngle.value: faceChecks.contains(FaceCheck.rotationAngle),
      FaceCheck.brightness.value: faceChecks.contains(FaceCheck.brightness),
      FaceCheck.content.value: faceChecks.contains(FaceCheck.content),
    };
  }

  String _imageToBase64(File file) {
    final bytes = file.readAsBytesSync();
    return base64Encode(bytes);
  }
}
