import 'package:injectable/injectable.dart';

import 'package:meta/meta.dart';
import 'package:stargaze_kyc_sdk/src/domain/model/config.dart';
import 'package:stargaze_kyc_sdk/src/domain/repository/general/configure_repository.dart';
import 'package:stargaze_kyc_sdk/src/general/log_helper.dart';

@LazySingleton(as: ConfigureRepository)
@internal
class ConfigureRepositoryImpl with LogHelper implements ConfigureRepository {
  static const tag = 'ConfigureRepositoryImpl';

  late Config _applicant;

  @override
  Config get config => _applicant;

  @override
  void initialize({required Config config}) {
    _applicant = config;
  }
}
