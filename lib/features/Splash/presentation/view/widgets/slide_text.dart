import 'package:book_app/core/widgets/custom_bext.dart';
import 'package:flutter/material.dart';

class SlideText extends StatelessWidget {
  const SlideText({super.key, required this.slideAnimation});

  final Animation<Offset> slideAnimation;

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: slideAnimation,
      builder: (context, child) => SlideTransition(
        position: slideAnimation,
        child: const CustomText(
          text: 'Read Free book',
          textAlign: TextAlign.center,
        ),
      ),
    );
  }
}
