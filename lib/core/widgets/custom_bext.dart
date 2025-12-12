import 'package:flutter/material.dart';

class CustomText extends StatelessWidget {
  const CustomText(
      {super.key,
      required this.text,
      this.fontSize = 16,
      this.fontFamily,
      this.overflow,
      this.maxLines,
      this.fontWeight,
      this.color,
      this.textAlign});
  final String text;
  final double? fontSize;
  final FontWeight? fontWeight;
  final String? fontFamily;
  final TextOverflow? overflow;
  final int? maxLines;
  final Color? color;
  final TextAlign? textAlign;

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: TextStyle(
          fontSize: fontSize,
          fontWeight: fontWeight,
          fontFamily: fontFamily,
          color: color),
      overflow: overflow,
      maxLines: maxLines,
      textAlign: textAlign,
    );
  }
}
