import 'package:flutter/material.dart';
import 'package:router/approuter/approuter.dart';


class AddressBar extends StatelessWidget {
  final TextEditingController controller;
  final InputDecoration? inputDecoration;
  final IconData icon;
  final VoidCallback? onSubmit;
  final Color? iconColor;
  final double spacing;

  AddressBar({
    super.key,
    TextEditingController? controller,
    this.inputDecoration,
    this.icon = Icons.send,
    this.onSubmit,
    this.iconColor,
    this.spacing = 8.0,
  })  : controller = controller ?? TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: TextField(
            controller: controller,
            decoration: inputDecoration ?? const InputDecoration(labelText: 'Enter a route'),
          ),
        ),
        SizedBox(width: spacing),
        IconButton(
          icon: Icon(icon, color: iconColor ?? Theme.of(context).iconTheme.color),
          onPressed: onSubmit ?? () {
            AppRouter.navigateTo(context, controller.text);
          },
        ),
      ],
    );
  }
}