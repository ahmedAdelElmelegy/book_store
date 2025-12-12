import 'package:book_app/core/widgets/custom_bext.dart';
import 'package:book_app/features/home/presentation/view/widgets/simular_book_list_view.dart.dart';

import 'package:flutter/material.dart';

class SimularBookSection extends StatelessWidget {
  final String category;
  const SimularBookSection({super.key, required this.category});

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
        SimularBookListView(category: category),
      ],
    );
  }
}
