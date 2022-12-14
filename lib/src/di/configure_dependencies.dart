import 'package:get_it/get_it.dart';
import 'package:injectable/injectable.dart';
import 'package:meta/meta.dart';
import 'package:stargaze_kyc_sdk/src/di/configure_dependencies.config.dart';

final getIt = GetIt.instance;

@InjectableInit()
@internal
Future<void> configureDependencies(String env) async {
  $initGetIt(getIt, environment: env);
  return Future.value();
}
