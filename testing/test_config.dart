import 'dart:async';

import 'package:flutter_gherkin/flutter_gherkin.dart';
import 'package:gherkin/gherkin.dart';
import 'package:glob/glob.dart';

import 'steps/auth/login_steps.dart';

Future<void> main() {
  final config = FlutterTestConfiguration()
    ..features = [Glob(r"testing/features/**.feature")]
    ..reporters = [ProgressReporter()]
    ..stepDefinitions = [CheckGivenWidgets(), ClickLoginButton(), NavigateToHomePage()]
    ..restartAppBetweenScenarios = true
    ..targetAppPath = "testing/main_test.dart";
  //..exitAfterTestRun = true;
  return GherkinRunner().execute(config);
}
