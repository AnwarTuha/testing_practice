import 'package:flutter_driver/flutter_driver.dart';
import 'package:flutter_gherkin/flutter_gherkin.dart';
import 'package:gherkin/gherkin.dart';

class CheckGivenWidgets
    extends Given3WithWorld<String, String, String, FlutterWorld> {
  @override
  Future<void> executeStep(String input1, String input2, String input3) async {
    final emailInput = find.byValueKey(input1);
    final passInput = find.byValueKey(input2);
    final loginButton = find.byValueKey(input3);
    bool emailInputExists =
        await FlutterDriverUtils.isPresent(world.driver, emailInput);
    bool passInputExists =
        await FlutterDriverUtils.isPresent(world.driver, passInput);
    bool loginButtonExists =
        await FlutterDriverUtils.isPresent(world.driver, loginButton);
    expect(emailInputExists, true);
    expect(passInputExists, true);
    expect(loginButtonExists, true);
  }

  @override
  RegExp get pattern => RegExp(r"I have {string} and {string} and {string}");
}

class ClickLoginButton extends Then1WithWorld<String, FlutterWorld> {
  @override
  Future<void> executeStep(String loginButton) async {
    final loginFinder = find.byValueKey(loginButton);
    await FlutterDriverUtils.tap(world.driver, loginFinder);
  }

  @override
  RegExp get pattern => RegExp(r"I tap the {string} button");
}

class NavigateToHomePage extends Then1WithWorld<String, FlutterWorld> {
  @override
  Future<void> executeStep(String homePageKey) async {
    final homePageFinder = find.byValueKey(homePageKey);
    await FlutterDriverUtils.isPresent(world.driver, homePageFinder);
  }

  @override
  RegExp get pattern => RegExp(r"I should have {string} screen loaded");
}
