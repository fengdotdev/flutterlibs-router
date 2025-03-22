import 'package:flutter/material.dart';
import 'package:router/widgets/navmenu_vertical.dart';

class AppDrawer extends StatelessWidget {
  const AppDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    return NavMenuVertical(
      menuTitle: "AstroMining Corp",
           imageTitleBackground: "assets/op1.jpg",
    );
  }
}
