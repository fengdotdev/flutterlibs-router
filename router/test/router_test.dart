import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

import 'package:router/router.dart';

void main() {
  test('adds one to input values', () {

    AppRouter.registerRoutes(
      routes: {
        'home': (_) => const HomeView(),
        'details': (_) => const DetailsView(),
      },
      initialRoute: 'home',
    );
    expect(AppRouter.initialRoute, 'home');
  });
}





class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('HomeView'),
      ),
      body: Center(
        child: ElevatedButton(
          onPressed: () {
            AppRouter.navigateTo(context, 'details');
          },
          child: Text('Go to Details'),
        ),
      ),
    );
  }
}


class DetailsView extends StatelessWidget {
  const DetailsView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('DetailsView'),
      ),
      body: Center(
        child: ElevatedButton(
          onPressed: () {
            AppRouter.goBack(context);
          },
          child: Text('Go back'),
        ),
      ),
    );
  }
}