import 'package:book_app/core/widgets/custom_bext.dart';
import 'package:book_app/features/home/presentation/view/widgets/smillier_books_list_view.dart';

import 'package:flutter/material.dart';

class SimmilerBooksDetailes extends StatelessWidget {
  const SimmilerBooksDetailes({super.key});

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Column(
      children: [
        const Align(
          alignment: Alignment.centerLeft,
          child: CustomText(
            text: 'You can  also like',
            fontSize: 18,
            fontWeight: FontWeight.bold,
          ),
        ),
        SizedBox(height: size.height * .03),
        const SmillierBooksListview(),
      ],
    );
  }
}
