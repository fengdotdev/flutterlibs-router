import 'package:flutter/material.dart';
import 'package:router/widgets/error_route.dart';


class AppRouter {
  // Mapa para almacenar las rutas dinámicamente
  static final Map<String, Widget Function(BuildContext)> _routes = {};

  // Ruta inicial (se establecerá al registrar rutas)
  static String? _initialRoute;

  // Método para registrar rutas
  static void registerRoutes({
    required Map<String, Widget Function(BuildContext)> routes,
    required String initialRoute,
  }) {
    _routes.clear(); // Limpiar rutas previas (opcional, dependiendo de tu caso)
    _routes.addAll(routes);
    _initialRoute = initialRoute;

    // Validar que la ruta inicial exista en las rutas registradas
    if (!_routes.containsKey(initialRoute)) {
      throw Exception("Initial route '$initialRoute' not found in registered routes.");
    }
  }

  // Generador de rutas dinámico
  static Route<dynamic> generateRoute(RouteSettings settings) {
    // Si no hay rutas registradas
    if (_routes.isEmpty) {
      return MaterialPageRoute(
        builder: (_) => const ErrorView(message: "No routes registered."),
      );
    }

    // Buscar la ruta en el mapa
    final routeBuilder = _routes[settings.name];
    if (routeBuilder != null) {
      return MaterialPageRoute(builder: routeBuilder);
    }

    // Ruta no encontrada
    return MaterialPageRoute(
      builder: (_) => ErrorView(
        message: "Route '${settings.name}' not found.",
      ),
    );
  }

  // Método para navegar
  static void navigateTo(BuildContext context, String routeName) {
    if (_routes.isEmpty) {
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (_) => const ErrorView(message: "No routes registered."),
        ),
      );
    } else if (_routes.containsKey(routeName)) {
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

  // Getter para la ruta inicial
  static String? get initialRoute => _initialRoute;
}