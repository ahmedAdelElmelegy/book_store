import 'package:flutter/material.dart';

class CustomTextField extends StatelessWidget {
  const CustomTextField({
    super.key,
    required this.hintText,
    this.suffixicon,
    this.controller,
    this.validator,
    this.onChanged,
    this.onFieldSubmitted,
    this.fillcolor,
  });
  final String hintText;
  final Widget? suffixicon;
  final TextEditingController? controller;
  final String? Function(String?)? validator;
  final void Function(String)? onChanged;
  final void Function(String)? onFieldSubmitted;
  final Color? fillcolor;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      validator: validator,
      onChanged: onChanged,
      onFieldSubmitted: onFieldSubmitted,
      decoration: InputDecoration(
        hintText: hintText,
        prefixIconColor: Colors.grey,
        // fillColor: fillcolor ?? Colors.white,
        suffixIcon: suffixicon,
        filled: true,
        // prefixIcon: Icon(icon),
        hintStyle: const TextStyle(color: Colors.grey),
        contentPadding: const EdgeInsets.fromLTRB(15, 10, 15, 10),
        border: outineMethod(),
        enabledBorder: outineMethod(),
        focusedBorder: outineMethod(),
      ),
    );
  }

  OutlineInputBorder outineMethod() {
    return OutlineInputBorder(
      borderRadius: BorderRadius.circular(8),
      borderSide: BorderSide(color: Colors.grey),
    );
  }
}
