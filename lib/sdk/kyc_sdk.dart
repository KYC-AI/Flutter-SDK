import 'dart:async';

import 'package:flutter/foundation.dart';
import 'package:get_it/get_it.dart';

import 'package:injectable/injectable.dart';
import 'package:stargaze_kyc_sdk/src/domain/model/config.dart';
import 'package:stargaze_kyc_sdk/src/domain/repository/general/configure_repository.dart';
import 'package:stargaze_kyc_sdk/src/presentation/injection/configure_dependencies.dart';

class KycSdk {
  static const tag = 'KycSdk';
  static bool _getItInitialized = false;

  final Config config;

  KycSdk({required this.config});

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

    return Future.value();
  }
}
