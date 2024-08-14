import 'package:google_fonts/google_fonts.dart';
import 'package:my_app/pages/reviews/rating_and_reviews_with_photo_page.dart';
import 'package:my_app/pages/searchPage.dart';
import 'package:my_app/widgets/app_bar/custom_app_bar.dart';

import 'package:flutter/material.dart';

import '../../core/utils/image_constant.dart';
import '../../core/utils/size_utils.dart';
import '../../theme/app_decoration.dart';
import '../../theme/custom_text_style.dart';
import '../../theme/theme_helper.dart';
import '../../widgets/app_bar/appbar_image.dart';
import '../../widgets/app_bar/appbar_subtitle.dart';
import '../../widgets/custom_bottom_bar.dart';
import '../../widgets/custom_checkbox_button.dart';
import '../../widgets/custom_image_view.dart';

class RatingAndReviewsWithPhotoTabContainerScreen extends StatefulWidget {
  const RatingAndReviewsWithPhotoTabContainerScreen({Key? key})
      : super(key: key);

  @override
  RatingAndReviewsWithPhotoTabContainerScreenState createState() =>
      RatingAndReviewsWithPhotoTabContainerScreenState();
}

// ignore_for_file: must_be_immutable
class RatingAndReviewsWithPhotoTabContainerScreenState
    extends State<RatingAndReviewsWithPhotoTabContainerScreen>
    with TickerProviderStateMixin {
  GlobalKey<NavigatorState> navigatorKey = GlobalKey();

  bool isCheckbox = false;

  late TabController tabviewController;

  @override
  void initState() {
    super.initState();
    tabviewController = TabController(length: 5, vsync: this);
  }

  @override
  Widget build(BuildContext context) {
    mediaQueryData = MediaQuery.of(context);
    return SafeArea(
        child: Scaffold(
      backgroundColor: appTheme.gray50,
      body: SizedBox(
          width: double.maxFinite,
          child: Column(mainAxisAlignment: MainAxisAlignment.start, children: [
            Align(
                alignment: Alignment.centerRight,
                child: Container(
                    padding: getPadding(top: 8, bottom: 8),
                    decoration: AppDecoration.outline,
                    child: CustomAppBar(
                        height: getVerticalSize(28),
                        leadingWidth: 32,
                        leading: AppbarImage(
                            height: getSize(24),
                            width: getSize(24),
                            svgPath: ImageConstant.imgArrowleft,
                            margin: getMargin(left: 8),
                            onTap: () {
                              onTapArrowleft12(context);
                            }),
                        centerTitle: true,
                        title: AppbarSubtitle(text: "Rating and reviews")))),
            Align(
                alignment: Alignment.centerRight,
                child: SizedBox(
                    height: getVerticalSize(660),
                    width: double.maxFinite,
                    child: Stack(alignment: Alignment.bottomCenter, children: [
                      Align(
                          alignment: Alignment.topLeft,
                          child: Padding(
                              padding: getPadding(left: 16, top: 39),
                              child: Column(
                                  mainAxisSize: MainAxisSize.min,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  children: [
                                    Padding(
                                        padding: getPadding(left: 1),
                                        child: Row(children: [
                                          Text("8 reviews",
                                              overflow: TextOverflow.ellipsis,
                                              textAlign: TextAlign.left,
                                              style: CustomTextStyles
                                                  .headlineSmallGray900),
                                          CustomCheckboxButton(
                                              text: "With photo",
                                              iconSize: getHorizontalSize(20),
                                              value: isCheckbox,
                                              margin:
                                                  getMargin(top: 2, bottom: 1),
                                              padding:
                                                  getPadding(top: 2, bottom: 2),
                                              textStyle: CustomTextStyles
                                                  .bodyMediumGray900,
                                              onChange: (value) {
                                                isCheckbox = value;
                                              })
                                        ])),
                                    Container(
                                        height: getVerticalSize(70),
                                        width: getHorizontalSize(113),
                                        margin: getMargin(top: 28),
                                        child: Stack(
                                            alignment: Alignment.topLeft,
                                            children: [
                                              Align(
                                                  alignment:
                                                      Alignment.bottomRight,
                                                  child: Container(
                                                      decoration: AppDecoration
                                                          .outline5
                                                          .copyWith(
                                                              borderRadius:
                                                                  BorderRadiusStyle
                                                                      .roundedBorder8),
                                                      child: Column(
                                                          mainAxisSize:
                                                              MainAxisSize.min,
                                                          crossAxisAlignment:
                                                              CrossAxisAlignment
                                                                  .start,
                                                          mainAxisAlignment:
                                                              MainAxisAlignment
                                                                  .start,
                                                          children: [
                                                            Padding(
                                                                padding:
                                                                    getPadding(
                                                                        left:
                                                                            1),
                                                                child: Text(
                                                                    "Kim Shine",
                                                                    overflow:
                                                                        TextOverflow
                                                                            .ellipsis,
                                                                    textAlign:
                                                                        TextAlign
                                                                            .left,
                                                                    style: CustomTextStyles
                                                                        .titleSmallSemiBold)),
                                                            Container(
                                                                height:
                                                                    getVerticalSize(
                                                                        14),
                                                                width:
                                                                    getHorizontalSize(
                                                                        74),
                                                                margin:
                                                                    getMargin(
                                                                        top: 6),
                                                                child: TabBar(
                                                                    controller:
                                                                        tabviewController,
                                                                    tabs: [
                                                                      Tab(
                                                                          child: CustomImageView(
                                                                              svgPath: ImageConstant.imgStarOrange300,
                                                                              height: getSize(14),
                                                                              width: getSize(14))),
                                                                      Tab(
                                                                          child: CustomImageView(
                                                                              svgPath: ImageConstant.imgStarOrange300,
                                                                              height: getSize(14),
                                                                              width: getSize(14))),
                                                                      Tab(
                                                                          child: CustomImageView(
                                                                              svgPath: ImageConstant.imgStarOrange300,
                                                                              height: getSize(14),
                                                                              width: getSize(14))),
                                                                      Tab(
                                                                          child: CustomImageView(
                                                                              svgPath: ImageConstant.imgStarOrange300,
                                                                              height: getSize(14),
                                                                              width: getSize(14))),
                                                                      Tab(
                                                                          child: CustomImageView(
                                                                              svgPath: ImageConstant.imgStar,
                                                                              height: getSize(14),
                                                                              width: getSize(14)))
                                                                    ]))
                                                          ]))),
                                              Align(
                                                  alignment: Alignment.topLeft,
                                                  child: SizedBox(
                                                      height: getSize(32),
                                                      width: getSize(32),
                                                      child: Stack(
                                                          alignment:
                                                              Alignment.center,
                                                          children: [
                                                            CustomImageView(
                                                                imagePath:
                                                                    ImageConstant
                                                                        .imgImage32x32,
                                                                height:
                                                                    getSize(32),
                                                                width:
                                                                    getSize(32),
                                                                radius: BorderRadius
                                                                    .circular(
                                                                        getHorizontalSize(
                                                                            16)),
                                                                alignment:
                                                                    Alignment
                                                                        .center),
                                                            CustomImageView(
                                                                imagePath:
                                                                    ImageConstant
                                                                        .imgImage21,
                                                                height:
                                                                    getSize(32),
                                                                width:
                                                                    getSize(32),
                                                                radius: BorderRadius
                                                                    .circular(
                                                                        getHorizontalSize(
                                                                            16)),
                                                                alignment:
                                                                    Alignment
                                                                        .center)
                                                          ])))
                                            ]))
                                  ]))),
                      Container(
                          margin: getMargin(top: 162),
                          height: getVerticalSize(538),
                          child: TabBarView(
                              controller: tabviewController,
                              children: [
                                RatingAndReviewsWithPhotoPage(),
                                RatingAndReviewsWithPhotoPage(),
                                RatingAndReviewsWithPhotoPage(),
                                RatingAndReviewsWithPhotoPage(),
                                RatingAndReviewsWithPhotoPage()
                              ]))
                    ])))
          ])),
    ));
  }

  ///Handling route based on bottom click actions

  /// Navigates back to the previous screen.
  ///
  /// This function takes a [BuildContext] object as a parameter, which is used
  /// to navigate back to the previous screen.
  onTapArrowleft12(BuildContext context) {
    Navigator.pop(context);
  }
}
