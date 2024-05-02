import 'package:flutter/material.dart';
import 'package:notsapp/combonants/constants.dart';

class MyCard extends StatelessWidget {
  final Widget child;

  const MyCard({required this.child, Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          color: kSecondPrimaryColor,
          borderRadius: BorderRadius.circular(16),
          boxShadow: [defaultShadow()]),
      child: child,
    );
  }
}

BoxShadow defaultShadow() => BoxShadow(
    color: Colors.purple.withOpacity(0.3),
    spreadRadius: 0,
    blurRadius: 4,
    blurStyle: BlurStyle.outer);
