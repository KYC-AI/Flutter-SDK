import 'package:meta/meta.dart';

@internal
abstract class Log {
  void d(String tag, String message);

  void e(String tag, dynamic error, [dynamic stacktrace]);
}
