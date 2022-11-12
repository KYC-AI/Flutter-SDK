import 'dart:async';

import 'package:flutter_test/flutter_test.dart';

import 'utils/tests_utils.dart';

Future<void> testExecutable(FutureOr<void> Function() testMain) async {
  setUpAll(() async {
    await TestsUtils.initializeMock();
  });

  await testMain();
}
