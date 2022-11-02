// ignore: depend_on_referenced_packages
import 'package:meta/meta.dart';
import 'package:stargaze_kyc_sdk/src/domain/model/config.dart';

@internal
abstract class ConfigureRepository {
  Config get config;

  void initialize({
    required Config config,
  });
}
