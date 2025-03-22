import 'package:flutter/material.dart';

class HelloWorldView extends StatelessWidget {
  const HelloWorldView({super.key});

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      appBar: AppBar(
        title: Text('Router Hello World View'),

      ),
      body: Center(
        child: Text('Hello World!'),
      ),
      bottomSheet: Text("no route registered as initial route"),
    );
  }
}