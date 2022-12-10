/// Class intended to configure KYC sdk
/// [apiToken] should be generated in user panel on https://kycai.pro/
/// [server] should be link to KYC server, for current version is https://api.kycai.pro/v1.0/
class Config {
  final String apiToken;
  final String server;

  Config({
    required this.apiToken,
    required this.server,
  });
}
