import 'package:book_app/core/widgets/custom_bext.dart';

import 'package:flutter/material.dart';

class CustomErorrFailure extends StatelessWidget {
  const CustomErorrFailure({super.key, required this.failureMassage});
  final String failureMassage;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: CustomText(
        text: failureMassage,
        fontSize: 20,
        fontWeight: FontWeight.bold,
      ),
    );
  }
}
