import 'package:flutter/material.dart';

class CustomIcon extends StatelessWidget {
  const CustomIcon({Key? key, this.icon, this.onPressed}) : super(key: key);

  final void Function()? onPressed;
  final IconData? icon;
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 46,
      width: 46,
      decoration: BoxDecoration(
          color: Colors.purple.withOpacity(0.2), borderRadius: BorderRadius.circular(30)),
      child: IconButton(
        onPressed: onPressed,
        icon: Icon(
          icon,
          size: 30,
        ),
      ),
    );
  }
}
