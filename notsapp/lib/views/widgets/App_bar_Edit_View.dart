import 'package:flutter/material.dart';
import 'package:notsapp/combonants/Confirm_Dialog.dart';
import 'package:shimmer/shimmer.dart';

import 'custom_icon.dart';

class CustomAppBarEdit extends StatelessWidget {
  const CustomAppBarEdit(
      {Key? key, required this.title, this.icon, this.onPressed})
      : super(key: key);

  final String title;
  final IconData? icon;
  final void Function()? onPressed;
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        ElevatedButton(
          style: ElevatedButton.styleFrom(
              shape: const CircleBorder(),
              padding: const EdgeInsets.all(12),
              backgroundColor: Colors.purple.withOpacity(0.2)),
          child: const Icon(Icons.arrow_back),
          onPressed: () => ConfirmDialog(context, "Cancel",
              "Do you want to cancel this note?", () => Navigator.pop(context)),
        ),
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
