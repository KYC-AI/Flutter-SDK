import 'dart:io';

import 'package:injectable/injectable.dart';
import 'package:meta/meta.dart';
import 'package:stargaze_kyc_sdk/src/data/api/base/api_http_overrides.dart';
import 'package:stargaze_kyc_sdk/src/domain/repository/general/configure_repository.dart';

@Singleton()
@internal
class ApiBaseRepositoryImpl {
  final ConfigureRepository _configureRepository;

  ApiBaseRepositoryImpl(this._configureRepository) {
    HttpOverrides.global = ApiHttpOverrides();
  }

  String getBaseUrl() {
    return _configureRepository.config.server;
  }
}
