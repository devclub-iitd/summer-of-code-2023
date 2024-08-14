import 'package:flutter/material.dart';
import 'package:my_app/theme/theme_helper.dart';

import '../core/utils/size_utils.dart';

class AppDecoration {
  static BoxDecoration get fill => BoxDecoration(
        color: theme.colorScheme.onPrimary.withOpacity(1),
      );
  static BoxDecoration get gradientnameblack900namegray90001 => BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment(
            0.5,
            0,
          ),
          end: Alignment(
            0.5,
            1,
          ),
          colors: [
            appTheme.black900,
            appTheme.gray90001,
          ],
        ),
      );
  static BoxDecoration get gradientnameblack900opacity0nameblack900opacity0 =>
      BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment(
            0.5,
            0.11,
          ),
          end: Alignment(
            0.5,
            1,
          ),
          colors: [
            appTheme.black900.withOpacity(0),
            appTheme.black900.withOpacity(0.38),
            appTheme.black900.withOpacity(0),
          ],
        ),
      );
  static BoxDecoration
      get gradientnameonPrimaryopacity022nameonPrimaryopacity1 => BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment(
                0.5,
                0,
              ),
              end: Alignment(
                0.5,
                1,
              ),
              colors: [
                theme.colorScheme.onPrimary.withOpacity(0.22),
                theme.colorScheme.onPrimary.withOpacity(1),
              ],
            ),
          );
  static BoxDecoration get txtFill1 => BoxDecoration(
        color: theme.colorScheme.primary,
      );
  static BoxDecoration get gradientnameblack900opacity073nameblack900opacity0 =>
      BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment(
            0.54,
            1,
          ),
          end: Alignment(
            0.53,
            0,
          ),
          colors: [
            appTheme.black900.withOpacity(0.73),
            appTheme.black900.withOpacity(0),
          ],
        ),
      );
  static BoxDecoration get txtFill => BoxDecoration(
        color: appTheme.gray900,
      );
  static BoxDecoration get txtBackground => BoxDecoration(
        color: appTheme.gray50,
      );
  static BoxDecoration get outline10 => BoxDecoration(
        border: Border.all(
          color: appTheme.gray900,
          width: getHorizontalSize(
            1,
          ),
        ),
      );
  static BoxDecoration get background => BoxDecoration(
        color: appTheme.gray50,
      );
  static BoxDecoration get outline => BoxDecoration(
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
      );
  static BoxDecoration get white => BoxDecoration(
        color: theme.colorScheme.onPrimary.withOpacity(1),
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
              1,
            ),
          ),
        ],
      );
  static BoxDecoration get outline2 => BoxDecoration(
        color: appTheme.gray50,
        boxShadow: [
          BoxShadow(
            color: appTheme.black900.withOpacity(0.1),
            spreadRadius: getHorizontalSize(
              2,
            ),
            blurRadius: getHorizontalSize(
              2,
            ),
            offset: Offset(
              0,
              -4,
            ),
          ),
        ],
      );
  static BoxDecoration get outline1 => BoxDecoration(
        color: theme.colorScheme.onPrimary.withOpacity(1),
        boxShadow: [
          BoxShadow(
            color: appTheme.black900.withOpacity(0.12),
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
      );
  static BoxDecoration get outline4 => BoxDecoration(
        color: theme.colorScheme.onPrimary.withOpacity(1),
        boxShadow: [
          BoxShadow(
            color: appTheme.black900.withOpacity(0.05),
            spreadRadius: getHorizontalSize(
              2,
            ),
            blurRadius: getHorizontalSize(
              2,
            ),
            offset: Offset(
              0,
              1,
            ),
          ),
        ],
      );
  static BoxDecoration get gradientnamered900nameredA700 => BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment(
            0.5,
            0,
          ),
          end: Alignment(
            0.5,
            1,
          ),
          colors: [
            appTheme.red900,
            appTheme.redA700,
          ],
        ),
      );
  static BoxDecoration get outline3 => BoxDecoration(
        color: theme.colorScheme.onPrimary.withOpacity(0.42),
        boxShadow: [
          BoxShadow(
            color: appTheme.black900.withOpacity(0.16),
            spreadRadius: getHorizontalSize(
              2,
            ),
            blurRadius: getHorizontalSize(
              2,
            ),
            offset: Offset(
              0,
              1,
            ),
          ),
        ],
      );
  static BoxDecoration get txtWhite => BoxDecoration(
        color: theme.colorScheme.onPrimary.withOpacity(1),
        border: Border.all(
          color: appTheme.gray500,
          width: getHorizontalSize(
            1,
          ),
        ),
      );
  static BoxDecoration get fill1 => BoxDecoration(
        color: theme.colorScheme.onPrimary,
      );
  static BoxDecoration get gradientnameblack900opacity073namegray40000 =>
      BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment(
            0.54,
            1,
          ),
          end: Alignment(
            0.53,
            0,
          ),
          colors: [
            appTheme.black900.withOpacity(0.73),
            appTheme.gray40000,
          ],
        ),
      );
  static BoxDecoration get outline6 => BoxDecoration(
        color: theme.colorScheme.onPrimary.withOpacity(1),
        boxShadow: [
          BoxShadow(
            color: appTheme.black900.withOpacity(0.12),
            spreadRadius: getHorizontalSize(
              2,
            ),
            blurRadius: getHorizontalSize(
              2,
            ),
            offset: Offset(
              0,
              1,
            ),
          ),
        ],
      );
  static BoxDecoration get outline5 => BoxDecoration(
        color: theme.colorScheme.onPrimary.withOpacity(1),
        boxShadow: [
          BoxShadow(
            color: appTheme.black900.withOpacity(0.14),
            spreadRadius: getHorizontalSize(
              2,
            ),
            blurRadius: getHorizontalSize(
              2,
            ),
            offset: Offset(
              0,
              1,
            ),
          ),
        ],
      );
  static BoxDecoration get outline8 => BoxDecoration(
        color: appTheme.gray900,
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
              1,
            ),
          ),
        ],
      );
  static BoxDecoration get fill2 => BoxDecoration(
        color: theme.colorScheme.onPrimary.withOpacity(0.6),
      );
  static BoxDecoration get outline7 => BoxDecoration(
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
              1,
            ),
          ),
        ],
      );
  static BoxDecoration get outline9 => BoxDecoration(
        color: appTheme.gray500,
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
              1,
            ),
          ),
        ],
      );
}

class BorderRadiusStyle {
  static BorderRadius txtCircleBorder15 = BorderRadius.circular(
    getHorizontalSize(
      15,
    ),
  );

  static BorderRadius customBorderTL12 = BorderRadius.only(
    topLeft: Radius.circular(
      getHorizontalSize(
        12,
      ),
    ),
    topRight: Radius.circular(
      getHorizontalSize(
        12,
      ),
    ),
  );

  static BorderRadius customBorderTL34 = BorderRadius.only(
    topLeft: Radius.circular(
      getHorizontalSize(
        34,
      ),
    ),
    topRight: Radius.circular(
      getHorizontalSize(
        34,
      ),
    ),
  );

  static BorderRadius customBorderTL8 = BorderRadius.only(
    topLeft: Radius.circular(
      getHorizontalSize(
        8,
      ),
    ),
    bottomLeft: Radius.circular(
      getHorizontalSize(
        8,
      ),
    ),
  );

  static BorderRadius circleBorder26 = BorderRadius.circular(
    getHorizontalSize(
      26,
    ),
  );

  static BorderRadius circleBorder16 = BorderRadius.circular(
    getHorizontalSize(
      16,
    ),
  );

  static BorderRadius txtCustomBorderTL8 = BorderRadius.only(
    topLeft: Radius.circular(
      getHorizontalSize(
        8,
      ),
    ),
    bottomLeft: Radius.circular(
      getHorizontalSize(
        8,
      ),
    ),
  );

  static BorderRadius roundedBorder8 = BorderRadius.circular(
    getHorizontalSize(
      8,
    ),
  );

  static BorderRadius circleBorder12 = BorderRadius.circular(
    getHorizontalSize(
      12,
    ),
  );

  static BorderRadius roundedBorder4 = BorderRadius.circular(
    getHorizontalSize(
      4,
    ),
  );

  static BorderRadius circleBorder32 = BorderRadius.circular(
    getHorizontalSize(
      32,
    ),
  );

  static BorderRadius customBorderBL8 = BorderRadius.only(
    bottomLeft: Radius.circular(
      getHorizontalSize(
        8,
      ),
    ),
    bottomRight: Radius.circular(
      getHorizontalSize(
        8,
      ),
    ),
  );

  static BorderRadius txtRoundedBorder8 = BorderRadius.circular(
    getHorizontalSize(
      8,
    ),
  );

  static BorderRadius customBorderLR8 = BorderRadius.only(
    topRight: Radius.circular(
      getHorizontalSize(
        8,
      ),
    ),
    bottomRight: Radius.circular(
      getHorizontalSize(
        8,
      ),
    ),
  );

  static BorderRadius txtCircleBorder12 = BorderRadius.circular(
    getHorizontalSize(
      12,
    ),
  );
}

// Comment/Uncomment the below code based on your Flutter SDK version.

// For Flutter SDK Version 3.7.2 or greater.

double get strokeAlignInside => BorderSide.strokeAlignInside;

double get strokeAlignCenter => BorderSide.strokeAlignCenter;

double get strokeAlignOutside => BorderSide.strokeAlignOutside;

// For Flutter SDK Version 3.7.1 or less.

// StrokeAlign get strokeAlignInside => StrokeAlign.inside;
//
// StrokeAlign get strokeAlignCenter => StrokeAlign.center;
//
// StrokeAlign get strokeAlignOutside => StrokeAlign.outside;
    