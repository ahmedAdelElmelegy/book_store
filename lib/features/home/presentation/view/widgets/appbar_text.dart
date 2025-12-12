import 'package:book_app/core/widgets/custom_bext.dart';
import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

class AppbarText extends StatelessWidget {
  const AppbarText({super.key, required this.text});
  final String text;

  @override
  Widget build(BuildContext context) {
    return Shimmer.fromColors(
      period: const Duration(seconds: 12),
      baseColor: Colors.purple,
      highlightColor: Colors.red,
      child: Center(
        child: CustomText(
          text: text,
          fontSize: 24,
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }
}
