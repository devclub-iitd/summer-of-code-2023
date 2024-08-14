import '../core/utils/image_constant.dart';
import '../core/utils/size_utils.dart';
import '../theme/custom_text_style.dart';
import '../theme/theme_helper.dart';
import 'custom_image_view.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class CustomSwitch extends StatelessWidget {
  CustomSwitch({
    Key? key,
    required this.onChange,
    this.alignment,
    this.value,
    this.width,
    this.height,
    this.margin,
  }) : super(
          key: key,
        );

  final Alignment? alignment;

  bool? value;

  final Function(bool) onChange;

  final double? width;

  final double? height;

  final EdgeInsetsGeometry? margin;

  @override
  Widget build(BuildContext context) {
    return Container(
        height: height,
        width: width,
        margin: margin,
        child: alignment != null
            ? Align(
                alignment: alignment ?? Alignment.center,
                child: switchWidget,
              )
            : switchWidget);
  }

  Widget get switchWidget => CupertinoSwitch(
        value: value ?? false,
        trackColor: appTheme.gray500.withOpacity(0.39),
        thumbColor: theme.colorScheme.onPrimary.withOpacity(1),
        activeColor: appTheme.gray500.withOpacity(0.39),
        onChanged: (value) {
          onChange(value);
        },
      );
}
