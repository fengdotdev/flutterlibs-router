import 'package:flutter/material.dart';

class LogoImg extends StatelessWidget {
  const LogoImg({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox.expand(child: Image.asset('assets/corp.jpg'));
  }
}

class AsteroidImg extends StatelessWidget {
  final double width;
  final double height;
  const AsteroidImg({super.key, required this.width, required this.height});

  @override
  Widget build(BuildContext context) {
    return Image.asset(
      'assets/op1.jpg',
      width: width,
      height: height,
      fit: BoxFit.cover,
    );
  }
}

class Asteroid2Img extends StatelessWidget {
  const Asteroid2Img({super.key});

  @override
  Widget build(BuildContext context) {
    return Image.asset('assets/op2.jpg');
  }
}

class ShipImg extends StatelessWidget {
  const ShipImg({super.key});

  @override
  Widget build(BuildContext context) {
    return Image.asset('assets/ship.jpg');
  }
}
