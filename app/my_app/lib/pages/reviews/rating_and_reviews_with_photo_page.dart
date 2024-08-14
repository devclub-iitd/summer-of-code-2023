import 'package:google_fonts/google_fonts.dart';
import 'package:my_app/pages/reviews/photos_item_widget.dart';
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
import 'package:flutter_rating_bar/flutter_rating_bar.dart';

// ignore_for_file: must_be_immutable
class RatingAndReviewsWithPhotoPage extends StatefulWidget {
  const RatingAndReviewsWithPhotoPage({Key? key})
      : super(
          key: key,
        );

  @override
  RatingAndReviewsWithPhotoPageState createState() =>
      RatingAndReviewsWithPhotoPageState();
}

class RatingAndReviewsWithPhotoPageState
    extends State<RatingAndReviewsWithPhotoPage>
    with AutomaticKeepAliveClientMixin<RatingAndReviewsWithPhotoPage> {
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
                top: 162,
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Expanded(
                    child: SizedBox(
                      width: double.maxFinite,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.end,
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Padding(
                            padding: getPadding(
                              right: 50,
                            ),
                            child: Text(
                              "August 13, 2019",
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
                                  260,
                                ),
                                margin: getMargin(
                                  top: 11,
                                ),
                                child: Text(
                                  "I loved this dress so much as soon as I tried it on I knew I had to buy it in another color. I am 5'3 about 155lbs and I carry all my weight in my upper body. When I put it on I felt like it thinned me put and I got so many compliments.",
                                  maxLines: 6,
                                  overflow: TextOverflow.ellipsis,
                                  textAlign: TextAlign.left,
                                  style: CustomTextStyles.bodyMediumGray900_1,
                                ),
                              ),
                            ),
                          ),
                          Expanded(
                            child: Container(
                              decoration: AppDecoration.fill,
                              margin: getMargin(
                                left: 54,
                                top: 13,
                                right: 32,
                              ),
                              child: GridView.builder(
                                shrinkWrap: true,
                                gridDelegate:
                                    SliverGridDelegateWithFixedCrossAxisCount(
                                  mainAxisExtent: getVerticalSize(
                                    105,
                                  ),
                                  crossAxisCount: 3,
                                  mainAxisSpacing: getHorizontalSize(
                                    16,
                                  ),
                                  crossAxisSpacing: getHorizontalSize(
                                    16,
                                  ),
                                ),
                                physics: BouncingScrollPhysics(),
                                itemCount: 3,
                                itemBuilder: (context, index) {
                                  return PhotosItemWidget();
                                },
                              ),
                            ),
                          ),
                          Padding(
                            padding: getPadding(
                              top: 10,
                              right: 42,
                            ),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.end,
                              children: [
                                Padding(
                                  padding: getPadding(
                                    top: 10,
                                    bottom: 1,
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
                          Align(
                            alignment: Alignment.centerLeft,
                            child: Container(
                              height: getVerticalSize(
                                368,
                              ),
                              width: getHorizontalSize(
                                327,
                              ),
                              margin: getMargin(
                                left: 16,
                                top: 31,
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
                                        top: 9,
                                        right: 10,
                                        bottom: 9,
                                      ),
                                      decoration:
                                          AppDecoration.outline5.copyWith(
                                        borderRadius:
                                            BorderRadiusStyle.roundedBorder8,
                                      ),
                                      child: Column(
                                        mainAxisSize: MainAxisSize.min,
                                        mainAxisAlignment:
                                            MainAxisAlignment.end,
                                        children: [
                                          Align(
                                            alignment: Alignment.centerLeft,
                                            child: Padding(
                                              padding: getPadding(
                                                left: 14,
                                                top: 10,
                                              ),
                                              child: Text(
                                                "Matilda Brown",
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
                                              top: 6,
                                            ),
                                            child: Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment.center,
                                              children: [
                                                Padding(
                                                  padding: getPadding(
                                                    bottom: 1,
                                                  ),
                                                  child: RatingBar.builder(
                                                    initialRating: 0,
                                                    minRating: 0,
                                                    direction: Axis.horizontal,
                                                    allowHalfRating: false,
                                                    itemSize: getVerticalSize(
                                                      14,
                                                    ),
                                                    itemCount: 5,
                                                    updateOnDrag: true,
                                                    onRatingUpdate: (rating) {},
                                                    itemBuilder: (
                                                      context,
                                                      _,
                                                    ) {
                                                      return Icon(
                                                        Icons.star,
                                                      );
                                                    },
                                                  ),
                                                ),
                                                Padding(
                                                  padding: getPadding(
                                                    top: 4,
                                                  ),
                                                  child: Text(
                                                    "August 14, 2019",
                                                    overflow:
                                                        TextOverflow.ellipsis,
                                                    textAlign: TextAlign.left,
                                                    style: theme
                                                        .textTheme.bodySmall,
                                                  ),
                                                ),
                                              ],
                                            ),
                                          ),
                                          Opacity(
                                            opacity: 0.8,
                                            child: Container(
                                              width: getHorizontalSize(
                                                260,
                                              ),
                                              margin: getMargin(
                                                left: 14,
                                                top: 12,
                                                right: 17,
                                              ),
                                              child: Text(
                                                "I loved this dress so much as soon as I tried it on I knew I had to buy it in another color. I am 5'3 about 155lbs and I carry all my weight in my upper body. When I put it on I felt like it thinned me put and I got so many compliments.",
                                                maxLines: 6,
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
                                                top: 130,
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
                                                      style: theme
                                                          .textTheme.bodySmall,
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
                                                    decoration:
                                                        AppDecoration.fill,
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
                                                          alignment: Alignment
                                                              .bottomRight,
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
                                  Align(
                                    alignment: Alignment.topLeft,
                                    child: SizedBox(
                                      height: getSize(
                                        32,
                                      ),
                                      width: getSize(
                                        32,
                                      ),
                                      child: Stack(
                                        alignment: Alignment.center,
                                        children: [
                                          CustomImageView(
                                            imagePath:
                                                ImageConstant.imgImage32x32,
                                            height: getSize(
                                              32,
                                            ),
                                            width: getSize(
                                              32,
                                            ),
                                            radius: BorderRadius.circular(
                                              getHorizontalSize(
                                                16,
                                              ),
                                            ),
                                            alignment: Alignment.center,
                                          ),
                                          CustomImageView(
                                            imagePath:
                                                ImageConstant.imgImage232x32,
                                            height: getSize(
                                              32,
                                            ),
                                            width: getSize(
                                              32,
                                            ),
                                            radius: BorderRadius.circular(
                                              getHorizontalSize(
                                                16,
                                              ),
                                            ),
                                            alignment: Alignment.center,
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                ],
                              ),
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
                                top: 79,
                              ),
                              leftIcon: Container(
                                margin: getMargin(
                                  right: 4,
                                ),
                                child: CustomImageView(
                                  svgPath: ImageConstant.imgIconOnprimary,
                                ),
                              ),
                              buttonStyle: CustomButtonStyles
                                  .outlineRed8003fTL18
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
                        ],
                      ),
                    ),
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
