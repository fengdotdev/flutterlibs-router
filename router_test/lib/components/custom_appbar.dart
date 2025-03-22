import 'package:flutter/material.dart';
import 'package:router/widgets/adress_bar.dart';



class CustomAppbar extends StatelessWidget implements PreferredSizeWidget {
  final String title;
  const CustomAppbar({super.key, required this.title});

  @override
  Widget build(BuildContext context) {
    return AppBar(
      title:  Row(
    children: [
      Text(title),
      SizedBox(width: 16), 
      Expanded(child: SizedBox(width: 300, child: AddressBar(
        inputDecoration: InputDecoration(
          hintText: 'Search',
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(30),
            borderSide: BorderSide.none,
          ),
          filled: true,
          fillColor: Colors.white,
          contentPadding: EdgeInsets.symmetric(horizontal: 16),
        ),
      ))),
    ],
  ),
      backgroundColor: Colors.grey,
      foregroundColor: Colors.white,
    );
  }

  @override
  Size get preferredSize => Size.fromHeight(60);
}
