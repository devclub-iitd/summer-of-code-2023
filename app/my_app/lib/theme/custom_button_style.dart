import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:my_app/theme/theme_helper.dart';

/// A class that offers pre-defined button styles for customizing button appearance.
class CustomButtonStyles {
  // Filled button style
  static ButtonStyle get fillGray900 => ElevatedButton.styleFrom(
        backgroundColor: appTheme.gray900,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(
            12,
          ),
        ),
      );
  static ButtonStyle get fillGray900TL8 => ElevatedButton.styleFrom(
        backgroundColor: appTheme.gray900,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(
              8,
            ),
            topRight: Radius.circular(
              0,
            ),
            bottomLeft: Radius.circular(
              8,
            ),
            bottomRight: Radius.circular(
              0,
            ),
          ),
        ),
      );
  static ButtonStyle get fillPrimary => ElevatedButton.styleFrom(
        backgroundColor: theme.colorScheme.primary,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(
            12,
          ),
        ),
      );
  // Outline button style
  static ButtonStyle get outlineGray500 => OutlinedButton.styleFrom(
        backgroundColor: theme.colorScheme.onPrimary.withOpacity(1),
        side: BorderSide(
          color: appTheme.gray500,
          width: 1,
        ),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(
            8,
          ),
        ),
      );
  static ButtonStyle get outlineGray900 => OutlinedButton.styleFrom(
        backgroundColor: Colors.transparent,
        side: BorderSide(
          color: appTheme.gray900,
          width: 1,
        ),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(
            18,
          ),
        ),
      );
  static ButtonStyle get outlineOnPrimary => OutlinedButton.styleFrom(
        backgroundColor: Colors.transparent,
        side: BorderSide(
          color: theme.colorScheme.onPrimary.withOpacity(1),
          width: 1,
        ),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(
            24,
          ),
        ),
      );
  static ButtonStyle get outlineRed8003f => ElevatedButton.styleFrom(
        backgroundColor: theme.colorScheme.primary,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(
            24,
          ),
        ),
        shadowColor: appTheme.red8003f,
        elevation: 4,
      );
  static ButtonStyle get outlineRed8003fTL18 => ElevatedButton.styleFrom(
        backgroundColor: theme.colorScheme.primary,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(
            18,
          ),
        ),
        shadowColor: appTheme.red8003f,
        elevation: 4,
      );
  // text button style
  static ButtonStyle get none => ButtonStyle(
        backgroundColor: MaterialStateProperty.all<Color>(Colors.transparent),
        elevation: MaterialStateProperty.all<double>(0),
      );
}
