import 'package:flutter/material.dart';
import 'package:router/approuter/approuter.dart';

class NavMenuVertical extends StatelessWidget {
  // ex  assets/image.jpg
  final String? imageTitleBackground;
  final String menuTitle;
  final Color? titleColor;
  final double? titleSize;
  final Color? backgroundColor;


  final double? elementSize;
  final Color? elementColor;
  final Color? elementSelectedColor;


  const NavMenuVertical({super.key, required this.menuTitle, this.titleColor, this.backgroundColor, this.elementColor, this.elementSelectedColor, this.titleSize, this.elementSize,  this.imageTitleBackground});

  @override
  Widget build(BuildContext context) {
    List<String> routes = AppRouter.routes;

   final titlewidget= Text(
              menuTitle,
              style: TextStyle(
                color: titleColor ?? Colors.white,
                fontSize: titleSize ?? 24,
              ),
            );


    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: [
          DrawerHeader(
            decoration: BoxDecoration(color: backgroundColor ?? Colors.blue,
            image: imageTitleBackground != null ? DecorationImage(image: AssetImage(imageTitleBackground!), fit: BoxFit.cover): null
            ),
            child:  Center(child: titlewidget),
          ),
          for (String route in routes)
            ListTile(
              title: Text(route, style: TextStyle(color: elementColor ?? Colors.black, fontSize: elementSize ?? 16)),
              selected: AppRouter.routeHistory.contains(route),
              selectedTileColor: elementSelectedColor ?? Colors.blue[100],
              onTap: () {
                AppRouter.navigateTo(context, route);
              },
            ),
        ],
      ),
    );
  }
}
