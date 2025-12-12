import 'package:book_app/core/widgets/custom_bext.dart';

import 'package:flutter/material.dart';

class BookRating extends StatelessWidget {
  const BookRating({super.key, required this.size, required this.count});

  final Size size;
  final String count;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        const Icon(Icons.star, color: Color(0xffFFDD4f), size: 30),
        const CustomText(text: '4.4', fontSize: 16),
        SizedBox(width: size.width * .01),
        CustomText(text: " ($count )", fontSize: 16),
      ],
    );
  }
}
