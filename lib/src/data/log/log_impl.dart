import 'package:flutter/foundation.dart';
import 'package:injectable/injectable.dart';
import 'package:meta/meta.dart';
import 'package:stargaze_kyc_sdk/src/domain/repository/log/log.dart';

@LazySingleton(as: Log)
@internal
class LogImpl implements Log {
  @override
  void d(String tag, String message) {
    debugPrint('DEBUG : $tag : $message');
  }

  @override
  void e(String tag, dynamic error, [dynamic stacktrace = '']) {
    debugPrint('ERROR : $tag : $error : $stacktrace');
  }
}
