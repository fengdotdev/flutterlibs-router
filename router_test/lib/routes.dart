import 'package:flutter/material.dart';
import 'package:router_test/views/about.dart';
import 'package:router_test/views/contact.dart';
import 'package:router_test/views/home.dart';
import 'package:router_test/views/ship.dart';

final Map<String, Widget Function(BuildContext)> miningAppRoutes = {
  '/': (context) => const HomeScreen(),
  '/about': (context) => const AboutScreen(),
  "/ship": (context)=> MiningShipScreen(),
  '/contact': (context) => const ContactScreen(),
};
