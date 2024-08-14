import 'package:flutter/material.dart';

import '../../core/utils/size_utils.dart';
import '../../theme/theme_helper.dart';

// ignore: must_be_immutable
class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  CustomAppBar({
    Key? key,
    required this.height,
    this.styleType,
    this.leadingWidth,
    this.leading,
    this.title,
    this.centerTitle,
    this.actions,
  }) : super(
          key: key,
        );

  double height;

  Style? styleType;

  double? leadingWidth;

  Widget? leading;

  Widget? title;

  bool? centerTitle;

  List<Widget>? actions;

  @override
  Widget build(BuildContext context) {
    return AppBar(
      elevation: 0,
      toolbarHeight: height,
      automaticallyImplyLeading: false,
      backgroundColor: Colors.transparent,
      flexibleSpace: _getStyle(),
      leadingWidth: leadingWidth ?? 0,
      leading: leading,
      title: title,
      titleSpacing: 0,
      centerTitle: centerTitle ?? false,
      actions: actions,
    );
  }

  @override
  Size get preferredSize => Size(
        mediaQueryData.size.width,
        height,
      );
  _getStyle() {
    switch (styleType) {
      case Style.bgShadow:
        return Container(
          height: getVerticalSize(
            44,
          ),
          width: double.maxFinite,
          decoration: BoxDecoration(
            color: appTheme.gray50,
            boxShadow: [
              BoxShadow(
                color: appTheme.black900.withOpacity(0.08),
                spreadRadius: getHorizontalSize(
                  2,
                ),
                blurRadius: getHorizontalSize(
                  2,
                ),
                offset: Offset(
                  0,
                  4,
                ),
              ),
            ],
          ),
        );
      case Style.bgFill:
        return Container(
          height: getVerticalSize(
            44,
          ),
          width: double.maxFinite,
          decoration: BoxDecoration(
            color: appTheme.gray50,
          ),
        );
      default:
        return null;
    }
  }
}

enum Style {
  bgShadow,
  bgFill,
}
