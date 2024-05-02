import 'package:flutter/material.dart';
import 'package:notsapp/combonants/constants.dart';
import 'package:shimmer/shimmer.dart';

import '../../combonants/Confirm_Dialog.dart';
import 'custom_icon.dart';

class CustomAppBar extends StatelessWidget {
  const CustomAppBar({Key? key, required this.title, this.icon, this.onPressed})
      : super(key: key);

  final String title;
  final IconData? icon;
  final void Function()? onPressed;
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Shimmer.fromColors(
          child: Text(
            title,
            style: const TextStyle(
              fontSize: 28,
            ),
          ),
          baseColor: Colors.red,
          highlightColor: Colors.yellow,
        ),
        CustomIcon(
          onPressed: onPressed,
          icon: icon,
        ),
      ],
    );
  }
}
