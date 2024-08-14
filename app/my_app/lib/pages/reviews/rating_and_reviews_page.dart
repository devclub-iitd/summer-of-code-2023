import 'package:google_fonts/google_fonts.dart';
import 'package:my_app/pages/reviews/rating_and_reviews_with_photo_page.dart';
import 'package:my_app/pages/searchPage.dart';
import 'package:my_app/widgets/app_bar/custom_app_bar.dart';

import 'package:flutter/material.dart';

import '../../core/utils/image_constant.dart';
import '../../core/utils/size_utils.dart';
import '../../theme/app_decoration.dart';
import '../../theme/custom_button_style.dart';
import '../../theme/custom_text_style.dart';
import '../../theme/theme_helper.dart';
import '../../widgets/app_bar/appbar_image.dart';
import '../../widgets/app_bar/appbar_subtitle.dart';
import '../../widgets/custom_bottom_bar.dart';
import '../../widgets/custom_checkbox_button.dart';
import '../../widgets/custom_elevated_button.dart';
import '../../widgets/custom_image_view.dart';

import 'package:flutter/material.dart';

// ignore_for_file: must_be_immutable
class RatingAndReviewsPage extends StatefulWidget {
  const RatingAndReviewsPage({Key? key})
      : super(
          key: key,
        );

  @override
  RatingAndReviewsPageState createState() => RatingAndReviewsPageState();
}

class RatingAndReviewsPageState extends State<RatingAndReviewsPage>
    with AutomaticKeepAliveClientMixin<RatingAndReviewsPage> {
  @override
  bool get wantKeepAlive => true;
  @override
  Widget build(BuildContext context) {
    mediaQueryData = MediaQuery.of(context);

    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.transparent,
        body: SizedBox(
          width: mediaQueryData.size.width,
          child: SingleChildScrollView(
            child: Padding(
              padding: getPadding(
                top: 122,
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Padding(
                        padding: getPadding(
                          right: 52,
                        ),
                        child: Text(
                          "June 5, 2019",
                          overflow: TextOverflow.ellipsis,
                          textAlign: TextAlign.left,
                          style: theme.textTheme.bodySmall,
                        ),
                      ),
                      Align(
                        alignment: Alignment.center,
                        child: Opacity(
                          opacity: 0.8,
                          child: Container(
                            width: getHorizontalSize(
                              267,
                            ),
                            margin: getMargin(
                              left: 56,
                              top: 12,
                              right: 52,
                            ),
                            child: Text(
                              "The dress is great! Very classy and comfortable. It fit perfectly! I'm 5'7\" and 130 pounds. I am a 34B chest. This dress would be too long for those who are shorter but could be hemmed. I wouldn't recommend it for those big chested as I am smaller chested and it fit me perfectly. The underarms were not too wide and the dress was made well.",
                              maxLines: 9,
                              overflow: TextOverflow.ellipsis,
                              textAlign: TextAlign.left,
                              style: CustomTextStyles.bodyMediumGray900_1,
                            ),
                          ),
                        ),
                      ),
                      Padding(
                        padding: getPadding(
                          top: 8,
                          right: 42,
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            Padding(
                              padding: getPadding(
                                top: 10,
                              ),
                              child: Text(
                                "Helpful",
                                overflow: TextOverflow.ellipsis,
                                textAlign: TextAlign.left,
                                style: theme.textTheme.bodySmall,
                              ),
                            ),
                            CustomImageView(
                              svgPath: ImageConstant.imgIconGray500,
                              height: getVerticalSize(
                                22,
                              ),
                              width: getHorizontalSize(
                                24,
                              ),
                              margin: getMargin(
                                left: 3,
                              ),
                            ),
                          ],
                        ),
                      ),
                      Container(
                        width: double.maxFinite,
                        padding: getPadding(
                          left: 17,
                          top: 10,
                          right: 17,
                          bottom: 10,
                        ),
                        decoration: AppDecoration
                            .gradientnameonPrimaryopacity022nameonPrimaryopacity1,
                        child: CustomElevatedButton(
                          text: "Write a review",
                          margin: getMargin(
                            top: 65,
                          ),
                          leftIcon: Container(
                            margin: getMargin(
                              right: 4,
                            ),
                            child: CustomImageView(
                              svgPath: ImageConstant.imgIconOnprimary,
                            ),
                          ),
                          buttonStyle: CustomButtonStyles.outlineRed8003fTL18
                              .copyWith(
                                  fixedSize:
                                      MaterialStateProperty.all<Size>(Size(
                            getHorizontalSize(
                              128,
                            ),
                            getVerticalSize(
                              36,
                            ),
                          ))),
                          buttonTextStyle: theme.textTheme.labelMedium!,
                        ),
                      ),
                      Align(
                        alignment: Alignment.centerLeft,
                        child: Container(
                          height: getVerticalSize(
                            340,
                          ),
                          width: getHorizontalSize(
                            327,
                          ),
                          margin: getMargin(
                            left: 16,
                          ),
                          child: Stack(
                            alignment: Alignment.topLeft,
                            children: [
                              Align(
                                alignment: Alignment.center,
                                child: Container(
                                  margin: getMargin(
                                    left: 16,
                                  ),
                                  padding: getPadding(
                                    left: 10,
                                    top: 19,
                                    right: 10,
                                    bottom: 19,
                                  ),
                                  decoration: AppDecoration.outline4.copyWith(
                                    borderRadius:
                                        BorderRadiusStyle.roundedBorder8,
                                  ),
                                  child: Column(
                                    mainAxisSize: MainAxisSize.min,
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    children: [
                                      Align(
                                        alignment: Alignment.centerLeft,
                                        child: Padding(
                                          padding: getPadding(
                                            left: 14,
                                          ),
                                          child: Text(
                                            "Kate Doe",
                                            overflow: TextOverflow.ellipsis,
                                            textAlign: TextAlign.left,
                                            style: CustomTextStyles
                                                .titleSmallSemiBold,
                                          ),
                                        ),
                                      ),
                                      Padding(
                                        padding: getPadding(
                                          left: 13,
                                          top: 5,
                                        ),
                                        child: Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.center,
                                          children: [
                                            Container(
                                              width: getHorizontalSize(
                                                74,
                                              ),
                                              margin: getMargin(
                                                bottom: 1,
                                              ),
                                              child: Row(
                                                mainAxisAlignment:
                                                    MainAxisAlignment.center,
                                                children: [
                                                  CustomImageView(
                                                    svgPath: ImageConstant
                                                        .imgStarOrange300,
                                                    height: getSize(
                                                      14,
                                                    ),
                                                    width: getSize(
                                                      14,
                                                    ),
                                                  ),
                                                  CustomImageView(
                                                    svgPath: ImageConstant
                                                        .imgStarOrange300,
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
                                                    svgPath: ImageConstant
                                                        .imgStarOrange300,
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
                                                    svgPath: ImageConstant
                                                        .imgStarOrange300,
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
                                                    svgPath:
                                                        ImageConstant.imgStar,
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
                                                ],
                                              ),
                                            ),
                                            Padding(
                                              padding: getPadding(
                                                top: 4,
                                              ),
                                              child: Text(
                                                "June 5, 2019",
                                                overflow: TextOverflow.ellipsis,
                                                textAlign: TextAlign.left,
                                                style:
                                                    theme.textTheme.bodySmall,
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                      Opacity(
                                        opacity: 0.8,
                                        child: Container(
                                          width: getHorizontalSize(
                                            267,
                                          ),
                                          margin: getMargin(
                                            left: 14,
                                            top: 12,
                                            right: 10,
                                          ),
                                          child: Text(
                                            "The dress is great! Very classy and comfortable. It fit perfectly! I'm 5'7\" and 130 pounds. I am a 34B chest. This dress would be too long for those who are shorter but could be hemmed. I wouldn't recommend it for those big chested as I am smaller chested and it fit me perfectly. The underarms were not too wide and the dress was made well. Plus, I love the pockets! ",
                                            maxLines: 2,
                                            overflow: TextOverflow.ellipsis,
                                            textAlign: TextAlign.left,
                                            style: CustomTextStyles
                                                .bodyMediumGray900_1,
                                          ),
                                        ),
                                      ),
                                      Align(
                                        alignment: Alignment.centerRight,
                                        child: Padding(
                                          padding: getPadding(
                                            top: 176,
                                          ),
                                          child: Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.end,
                                            children: [
                                              Padding(
                                                padding: getPadding(
                                                  top: 8,
                                                ),
                                                child: Text(
                                                  "Helpful",
                                                  overflow:
                                                      TextOverflow.ellipsis,
                                                  textAlign: TextAlign.left,
                                                  style:
                                                      theme.textTheme.bodySmall,
                                                ),
                                              ),
                                              Container(
                                                height: getVerticalSize(
                                                  22,
                                                ),
                                                width: getHorizontalSize(
                                                  24,
                                                ),
                                                margin: getMargin(
                                                  left: 3,
                                                ),
                                                padding: getPadding(
                                                  left: 5,
                                                  top: 3,
                                                  right: 5,
                                                  bottom: 3,
                                                ),
                                                decoration: AppDecoration.fill,
                                                child: Stack(
                                                  children: [
                                                    CustomImageView(
                                                      svgPath: ImageConstant
                                                          .imgVolume,
                                                      height: getSize(
                                                        13,
                                                      ),
                                                      width: getSize(
                                                        13,
                                                      ),
                                                      alignment:
                                                          Alignment.bottomRight,
                                                    ),
                                                  ],
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                              CustomImageView(
                                imagePath: ImageConstant.imgBag,
                                height: getSize(
                                  32,
                                ),
                                width: getSize(
                                  32,
                                ),
                                alignment: Alignment.topLeft,
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
