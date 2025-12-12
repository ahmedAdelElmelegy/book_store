import 'package:book_app/core/widgets/custom_bext.dart';
import 'package:flutter/material.dart';

class CustomButtom extends StatelessWidget {
  const CustomButtom({
    super.key,
    required this.fontSize,
    required this.text,
    required this.bagroundColor,
    required this.textColor,
    required this.borderRadius,
    this.onPressed,
  });
  final double fontSize;
  final String text;
  final Color bagroundColor;
  final Color textColor;
  final BorderRadius borderRadius;
  final void Function()? onPressed;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: SizedBox(
        height: MediaQuery.of(context).size.height * .06,
        child: TextButton(
          style: TextButton.styleFrom(
            backgroundColor: bagroundColor,
            shape: RoundedRectangleBorder(borderRadius: borderRadius),
          ),
          onPressed: onPressed,
          child: CustomText(
            color: textColor,
            fontSize: fontSize,
            text: text,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    );
  }
}
