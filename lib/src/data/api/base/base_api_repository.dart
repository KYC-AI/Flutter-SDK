import 'dart:async';
import 'dart:io';

import 'package:http/http.dart' as http;
import 'package:http/http.dart';
import 'package:http/retry.dart';
import 'package:meta/meta.dart';
import 'package:stargaze_kyc_sdk/src/data/api/base/api_base_repository_impl.dart';
import 'package:stargaze_kyc_sdk/src/data/api/base/exception/base_backend_exception.dart';
import 'package:stargaze_kyc_sdk/src/domain/repository/general/configure_repository.dart';
import 'package:stargaze_kyc_sdk/src/general/log_helper.dart';

@internal
abstract class BaseApiRepository with LogHelper {
  static const tag = 'BaseApiRepository';

  static const networkRequestsTimeout = 180;
  static const defaultTimeout = Duration(seconds: networkRequestsTimeout);

  final ApiBaseRepositoryImpl _apiBaseRepository;
  final ConfigureRepository _configureRepository;

  late RetryClient _retryClient;

  BaseApiRepository(this._apiBaseRepository, this._configureRepository) {
    _retryClient = RetryClient(
      Client(),
      whenError: (e, stackTrace) {
        return e is SocketException || e is TimeoutException || e is http.ClientException || e is HandshakeException;
      },
    );
  }

  String get baseApiUrl {
    return _apiBaseRepository.getBaseUrl();
  }

  String getBasePath();

  String getApiUrl(String apiName) {
    return baseApiUrl + getBasePath() + apiName;
  }

  Future<bool> validateResponse(http.Response response) async {
    if (response.statusCode >= 200 && response.statusCode <= 299) {
      return Future.value(true);
    } else if (response.statusCode == 401) {
      throw BaseBackendException.unauthorized;
    } else if (response.statusCode == 402) {
      throw BaseBackendException.paymentRequired;
    } else {
      throw BaseBackendException.unknown;
    }
  }

  Future<Map<String, String>> prepareHeader() async {
    final Map<String, String> headers = <String, String>{};
    headers[HttpHeaders.contentTypeHeader] = 'application/json; charset=utf-8';
    headers[HttpHeaders.authorizationHeader] = 'Token ${_configureRepository.config.apiToken}';
    return Future.value(headers);
  }

  Future<http.Response> executeRequest({
    required RequestType requestType,
    required String url,
    Object? body,
  }) async {
    final uri = Uri.parse(Uri.encodeFull(url));
    http.Response response;
    final Map<String, String> headers = await prepareHeader();

    switch (requestType) {
      case RequestType.get:
        response = await _retryClient.get(uri, headers: headers).timeout(defaultTimeout);
        break;
      case RequestType.post:
        response = await _retryClient.post(uri, body: body, headers: headers).timeout(defaultTimeout);
        break;
      case RequestType.put:
        response = await _retryClient.put(uri, body: body, headers: headers).timeout(defaultTimeout);
        break;
      case RequestType.patch:
        response = await _retryClient.patch(uri, body: body, headers: headers).timeout(defaultTimeout);
        break;
      case RequestType.delete:
        response = await _retryClient.delete(uri, headers: headers).timeout(defaultTimeout);
        break;
    }

    return Future.value(response);
  }
}

enum RequestType { get, post, put, patch, delete }
