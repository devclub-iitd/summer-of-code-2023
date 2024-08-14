import '../core/utils/image_constant.dart';
import '../core/utils/size_utils.dart';
import '../theme/custom_text_style.dart';
import '../theme/theme_helper.dart';
import 'custom_image_view.dart';
import 'package:flutter/material.dart';

class CustomIconButton extends StatelessWidget {
  CustomIconButton({
    Key? key,
    this.alignment,
    this.margin,
    this.width,
    this.height,
    this.padding,
    this.decoration,
    this.child,
    this.onTap,
  }) : super(
          key: key,
        );

  final Alignment? alignment;

  final EdgeInsetsGeometry? margin;

  final double? width;

  final double? height;

  final EdgeInsetsGeometry? padding;

  final BoxDecoration? decoration;

  final Widget? child;

  final VoidCallback? onTap;

  @override
  Widget build(BuildContext context) {
    return alignment != null
        ? Align(
            alignment: alignment ?? Alignment.center,
            child: iconButtonWidget,
          )
        : iconButtonWidget;
  }

  Widget get iconButtonWidget => Padding(
        padding: margin ?? EdgeInsets.zero,
        child: IconButton(
          visualDensity: VisualDensity(
            vertical: -4,
            horizontal: -4,
          ),
          iconSize: getSize(height ?? 0),
          padding: EdgeInsets.all(0),
          icon: Container(
            alignment: Alignment.center,
            width: getSize(width ?? 0),
            height: getSize(height ?? 0),
            padding: padding ?? EdgeInsets.zero,
            decoration: decoration ??
                BoxDecoration(
                  color: theme.colorScheme.onPrimary.withOpacity(1),
                  borderRadius: BorderRadius.circular(
                    getHorizontalSize(
                      18.00,
                    ),
                  ),
                  boxShadow: [
                    BoxShadow(
                      color: appTheme.black900.withOpacity(0.08),
                      spreadRadius: getHorizontalSize(
                        2.00,
                      ),
                      blurRadius: getHorizontalSize(
                        2.00,
                      ),
                      offset: Offset(
                        0,
                        4,
                      ),
                    ),
                  ],
                ),
            child: child,
          ),
          onPressed: onTap,
        ),
      );
}

/// Extension on [CustomIconButton] to facilitate inclusion of all types of border style etc
extension IconButtonStyleHelper on CustomIconButton {
  static BoxDecoration get outlineBlack900 => BoxDecoration(
        color: theme.colorScheme.onPrimary.withOpacity(1),
        borderRadius: BorderRadius.circular(
          getHorizontalSize(
            24.00,
          ),
        ),
        boxShadow: [
          BoxShadow(
            color: appTheme.black900.withOpacity(0.05),
            spreadRadius: getHorizontalSize(
              2.00,
            ),
            blurRadius: getHorizontalSize(
              2.00,
            ),
            offset: Offset(
              0,
              1,
            ),
          ),
        ],
      );
  static BoxDecoration get outlineBlack900TL181 => BoxDecoration(
        color: theme.colorScheme.onPrimary.withOpacity(1),
        borderRadius: BorderRadius.circular(
          getHorizontalSize(
            18.00,
          ),
        ),
        boxShadow: [
          BoxShadow(
            color: appTheme.black900.withOpacity(0.1),
            spreadRadius: getHorizontalSize(
              2.00,
            ),
            blurRadius: getHorizontalSize(
              2.00,
            ),
            offset: Offset(
              0,
              4,
            ),
          ),
        ],
      );
  static BoxDecoration get fillPrimary => BoxDecoration(
        color: theme.colorScheme.primary,
        borderRadius: BorderRadius.circular(
          getHorizontalSize(
            4.00,
          ),
        ),
      );
  static BoxDecoration get fillPrimaryTL26 => BoxDecoration(
        color: theme.colorScheme.primary,
        borderRadius: BorderRadius.circular(
          getHorizontalSize(
            26.00,
          ),
        ),
      );
  static BoxDecoration get outlinePrimary => BoxDecoration(
        color: theme.colorScheme.primary,
        borderRadius: BorderRadius.circular(
          getHorizontalSize(
            18.00,
          ),
        ),
        boxShadow: [
          BoxShadow(
            color: theme.colorScheme.primary.withOpacity(0.16),
            spreadRadius: getHorizontalSize(
              2.00,
            ),
            blurRadius: getHorizontalSize(
              2.00,
            ),
            offset: Offset(
              0,
              4,
            ),
          ),
        ],
      );
}
