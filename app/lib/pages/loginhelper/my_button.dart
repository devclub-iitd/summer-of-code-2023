import 'package:flutter/material.dart';
import 'package:myproject/widgets/themes.dart';
// ignore: unused_import
import 'package:velocity_x/velocity_x.dart';

class MyButton extends StatelessWidget {
  final Function()? onTap;

  const MyButton({super.key, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.all(18),
        margin: const EdgeInsets.symmetric(horizontal: 140),
        decoration: BoxDecoration(
          color:MyTheme.darkCreamColor,
          borderRadius: BorderRadius.circular(6),
        ),
        child: const Center(
          child: Text(
            "Sign In",
            style: TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.bold,
              fontSize: 16,
            ),
          ),
        ),
      ),
    );
  }
}