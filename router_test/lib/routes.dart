import 'package:flutter/material.dart';
import 'package:router_test/views/about.dart';
import 'package:router_test/views/contact.dart';
import 'package:router_test/views/home.dart';

final Map<String, Widget Function(BuildContext)> miningAppRoutes = {
  '/': (context) => const HomeScreen(),
  '/about': (context) => const AboutScreen(),
  '/contact': (context) => const ContactScreen(),
};
