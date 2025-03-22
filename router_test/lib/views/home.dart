import 'package:flutter/material.dart';
import 'package:router_test/components/appdrawer.dart';
import 'package:router_test/components/custom_appbar.dart';



class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppbar(title: 'AstroMining Corp'),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text('Welcome to AstroMining Corp', style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
            Text('Your gateway to the future of space resource extraction.')
          ],
        ),
      ),
      drawer: AppDrawer(),
    );
  }
}