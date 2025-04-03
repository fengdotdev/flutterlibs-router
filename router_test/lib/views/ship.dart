import 'package:flutter/material.dart';
import 'package:router/approuter/approuter.dart';
import 'package:router/types/args.dart';
import 'package:router_test/components/appdrawer.dart';
import 'package:router_test/components/custom_appbar.dart';

class MiningShipScreen extends StatelessWidget {
  const MiningShipScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final Args args = getArgs(context);

    var shipname = getShipName(args);

    return Scaffold(
      appBar: CustomAppbar(title: "Mining ship $shipname"),

      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'Welcome to the Mining Ship $shipname',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            Expanded(child: Image.asset("assets/ship.jpg")),
            Text(
              'Your gateway to the future of space resource extraction.',
              style: TextStyle(fontSize: 16),
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                goBack(context);
              },
              child: Text('Go Back'),
            ),
          ],
        ),
      ),
      drawer: AppDrawer(),
    );
  }

  String getShipName(Args args) {
    return args['shipName'] ?? "Unknown Ship";
  }
}
