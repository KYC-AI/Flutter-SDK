import 'package:meta/meta.dart';
import 'package:stargaze_kyc_sdk/src/domain/repository/log/log.dart';
import 'package:stargaze_kyc_sdk/src/di/configure_dependencies.dart';

@internal
mixin LogHelper {
  final Log tLog = getIt<Log>();
}
