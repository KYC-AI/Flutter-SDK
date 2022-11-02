import 'package:kyc/general/constants.dart';

class Config {
  String kycUrl = Constants.testServer;

  String apiToken = Constants.testApplicantId;

  factory Config() {
    return _singleton;
  }

  static final Config _singleton = Config._internal();

  Config._internal();
}
