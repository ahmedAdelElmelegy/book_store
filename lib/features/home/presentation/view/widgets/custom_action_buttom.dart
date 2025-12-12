import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class CustomActionButtom extends StatelessWidget {
  const CustomActionButtom({
    super.key,
    this.onPressed,
  });
  final void Function()? onPressed;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(right: 5),
      child: IconButton(
        onPressed: onPressed,
        icon: const Icon(
          FontAwesomeIcons.magnifyingGlass,
          size: 24,
        ),
      ),
    );
  }
}
