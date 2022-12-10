import 'dart:async';
import 'dart:io';

import 'package:flutter/foundation.dart';
import 'package:get_it/get_it.dart';
import 'package:injectable/injectable.dart';
import 'package:stargaze_kyc_sdk/src/domain/model/config.dart';
import 'package:stargaze_kyc_sdk/src/domain/model/document/document_type.dart';
import 'package:stargaze_kyc_sdk/src/domain/model/document/document_info.dart';
import 'package:stargaze_kyc_sdk/src/domain/model/face/face_info.dart';
import 'package:stargaze_kyc_sdk/src/domain/repository/general/configure_repository.dart';
import 'package:stargaze_kyc_sdk/src/domain/usecases/check_person_from_document_use_case.dart';
import 'package:stargaze_kyc_sdk/src/domain/usecases/check_person_use_case.dart';
import 'package:stargaze_kyc_sdk/src/domain/usecases/get_document_info_use_case.dart';
import 'package:stargaze_kyc_sdk/src/domain/usecases/get_face_info_use_case.dart';
import 'package:stargaze_kyc_sdk/src/di/configure_dependencies.dart';

/// KYC SKD
/// To initialize sdk need define [Config], create instance KycSdk and call [initialize()]
/// Initialization might look like this
///
/// ```dart
/// import 'package:stargaze_kyc_sdk/stargaze_kyc_sdk.dart' as kyc_sdk;
///
/// ....
///
/// final config = kyc_sdk.Config(apiToken: Constants.apiToken, server: Constants.server);
/// final kycSdk = kyc_sdk.KycSdk(config: config);
/// await kycSdk.initialize()
///
/// .....
///
/// ```
class KycSdk {
  static const tag = 'KycSdk';

  static bool _getItInitialized = false;

  KycSdk({required this.config});

  final Config config;

  late final _checkPersonUseCase;
  late final _getDocumentInfoUseCase;
  late final _getFaceInfoUseCase;
  late final _checkPersonFromDocumentUseCase;

  /// Intended to initialize sdk and should be call before usage any methods of sdk.
  Future<void> initialize() async {
    try {
      if (!_getItInitialized) {
        if (kReleaseMode) {
          await configureDependencies(Environment.prod);
        } else {
          await configureDependencies(Environment.dev);
        }
        _getItInitialized = true;
      }
    } catch (e) {
      // no need to log
    }

    await GetIt.instance.allReady();

    final configureRepository = getIt<ConfigureRepository>();
    configureRepository.initialize(config: config);

    _checkPersonUseCase = getIt<CheckPersonUseCase>();
    _getDocumentInfoUseCase = getIt<GetDocumentInfoUseCase>();
    _getFaceInfoUseCase = getIt<GetFaceInfoUseCase>();
    _checkPersonFromDocumentUseCase = getIt<CheckPersonFromDocumentUseCase>();

    return Future.value();
  }

  /// Method intended to check whether face matches with face on document.
  ///
  /// [documentType] - type of document
  /// [documentFile] - image file that contains document
  /// [documentUrl] - url to document image
  /// [faceFile] - image file that contains document
  /// [faceUrl] - url to face image
  ///
  /// Method requires passing one resource with document ([documentCode] or [documentFile])
  /// and one with photo ([faceFile] or [faceUrl])
  ///
  /// Result return [bool] value that mean whether match face with face on document. true - if YES, false for NO
  ///
  Future<bool> checkPerson({
    required DocumentType documentType,
    File? documentFile,
    String? documentUrl,
    File? faceFile,
    String? faceUrl,
  }) {
    return _checkPersonUseCase.execute(
      documentType: documentType,
      documentFile: documentFile,
      documentUrl: documentUrl,
      faceFile: faceFile,
      faceUrl: faceUrl,
    );
  }

  /// Method intended to check whether face matches with face on document.
  ///
  /// [documentInfo] - document info that was got using method [getDocumentInfo]
  /// [faceFile] - image file that contains document
  /// [faceUrl] - url to face image
  ///
  /// Method requires passing one resource with photo ([faceFile] or [faceUrl])
  ///
  /// Result return [bool] value that mean whether match face with face on document. true - if YES, false for NO
  ///
  Future<bool> checkPersonFromDocument({
    required DocumentInfo documentInfo,
    File? faceFile,
    String? faceUrl,
  }) {
    return _checkPersonFromDocumentUseCase.execute(
      documentInfo: documentInfo,
      faceFile: faceFile,
      faceUrl: faceUrl,
    );
  }

  /// Method intended to parse info about face from photo
  ///
  /// [faceFile] - image file that contains document
  /// [faceUrl] - url to face image
  ///
  /// Method requires passing one resource with photo ([faceFile] or [faceUrl])
  ///
  /// Result return instance of [FaceInfo] that contains details about face
  ///
  Future<FaceInfo> getFaceInfo({
    File? faceFile,
    String? faceUrl,
  }) {
    return _getFaceInfoUseCase.execute(faceFile: faceFile, faceUrl: faceUrl);
  }

  /// Method intended to parse info about document from photo
  ///
  /// [documentType] - type of document
  /// [documentFile] - image file that contains document
  /// [documentUrl] - url to document image
  ///
  /// Method requires passing one resource with document ([documentCode] or [documentFile])
  ///
  /// Result return instance of [DocumentInfo] that contains details about document
  ///
  Future<DocumentInfo> getDocumentInfo({
    required DocumentType documentCode,
    required int page,
    File? documentFile,
    String? documentUrl,
  }) {
    return _getDocumentInfoUseCase.execute(documentCode: documentCode, page: page, documentFile: documentFile, documentUrl: documentUrl);
  }
}
