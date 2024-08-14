import 'package:google_fonts/google_fonts.dart';
import 'package:my_app/pages/reviews/rating_and_reviews_page.dart';
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

import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';

class RatingAndReviewsTabContainerScreen extends StatefulWidget {
  const RatingAndReviewsTabContainerScreen({Key? key}) : super(key: key);

  @override
  RatingAndReviewsTabContainerScreenState createState() =>
      RatingAndReviewsTabContainerScreenState();
}

// ignore_for_file: must_be_immutable
class RatingAndReviewsTabContainerScreenState
    extends State<RatingAndReviewsTabContainerScreen>
    with TickerProviderStateMixin {
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
                child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Align(
                          alignment: Alignment.centerLeft,
                          child: Padding(
                              padding: getPadding(left: 8, top: 8, right: 91),
                              child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.end,
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  children: [
                                    CustomAppBar(
                                        height: getVerticalSize(24),
                                        leadingWidth: 375,
                                        leading: AppbarImage(
                                            height: getSize(24),
                                            width: getSize(24),
                                            svgPath: ImageConstant.imgArrowleft,
                                            margin:
                                                getMargin(left: 8, right: 343),
                                            onTap: () {
                                              onTapArrowleft11(context);
                                            })),
                                    Padding(
                                        padding: getPadding(top: 30),
                                        child: Text("Rating&Reviews",
                                            overflow: TextOverflow.ellipsis,
                                            textAlign: TextAlign.left,
                                            style:
                                                theme.textTheme.displaySmall))
                                  ]))),
                      Expanded(
                          child: Align(
                              alignment: Alignment.centerLeft,
                              child: SingleChildScrollView(
                                  padding: getPadding(top: 37),
                                  child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      mainAxisAlignment:
                                          MainAxisAlignment.start,
                                      children: [
                                        Padding(
                                            padding: getPadding(left: 15),
                                            child: Row(
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.start,
                                                children: [
                                                  Padding(
                                                      padding: getPadding(
                                                          bottom: 36),
                                                      child: Column(
                                                          mainAxisAlignment:
                                                              MainAxisAlignment
                                                                  .start,
                                                          children: [
                                                            Text("4.3",
                                                                overflow:
                                                                    TextOverflow
                                                                        .ellipsis,
                                                                textAlign:
                                                                    TextAlign
                                                                        .left,
                                                                style: theme
                                                                    .textTheme
                                                                    .displayMedium),
                                                            Padding(
                                                                padding:
                                                                    getPadding(
                                                                        top: 4),
                                                                child: Text(
                                                                    "23 ratings",
                                                                    overflow:
                                                                        TextOverflow
                                                                            .ellipsis,
                                                                    textAlign:
                                                                        TextAlign
                                                                            .left,
                                                                    style: theme
                                                                        .textTheme
                                                                        .bodyMedium))
                                                          ])),
                                                  Expanded(
                                                      child: Padding(
                                                          padding: getPadding(
                                                              left: 27, top: 3),
                                                          child: Column(
                                                              crossAxisAlignment:
                                                                  CrossAxisAlignment
                                                                      .end,
                                                              mainAxisAlignment:
                                                                  MainAxisAlignment
                                                                      .start,
                                                              children: [
                                                                Row(
                                                                    mainAxisAlignment:
                                                                        MainAxisAlignment
                                                                            .end,
                                                                    children: [
                                                                      RatingBar.builder(
                                                                          initialRating: 0,
                                                                          minRating: 0,
                                                                          direction: Axis.horizontal,
                                                                          allowHalfRating: false,
                                                                          itemSize: getVerticalSize(14),
                                                                          itemCount: 1,
                                                                          updateOnDrag: true,
                                                                          onRatingUpdate: (rating) {},
                                                                          itemBuilder: (context, _) {
                                                                            return Icon(Icons.star);
                                                                          }),
                                                                      Container(
                                                                          height: getVerticalSize(
                                                                              8),
                                                                          width: getHorizontalSize(
                                                                              114),
                                                                          margin: getMargin(
                                                                              left:
                                                                                  10,
                                                                              top:
                                                                                  3,
                                                                              bottom:
                                                                                  3),
                                                                          decoration: BoxDecoration(
                                                                              color: theme.colorScheme.primary,
                                                                              borderRadius: BorderRadius.circular(getHorizontalSize(4)))),
                                                                      Padding(
                                                                          padding: getPadding(
                                                                              left:
                                                                                  23),
                                                                          child: Text(
                                                                              "12",
                                                                              overflow: TextOverflow.ellipsis,
                                                                              textAlign: TextAlign.left,
                                                                              style: CustomTextStyles.bodyMediumGray800))
                                                                    ]),
                                                                Padding(
                                                                    padding: getPadding(
                                                                        left:
                                                                            15,
                                                                        top: 6,
                                                                        right:
                                                                            1),
                                                                    child: Row(
                                                                        mainAxisAlignment:
                                                                            MainAxisAlignment.end,
                                                                        children: [
                                                                          RatingBar.builder(
                                                                              initialRating: 0,
                                                                              minRating: 0,
                                                                              direction: Axis.horizontal,
                                                                              allowHalfRating: false,
                                                                              itemSize: getVerticalSize(14),
                                                                              itemCount: 1,
                                                                              updateOnDrag: true,
                                                                              onRatingUpdate: (rating) {},
                                                                              itemBuilder: (context, _) {
                                                                                return Icon(Icons.star);
                                                                              }),
                                                                          Container(
                                                                              height: getVerticalSize(8),
                                                                              width: getHorizontalSize(40),
                                                                              margin: getMargin(left: 9, top: 3, bottom: 3),
                                                                              decoration: BoxDecoration(color: theme.colorScheme.primary, borderRadius: BorderRadius.circular(getHorizontalSize(4)))),
                                                                          Text(
                                                                              "5",
                                                                              overflow: TextOverflow.ellipsis,
                                                                              textAlign: TextAlign.left,
                                                                              style: CustomTextStyles.bodyMediumGray800)
                                                                        ])),
                                                                Padding(
                                                                    padding: getPadding(
                                                                        top: 6,
                                                                        right:
                                                                            2),
                                                                    child: Row(
                                                                        mainAxisAlignment:
                                                                            MainAxisAlignment.end,
                                                                        children: [
                                                                          CustomImageView(
                                                                              svgPath: ImageConstant.imgStarOrange300,
                                                                              height: getSize(14),
                                                                              width: getSize(14)),
                                                                          CustomImageView(
                                                                              svgPath: ImageConstant.imgStarOrange300,
                                                                              height: getSize(14),
                                                                              width: getSize(14),
                                                                              margin: getMargin(left: 1)),
                                                                          CustomImageView(
                                                                              svgPath: ImageConstant.imgStarOrange300,
                                                                              height: getSize(14),
                                                                              width: getSize(14),
                                                                              margin: getMargin(left: 2)),
                                                                          Container(
                                                                              height: getVerticalSize(8),
                                                                              width: getHorizontalSize(29),
                                                                              margin: getMargin(left: 9, top: 3, bottom: 3),
                                                                              decoration: BoxDecoration(color: theme.colorScheme.primary, borderRadius: BorderRadius.circular(getHorizontalSize(4)))),
                                                                          Text(
                                                                              "4",
                                                                              overflow: TextOverflow.ellipsis,
                                                                              textAlign: TextAlign.left,
                                                                              style: CustomTextStyles.bodyMediumGray800)
                                                                        ])),
                                                                Padding(
                                                                    padding:
                                                                        getPadding(
                                                                            top:
                                                                                6),
                                                                    child: Row(
                                                                        mainAxisAlignment:
                                                                            MainAxisAlignment.end,
                                                                        children: [
                                                                          CustomImageView(
                                                                              svgPath: ImageConstant.imgStarOrange300,
                                                                              height: getSize(14),
                                                                              width: getSize(14)),
                                                                          CustomImageView(
                                                                              svgPath: ImageConstant.imgStarOrange300,
                                                                              height: getSize(14),
                                                                              width: getSize(14),
                                                                              margin: getMargin(left: 2)),
                                                                          Container(
                                                                              height: getVerticalSize(8),
                                                                              width: getHorizontalSize(15),
                                                                              margin: getMargin(left: 9, top: 3, bottom: 3),
                                                                              decoration: BoxDecoration(color: theme.colorScheme.primary, borderRadius: BorderRadius.circular(getHorizontalSize(4)))),
                                                                          Text(
                                                                              "2",
                                                                              overflow: TextOverflow.ellipsis,
                                                                              textAlign: TextAlign.left,
                                                                              style: CustomTextStyles.bodyMediumGray800)
                                                                        ])),
                                                                Padding(
                                                                    padding: getPadding(
                                                                        top: 7,
                                                                        right:
                                                                            1),
                                                                    child: Row(
                                                                        mainAxisAlignment:
                                                                            MainAxisAlignment.end,
                                                                        children: [
                                                                          CustomImageView(
                                                                              svgPath: ImageConstant.imgStarOrange300,
                                                                              height: getSize(14),
                                                                              width: getSize(14)),
                                                                          Container(
                                                                              height: getSize(8),
                                                                              width: getSize(8),
                                                                              margin: getMargin(left: 10, top: 3, bottom: 3),
                                                                              decoration: BoxDecoration(color: theme.colorScheme.primary, borderRadius: BorderRadius.circular(getHorizontalSize(4)))),
                                                                          Text(
                                                                              "0",
                                                                              overflow: TextOverflow.ellipsis,
                                                                              textAlign: TextAlign.left,
                                                                              style: CustomTextStyles.bodyMediumGray800)
                                                                        ]))
                                                              ])))
                                                ])),
                                        Container(
                                            height: getVerticalSize(503),
                                            width: double.maxFinite,
                                            margin: getMargin(top: 31),
                                            child: Stack(
                                                alignment:
                                                    Alignment.bottomCenter,
                                                children: [
                                                  Align(
                                                      alignment:
                                                          Alignment.topLeft,
                                                      child: Padding(
                                                          padding: getPadding(
                                                              left: 16),
                                                          child: Column(
                                                              mainAxisSize:
                                                                  MainAxisSize
                                                                      .min,
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
                                                                    child: Row(
                                                                        children: [
                                                                          Text(
                                                                              "8 reviews",
                                                                              overflow: TextOverflow.ellipsis,
                                                                              textAlign: TextAlign.left,
                                                                              style: CustomTextStyles.headlineSmallGray900),
                                                                          CustomCheckboxButton(
                                                                              text: "With photo",
                                                                              value: isCheckbox,
                                                                              margin: getMargin(top: 1, bottom: 2),
                                                                              padding: getPadding(top: 1, bottom: 1),
                                                                              textStyle: CustomTextStyles.bodyMediumGray900,
                                                                              onChange: (value) {
                                                                                isCheckbox = value;
                                                                              })
                                                                        ])),
                                                                Container(
                                                                    height:
                                                                        getVerticalSize(
                                                                            70),
                                                                    width:
                                                                        getHorizontalSize(
                                                                            136),
                                                                    margin: getMargin(
                                                                        top:
                                                                            28),
                                                                    child: Stack(
                                                                        alignment:
                                                                            Alignment.topLeft,
                                                                        children: [
                                                                          Align(
                                                                              alignment: Alignment.bottomRight,
                                                                              child: Container(
                                                                                  decoration: AppDecoration.outline5.copyWith(borderRadius: BorderRadiusStyle.roundedBorder8),
                                                                                  child: Column(mainAxisSize: MainAxisSize.min, crossAxisAlignment: CrossAxisAlignment.start, mainAxisAlignment: MainAxisAlignment.start, children: [
                                                                                    Padding(padding: getPadding(left: 1), child: Text("Helene Moore", overflow: TextOverflow.ellipsis, textAlign: TextAlign.left, style: CustomTextStyles.titleSmallSemiBold)),
                                                                                    Container(
                                                                                        height: getVerticalSize(14),
                                                                                        width: getHorizontalSize(74),
                                                                                        margin: getMargin(top: 6),
                                                                                        child: TabBar(controller: tabviewController, tabs: [
                                                                                          Tab(child: CustomImageView(svgPath: ImageConstant.imgStarOrange300, height: getSize(14), width: getSize(14))),
                                                                                          Tab(child: CustomImageView(svgPath: ImageConstant.imgStarOrange300, height: getSize(14), width: getSize(14))),
                                                                                          Tab(child: CustomImageView(svgPath: ImageConstant.imgStarOrange300, height: getSize(14), width: getSize(14))),
                                                                                          Tab(child: CustomImageView(svgPath: ImageConstant.imgStarOrange300, height: getSize(14), width: getSize(14))),
                                                                                          Tab(child: CustomImageView(svgPath: ImageConstant.imgStar, height: getSize(14), width: getSize(14)))
                                                                                        ]))
                                                                                  ]))),
                                                                          CustomImageView(
                                                                              imagePath: ImageConstant.imgBag,
                                                                              height: getSize(32),
                                                                              width: getSize(32),
                                                                              alignment: Alignment.topLeft)
                                                                        ]))
                                                              ]))),
                                                  Container(
                                                      margin:
                                                          getMargin(top: 122),
                                                      height:
                                                          getVerticalSize(381),
                                                      child: TabBarView(
                                                          controller:
                                                              tabviewController,
                                                          children: [
                                                            RatingAndReviewsPage(),
                                                            RatingAndReviewsPage(),
                                                            RatingAndReviewsPage(),
                                                            RatingAndReviewsPage(),
                                                            RatingAndReviewsPage()
                                                          ]))
                                                ]))
                                      ]))))
                    ]))));
  }

  /// Navigates back to the previous screen.
  ///
  /// This function takes a [BuildContext] object as a parameter, which is used
  /// to navigate back to the previous screen.
  onTapArrowleft11(BuildContext context) {
    Navigator.pop(context);
  }
}
