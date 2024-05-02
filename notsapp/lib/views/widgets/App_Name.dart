import 'package:flutter/material.dart';

import 'package:shimmer/shimmer.dart';

class AppMorningTextWidget extends StatelessWidget {
  const AppMorningTextWidget({super.key, required this.textt});
  final String textt;

  @override
  Widget build(BuildContext context) {
    return Shimmer.fromColors(
      period: const Duration(seconds: 2),
      baseColor: Colors.red,
      highlightColor: Colors.yellow,
      child: Text(
        textt,
        style: TextStyle(fontSize: 24, color: Colors.white),
      ),
    );
  }
}
