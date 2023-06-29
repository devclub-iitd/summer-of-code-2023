import 'package:flutter/material.dart';
import 'package:myproject/widgets/themes.dart';
import 'package:velocity_x/velocity_x.dart';

class MyTextField extends StatelessWidget {
  final controller;
  final String hintText;
  final bool obscureText;

  const MyTextField({
    super.key,
    required this.controller,
    required this.hintText,
    required this.obscureText, required String labelText,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 25.0),
      child: TextField(
        controller: controller,
        obscureText: obscureText,
        decoration: InputDecoration(
            enabledBorder: const OutlineInputBorder(
              borderSide: BorderSide(color:Colors.deepPurple),
            ),
            focusedBorder: OutlineInputBorder(
              borderSide: BorderSide(color:MyTheme.darkCreamColor),
            ),
            fillColor: context.canvasColor,
            filled: true,
            hintText: hintText,
            hintStyle: TextStyle(color:Colors.white)),
      ),
    );
  }
}