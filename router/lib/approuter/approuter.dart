import 'package:flutter/material.dart';
import 'package:router/types/args.dart';
import 'package:router/widgets/error_route.dart';

class AppRouter {
  static final Map<String, Widget Function(BuildContext)> _routes = {};

  static List<String> get routes => _routes.keys.toList();

  static final List<(String,Args?)> _routeHistory = [];
  static List<(String,Args?)> get routeHistory => _routeHistory;

  static final GlobalKey<NavigatorState> _navigatorKey =
      GlobalKey<NavigatorState>();
  static GlobalKey<NavigatorState> get navigatorKey => _navigatorKey;

  static String? _initialRoute;

  static void registerRoutes({
    required Map<String, Widget Function(BuildContext)> routes,
    required String initialRoute,
  }) {
    _routes.clear();
    _routes.addAll(routes);
    _initialRoute = initialRoute;

    //validate that the initial route is registered
    if (!_routes.containsKey(initialRoute)) {
      throw Exception(
        "Initial route '$initialRoute' not found in registered routes.",
      );
    }
  }

  //
  static Route<dynamic> generateRoute(RouteSettings settings) {
    // if no routes are registered return an error view route
    if (_routes.isEmpty) {
      return MaterialPageRoute(
        builder: (_) => const ErrorView(message: "No routes registered."),
      );
    }

    // search for the route
    final routeBuilder = _routes[settings.name];
    if (routeBuilder != null) {
      return MaterialPageRoute(builder: routeBuilder, settings: settings);
    }

    // route not found
    return MaterialPageRoute(
      builder: (_) => ErrorView(message: "Route '${settings.name}' not found."),
    );
  }

  // for navigation
  static void navigateTo(BuildContext context, String routeName) {
    if (_routes.isEmpty) {
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (_) => const ErrorView(message: "No routes registered."),
        ),
      );
    } else if (_routes.containsKey(routeName)) {
      // save the route to the history
      _routeHistory.add((routeName, null));

      Navigator.pushNamed(context, routeName);
    } else {
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (_) => ErrorView(message: "Route '$routeName' not found."),
        ),
      );
    }
  }

  static void navigateToWithArgs(
    BuildContext context,
    String routeName,
    Args args,
  ) {
    if (_routes.isEmpty) {
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (_) => const ErrorView(message: "No routes registered."),
        ),
      );
    } else if (_routes.containsKey(routeName)) {
      // save the route to the history
      _routeHistory.add((routeName, args));
      Navigator.pushNamed(context, routeName, arguments: args);
    } else {
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (_) => ErrorView(message: "Route '$routeName' not found."),
        ),
      );
    }
  }

  static Args? mayArgs(BuildContext context) {
    return ModalRoute.of(context)?.settings.arguments as Args?;
  }

  static Args argsOrEmpty(BuildContext context) {
    return AppRouter.mayArgs(context) ?? Args();
  }

  // for navigation with out context
  static void goTo(String routeName) {
    if (_routes.isEmpty) {
      _navigatorKey.currentState!.push(
        MaterialPageRoute(
          builder: (_) => const ErrorView(message: "No routes registered."),
        ),
      );
    } else if (_routes.containsKey(routeName)) {
      _navigatorKey.currentState!.pushNamed(routeName);
    } else {
      _navigatorKey.currentState!.push(
        MaterialPageRoute(
          builder: (_) => ErrorView(message: "Route '$routeName' not found."),
        ),
      );
    }
  }

  // for returning to the previous view
  static void goBack(BuildContext context) {
    Navigator.pop(context);
  }

  // for returning the initial route if exists
  static String? get initialRoute => _initialRoute;


}

Args getArgs(BuildContext context) {
  return AppRouter.mayArgs(context) ?? Args();
}

void goTo(BuildContext context, String routeName, {Args? args}) {
  if (args != null) {
    return AppRouter.navigateToWithArgs(context, routeName, args);
  }
  return AppRouter.navigateTo(context, routeName);
}

void navigateTo(BuildContext context, String routeName, {Args? args}) {
  if (args != null) {
    return AppRouter.navigateToWithArgs(context, routeName, args);
  }
  return AppRouter.navigateTo(context, routeName);
}

void goBack(BuildContext context) {
  AppRouter.goBack(context);
}
