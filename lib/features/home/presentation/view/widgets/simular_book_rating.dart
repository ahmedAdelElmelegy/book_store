import 'package:book_app/core/widgets/custom_bext.dart';
import 'package:flutter/material.dart';

class SimularBookRating extends StatelessWidget {
  const SimularBookRating({super.key, required this.size});

  final Size size;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        const Icon(Icons.star, color: Color(0xffFFDD4f), size: 30),
        const CustomText(text: '4.8', fontSize: 16),
        SizedBox(width: size.width * .005),
        const Opacity(
          opacity: .6,
          child: CustomText(text: '(245)', fontSize: 16),
        ),
      ],
    );
  }
}
