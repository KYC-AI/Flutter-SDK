import 'dart:async';

import 'package:get_it/get_it.dart';
import 'package:injectable/injectable.dart';
import 'package:stargaze_kyc_sdk/src/domain/model/config.dart';
import 'package:stargaze_kyc_sdk/src/domain/repository/general/configure_repository.dart';
import 'package:stargaze_kyc_sdk/src/presentation/injection/configure_dependencies.dart';

class TestsUtils {
  // Only for testing
  static const testApplicantId = '6ba40871fdb130b4b733c89aa8a778932906e23f';
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
