import 'package:flutter/material.dart';
import 'package:my_app/theme/app_decoration.dart';

import '../core/utils/image_constant.dart';
import '../core/utils/size_utils.dart';
import '../theme/custom_text_style.dart';
import '../theme/theme_helper.dart';
import 'custom_icon_button.dart';
import 'custom_image_view.dart';

// ignore: must_be_immutable
class ProductCardItemWidget extends StatelessWidget {
  const ProductCardItemWidget({Key? key})
      : super(
          key: key,
        );

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: getHorizontalSize(
        149,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          SizedBox(
            height: getVerticalSize(
              205,
            ),
            width: getHorizontalSize(
              149,
            ),
            child: Stack(
              alignment: Alignment.bottomLeft,
              children: [
                Align(
                  alignment: Alignment.topCenter,
                  child: SizedBox(
                    height: getVerticalSize(
                      184,
                    ),
                    width: getHorizontalSize(
                      148,
                    ),
                    child: Stack(
                      alignment: Alignment.topLeft,
                      children: [
                        CustomImageView(
                          imagePath: ImageConstant.imgImage2184x148,
                          height: getVerticalSize(
                            184,
                          ),
                          width: getHorizontalSize(
                            148,
                          ),
                          radius: BorderRadius.circular(
                            getHorizontalSize(
                              8,
                            ),
                          ),
                          alignment: Alignment.center,
                        ),
                        Align(
                          alignment: Alignment.topLeft,
                          child: Container(
                            width: getHorizontalSize(
                              40,
                            ),
                            margin: getMargin(
                              left: 9,
                              top: 8,
                            ),
                            padding: getPadding(
                              left: 5,
                              top: 6,
                              right: 5,
                              bottom: 6,
                            ),
                            decoration: AppDecoration.txtFill1.copyWith(
                              borderRadius: BorderRadiusStyle.txtCircleBorder12,
                            ),
                            child: Text(
                              "",
                              overflow: TextOverflow.ellipsis,
                              textAlign: TextAlign.left,
                              style: theme.textTheme.labelMedium,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                Align(
                  alignment: Alignment.bottomLeft,
                  child: Row(
                    children: [
                      CustomImageView(
                        svgPath: ImageConstant.imgStarOrange300,
                        height: getSize(
                          14,
                        ),
                        width: getSize(
                          14,
                        ),
                      ),
                      CustomImageView(
                        svgPath: ImageConstant.imgStarOrange300,
                        height: getSize(
                          14,
                        ),
                        width: getSize(
                          14,
                        ),
                        margin: getMargin(
                          left: 1,
                        ),
                      ),
                      CustomImageView(
                        svgPath: ImageConstant.imgStarOrange300,
                        height: getSize(
                          14,
                        ),
                        width: getSize(
                          14,
                        ),
                        margin: getMargin(
                          left: 1,
                        ),
                      ),
                      CustomImageView(
                        svgPath: ImageConstant.imgStarOrange300,
                        height: getSize(
                          14,
                        ),
                        width: getSize(
                          14,
                        ),
                        margin: getMargin(
                          left: 1,
                        ),
                      ),
                      CustomImageView(
                        svgPath: ImageConstant.imgStarOrange300,
                        height: getSize(
                          14,
                        ),
                        width: getSize(
                          14,
                        ),
                        margin: getMargin(
                          left: 1,
                        ),
                      ),
                      Padding(
                        padding: getPadding(
                          left: 2,
                          top: 3,
                        ),
                        child: Text(
                          "",
                          overflow: TextOverflow.ellipsis,
                          textAlign: TextAlign.left,
                          style: CustomTextStyles.bodySmall10,
                        ),
                      ),
                    ],
                  ),
                ),
                CustomIconButton(
                  height: 36,
                  width: 36,
                  margin: getMargin(
                    bottom: 5,
                  ),
                  padding: getPadding(
                    all: 6,
                  ),
                  alignment: Alignment.bottomRight,
                  child: CustomImageView(
                    svgPath: ImageConstant.imgIcon,
                  ),
                ),
              ],
            ),
          ),
          Padding(
            padding: getPadding(
              left: 1,
              top: 6,
            ),
            child: Text(
              "",
              overflow: TextOverflow.ellipsis,
              textAlign: TextAlign.left,
              style: theme.textTheme.bodySmall,
            ),
          ),
          Padding(
            padding: getPadding(
              left: 1,
              top: 4,
            ),
            child: Text(
              "",
              overflow: TextOverflow.ellipsis,
              textAlign: TextAlign.left,
              style: theme.textTheme.titleMedium,
            ),
          ),
          Padding(
            padding: getPadding(
              left: 2,
              top: 4,
            ),
            child: Row(
              children: [
                SizedBox(
                  height: getVerticalSize(
                    14,
                  ),
                  width: getHorizontalSize(
                    23,
                  ),
                  child: Stack(
                    alignment: Alignment.center,
                    children: [
                      Align(
                        alignment: Alignment.center,
                        child: Container(
                          height: getVerticalSize(
                            1,
                          ),
                          width: getHorizontalSize(
                            23,
                          ),
                          decoration: BoxDecoration(
                            color: appTheme.gray500,
                          ),
                        ),
                      ),
                      Align(
                        alignment: Alignment.center,
                        child: Text(
                          "",
                          overflow: TextOverflow.ellipsis,
                          textAlign: TextAlign.left,
                          style: CustomTextStyles.titleSmallGray500,
                        ),
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: getPadding(
                    left: 4,
                  ),
                  child: Text(
                    "",
                    overflow: TextOverflow.ellipsis,
                    textAlign: TextAlign.left,
                    style: CustomTextStyles.titleSmallPrimary,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
