import 'package:flutter/material.dart';

class BaseButton extends StatelessWidget {
  BaseButton({
    Key? key,
    required this.text,
    this.onTap,
    this.buttonStyle,
    this.disabledButtonStyle,
    this.buttonTextStyle,
    this.isDisabled,
    this.height,
    this.width,
    this.margin,
    this.alignment,
  }) : super(
          key: key,
        );

  final String text;

  final VoidCallback? onTap;

  final ButtonStyle? buttonStyle;

  final ButtonStyle? disabledButtonStyle;

  final TextStyle? buttonTextStyle;

  final bool? isDisabled;

  final double? height;

  final double? width;

  final EdgeInsets? margin;

  final Alignment? alignment;

  @override
  Widget build(BuildContext context) {
    return const SizedBox.shrink();
  }
}
