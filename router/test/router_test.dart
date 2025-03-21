import 'package:flutter_test/flutter_test.dart';

import 'package:router/router.dart';

void main() {
  test('adds one to input values', () {
    AppRouter.registerRoutes(
      routes: {},
      initialRoute: 'home',
    );
    expect(AppRouter. {});
    expect(AppRouter._initialRoute, 'home');
  });
}
