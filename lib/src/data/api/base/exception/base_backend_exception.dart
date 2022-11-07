import 'package:meta/meta.dart';
import 'package:stargaze_kyc_sdk/src/domain/exception/kyc_sdk_exception.dart';

@internal
enum BaseBackendException implements Exception {
  unknown(msg: 'UNKNOWN'),
  unauthorized(msg: 'Unauthorized'),
  paymentRequired(msg: 'Payment Required');

  const BaseBackendException({required this.msg});

  final String msg;

  /// This required to map the data -> domain current exception values
  KycSdkException get map {
    switch (this) {
      case BaseBackendException.unknown:
        return KycSdkException.unknown;
      case BaseBackendException.unauthorized:
        return KycSdkException.unauthorized;
      case BaseBackendException.paymentRequired:
        return KycSdkException.paymentRequired;
    }
  }

  /// Use it if need to compare two values of this enum
  bool isEqual(dynamic value) {
    if (value is String) {
      return msg == value;
    } else {
      return toString() == value.toString();
    }
  }

  @override
  String toString() {
    return 'BaseBackendException{$msg}';
  }
}
