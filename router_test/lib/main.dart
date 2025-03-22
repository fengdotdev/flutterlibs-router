import 'package:flutter/material.dart';
import 'package:router/approuter/approuter.dart';
import 'package:router_test/routes.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    AppRouter.registerRoutes(
      routes: miningAppRoutes,
      initialRoute: "/"
    );

    return  MaterialApp(
     initialRoute: AppRouter.initialRoute, 
      onGenerateRoute: AppRouter.generateRoute,
    );
  }
}







