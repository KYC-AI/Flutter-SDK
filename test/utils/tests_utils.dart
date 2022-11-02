// ignore_for_file: avoid_classes_with_only_static_members

import 'dart:async';

import 'package:get_it/get_it.dart';
import 'package:injectable/injectable.dart';
import 'package:stargaze_kyc_sdk/src/domain/model/config.dart';
import 'package:stargaze_kyc_sdk/src/domain/repository/general/configure_repository.dart';
import 'package:stargaze_kyc_sdk/src/presentation/injection/configure_dependencies.dart';

class TestsUtils {
  // Only for testing
  static const testApplicantId = '133e663f032fbd8f6afd4cb932030d8491ea01d5';
  static const testServer = 'https://api.kycai.pro/v1.0/';

  static Future<void> initializeMock() async {
    await GetIt.instance.reset();
    await configureDependencies(Environment.test);
    await GetIt.instance.allReady();
    GetIt.instance.allowReassignment = true;

    final config = Config(apiToken: testApplicantId, server: testServer);
    final configureRepository = getIt<ConfigureRepository>();
    configureRepository.initialize(config: config);
  }
}
