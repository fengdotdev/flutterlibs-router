import 'package:flutter/material.dart';
import 'package:router_test/components/appdrawer.dart';
import 'package:router_test/components/custom_appbar.dart';

class AboutScreen extends StatelessWidget {
  const AboutScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppbar(title: 'AstroMining Corp'),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'About Us',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            Text(
              'AstroMining Corp pioneers asteroid mining for a sustainable future.',
            ),
          ],
        ),
      ),
      drawer: AppDrawer(),
    );
  }
}
