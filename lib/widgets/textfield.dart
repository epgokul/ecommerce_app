import 'package:flutter/material.dart';

class CustomTextfield extends StatelessWidget {
  const CustomTextfield(
      {super.key,
      required this.obscureText,
      required this.normalBorderColor,
      required this.focusedBorderColor,
      required this.controller,
      required this.keyboardType});

  final bool obscureText;
  final Color normalBorderColor;
  final Color focusedBorderColor;
  final TextEditingController controller;
  final TextInputType keyboardType;

  @override
  Widget build(BuildContext context) {
    return TextField(
      onTapOutside: (event) {
        FocusScope.of(context).unfocus();
      },
      cursorColor: Colors.black,
      cursorHeight: 18,
      decoration: InputDecoration(
        contentPadding: const EdgeInsets.symmetric(vertical: 2, horizontal: 8),
        labelStyle: const TextStyle(fontFamily: 'WorkSans'),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(20),
          borderSide: BorderSide(color: normalBorderColor),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(20),
          borderSide: BorderSide(color: focusedBorderColor),
        ),
      ),
      obscureText: obscureText,
      controller: controller,
      keyboardType: keyboardType,
    );
  }
}
