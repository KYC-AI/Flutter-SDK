import 'dart:async';
import 'dart:io';

import 'package:flutter/foundation.dart';
import 'package:get_it/get_it.dart';
import 'package:injectable/injectable.dart';
import 'package:stargaze_kyc_sdk/src/domain/model/config.dart';
import 'package:stargaze_kyc_sdk/src/domain/model/document/document_code.dart';
import 'package:stargaze_kyc_sdk/src/domain/model/document/document_info.dart';
import 'package:stargaze_kyc_sdk/src/domain/model/face/face_info.dart';
import 'package:stargaze_kyc_sdk/src/domain/repository/general/configure_repository.dart';
import 'package:stargaze_kyc_sdk/src/domain/usecases/check_person_from_document_use_case.dart';
import 'package:stargaze_kyc_sdk/src/domain/usecases/check_person_use_case.dart';
import 'package:stargaze_kyc_sdk/src/domain/usecases/get_document_info_use_case.dart';
import 'package:stargaze_kyc_sdk/src/domain/usecases/get_face_info_use_case.dart';
import 'package:stargaze_kyc_sdk/src/presentation/injection/configure_dependencies.dart';

class KycSdk {
  static const tag = 'KycSdk';

  static bool _getItInitialized = false;

  KycSdk({required this.config});

  final Config config;

  late final _checkPersonUseCase;
  late final _getDocumentInfoUseCase;
  late final _getFaceInfoUseCase;
  late final _checkPersonFromDocumentUseCase;

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

  Future<bool> checkPerson({
    required DocumentCode documentCode,
    File? documentFile,
    String? documentUrl,
    File? faceFile,
    String? faceUrl,
  }) {
    return _checkPersonUseCase.execute(
      documentCode: documentCode,
      documentFile: documentFile,
      documentUrl: documentUrl,
      faceFile: faceFile,
      faceUrl: faceUrl,
    );
  }

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

  Future<FaceInfo> getFaceInfo({
    File? faceFile,
    String? faceUrl,
  }) {
    return _getFaceInfoUseCase.execute(faceFile: faceFile, faceUrl: faceUrl);
  }

  Future<DocumentInfo> getDocumentInfo({
    required DocumentCode documentCode,
    required int page,
    File? documentFile,
    String? documentUrl,
  }) {
    return _getDocumentInfoUseCase.execute(documentCode: documentCode, page: page, documentFile: documentFile, documentUrl: documentUrl);
  }
}
