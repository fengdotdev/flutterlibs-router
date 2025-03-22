import 'package:flutter/material.dart';
import 'package:router_test/components/appdrawer.dart';
import 'package:router_test/components/custom_appbar.dart';



class ContactScreen extends StatelessWidget {
  const ContactScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppbar(title: 'Contact Us'),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text('Contact Us', style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
            Text('Email: contact@astrominingcorp.com'),
            Text('Phone: +1 (555) 123-4567')
          ],
        ),
      ),
      drawer: AppDrawer(),
    );
  }
}