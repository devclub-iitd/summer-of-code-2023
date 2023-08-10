import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:my_app/pages/searchPage.dart';
import 'package:my_app/widgets/app_bar/custom_app_bar.dart';

import '../Utils/widgets.dart';
import '../core/utils/image_constant.dart';
import '../core/utils/size_utils.dart';
import '../theme/app_decoration.dart';
import '../theme/custom_text_style.dart';
import '../theme/theme_helper.dart';
import '../widgets/app_bar/appbar_image.dart';
import '../widgets/custom_checkbox_button.dart';
import '../widgets/custom_floating_button.dart';
import '../widgets/custom_image_view.dart';

class CardPage extends StatefulWidget {
  const CardPage({Key? key}) : super(key: key);

  @override
  State<CardPage> createState() => _CardPageState();
}

class _CardPageState extends State<CardPage> {
  bool isCheckbox = false;

  bool isCheckbox1 = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          automaticallyImplyLeading: false,
          flexibleSpace: Padding(
            padding: const EdgeInsets.only(top: 35.0, left: 10, right: 10),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                GestureDetector(
                  onTap: () {
                    Navigator.pop(context);
                  },
                  child: Card(
                    elevation: 10,
                    color: Colors.grey,
                    shape: const RoundedRectangleBorder(
                        borderRadius: BorderRadius.all(Radius.circular(15))),
                    child: Container(
                      height: 50,
                      width: 50,
                      child: const Icon(Icons.arrow_back_ios),
                    ),
                  ),
                ),
                Text(
                  "Saved cards & wallets",
                  style: GoogleFonts.poppins(
                      fontWeight: FontWeight.w500, fontSize: 20),
                ),
                GestureDetector(
                  onTap: () {
                    nextScreen(context, const SearchPage());
                  },
                  child: Card(
                    elevation: 10,
                    color: Colors.grey,
                    shape: const RoundedRectangleBorder(
                        borderRadius: BorderRadius.all(Radius.circular(15))),
                    child: Container(
                      height: 50,
                      width: 50,
                      child: const Icon(Icons.search_outlined),
                    ),
                  ),
                ),
              ],
            ),
          ),
          elevation: 0,
        ),
        body: SingleChildScrollView(
          child: SizedBox(
              width: double.maxFinite,
              child: Column(
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Padding(
                        padding: getPadding(left: 16, top: 31),
                        child: Text("Your payment cards",
                            overflow: TextOverflow.ellipsis,
                            textAlign: TextAlign.left,
                            style: theme.textTheme.titleMedium)),
                    Align(
                        alignment: Alignment.center,
                        child: Card(
                            clipBehavior: Clip.antiAlias,
                            elevation: 0,
                            margin: getMargin(top: 28),
                            color: appTheme.gray900,
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadiusStyle.roundedBorder8),
                            child: Container(
                                height: getVerticalSize(216),
                                width: getHorizontalSize(343),
                                decoration: AppDecoration.outline8.copyWith(
                                    borderRadius:
                                        BorderRadiusStyle.roundedBorder8),
                                child: Stack(
                                    alignment: Alignment.topRight,
                                    children: [
                                      Align(
                                          alignment: Alignment.bottomLeft,
                                          child: Container(
                                              padding: getPadding(
                                                  left: 24,
                                                  top: 26,
                                                  right: 24,
                                                  bottom: 26),
                                              decoration: BoxDecoration(
                                                  image: DecorationImage(
                                                      image: AssetImage(
                                                          ImageConstant
                                                              .imgGroup107),
                                                      fit: BoxFit.cover)),
                                              child: Column(
                                                  mainAxisSize:
                                                      MainAxisSize.min,
                                                  crossAxisAlignment:
                                                      CrossAxisAlignment.start,
                                                  mainAxisAlignment:
                                                      MainAxisAlignment.end,
                                                  children: [
                                                    Padding(
                                                        padding:
                                                            getPadding(top: 23),
                                                        child: Row(children: [
                                                          Opacity(
                                                              opacity: 0.8,
                                                              child: Text(
                                                                  "Card Holder Name",
                                                                  overflow:
                                                                      TextOverflow
                                                                          .ellipsis,
                                                                  textAlign:
                                                                      TextAlign
                                                                          .left,
                                                                  style: CustomTextStyles
                                                                      .labelMediumOnPrimary)),
                                                          Opacity(
                                                              opacity: 0.8,
                                                              child: Padding(
                                                                  padding:
                                                                      getPadding(
                                                                          left:
                                                                              70),
                                                                  child: Text(
                                                                      "Expiry Date",
                                                                      overflow:
                                                                          TextOverflow
                                                                              .ellipsis,
                                                                      textAlign:
                                                                          TextAlign
                                                                              .left,
                                                                      style: CustomTextStyles
                                                                          .labelMediumOnPrimary)))
                                                        ])),
                                                    Padding(
                                                        padding:
                                                            getPadding(top: 6),
                                                        child: Row(children: [
                                                          Text("Jennyfer Doe",
                                                              overflow:
                                                                  TextOverflow
                                                                      .ellipsis,
                                                              textAlign:
                                                                  TextAlign
                                                                      .left,
                                                              style: CustomTextStyles
                                                                  .titleSmallOnPrimary),
                                                          Padding(
                                                              padding: getPadding(
                                                                  left: 67),
                                                              child: Text(
                                                                  "05/23",
                                                                  overflow:
                                                                      TextOverflow
                                                                          .ellipsis,
                                                                  textAlign:
                                                                      TextAlign
                                                                          .left,
                                                                  style: CustomTextStyles
                                                                      .titleSmallOnPrimary))
                                                        ]))
                                                  ]))),
                                      CustomImageView(
                                          imagePath: ImageConstant.imgEllipse,
                                          height: getVerticalSize(150),
                                          width: getHorizontalSize(153),
                                          alignment: Alignment.topRight),
                                      CustomImageView(
                                          svgPath: ImageConstant
                                              .imgMastercardYellow800,
                                          height: getVerticalSize(25),
                                          width: getHorizontalSize(32),
                                          radius: BorderRadius.circular(
                                              getHorizontalSize(8)),
                                          alignment: Alignment.bottomRight,
                                          margin:
                                              getMargin(right: 24, bottom: 32)),
                                      CustomImageView(
                                          svgPath: ImageConstant.imgGlobe,
                                          height: getVerticalSize(24),
                                          width: getHorizontalSize(32),
                                          radius: BorderRadius.circular(
                                              getHorizontalSize(8)),
                                          alignment: Alignment.topLeft,
                                          margin: getMargin(left: 24, top: 34)),
                                      Align(
                                          alignment: Alignment.topLeft,
                                          child: Padding(
                                              padding:
                                                  getPadding(left: 24, top: 84),
                                              child: RichText(
                                                  text: TextSpan(children: [
                                                    TextSpan(
                                                        text:
                                                            "* * * *  * * * *  * * * *",
                                                        style: theme.textTheme
                                                            .headlineSmall),
                                                    TextSpan(
                                                        text: "  3947",
                                                        style: CustomTextStyles
                                                            .headlineSmallRegular)
                                                  ]),
                                                  textAlign: TextAlign.left)))
                                    ])))),
                    CustomCheckboxButton(
                        text: "Use as default payment method",
                        iconSize: getHorizontalSize(20),
                        value: true,
                        margin: getMargin(left: 16, top: 26),
                        padding: getPadding(top: 2, bottom: 2),
                        textStyle: CustomTextStyles.bodyMediumGray900,
                        onChange: (value) {
                          isCheckbox = value;
                        }),
                    Align(
                        alignment: Alignment.center,
                        child: Card(
                            clipBehavior: Clip.antiAlias,
                            elevation: 0,
                            margin: getMargin(top: 39),
                            color: appTheme.gray500,
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadiusStyle.roundedBorder8),
                            child: Container(
                                height: getVerticalSize(216),
                                width: getHorizontalSize(343),
                                decoration: AppDecoration.outline9.copyWith(
                                    borderRadius:
                                        BorderRadiusStyle.roundedBorder8),
                                child: Stack(
                                    alignment: Alignment.topRight,
                                    children: [
                                      Align(
                                          alignment: Alignment.bottomLeft,
                                          child: Container(
                                              padding: getPadding(
                                                  left: 24,
                                                  top: 4,
                                                  right: 24,
                                                  bottom: 4),
                                              decoration: BoxDecoration(
                                                  image: DecorationImage(
                                                      image: AssetImage(
                                                          ImageConstant
                                                              .imgGroup107),
                                                      fit: BoxFit.cover)),
                                              child: Column(
                                                  mainAxisSize:
                                                      MainAxisSize.min,
                                                  crossAxisAlignment:
                                                      CrossAxisAlignment.start,
                                                  mainAxisAlignment:
                                                      MainAxisAlignment.start,
                                                  children: [
                                                    CustomImageView(
                                                        svgPath: ImageConstant
                                                            .imgGlobe,
                                                        height:
                                                            getVerticalSize(24),
                                                        width:
                                                            getHorizontalSize(
                                                                32),
                                                        radius: BorderRadius
                                                            .circular(
                                                                getHorizontalSize(
                                                                    8))),
                                                    Padding(
                                                        padding:
                                                            getPadding(top: 22),
                                                        child: Text(
                                                            "Card Holder Name",
                                                            overflow:
                                                                TextOverflow
                                                                    .ellipsis,
                                                            textAlign:
                                                                TextAlign.left,
                                                            style: CustomTextStyles
                                                                .labelMedium10)),
                                                    Padding(
                                                        padding: getPadding(
                                                            top: 7, bottom: 22),
                                                        child: Text(
                                                            "Jennyfer Doe",
                                                            overflow:
                                                                TextOverflow
                                                                    .ellipsis,
                                                            textAlign:
                                                                TextAlign.left,
                                                            style: CustomTextStyles
                                                                .titleSmallOnPrimary))
                                                  ]))),
                                      Align(
                                          alignment: Alignment.topRight,
                                          child: SizedBox(
                                              height: getVerticalSize(150),
                                              width: getHorizontalSize(153),
                                              child: Stack(
                                                  alignment: Alignment.topRight,
                                                  children: [
                                                    CustomImageView(
                                                        imagePath: ImageConstant
                                                            .imgEllipse150x153,
                                                        height: getVerticalSize(
                                                            150),
                                                        width:
                                                            getHorizontalSize(
                                                                153),
                                                        alignment:
                                                            Alignment.center),
                                                    CustomImageView(
                                                        svgPath: ImageConstant
                                                            .imgVector,
                                                        height:
                                                            getVerticalSize(16),
                                                        width:
                                                            getHorizontalSize(
                                                                50),
                                                        radius: BorderRadius
                                                            .circular(
                                                                getHorizontalSize(
                                                                    8)),
                                                        alignment:
                                                            Alignment.topRight,
                                                        margin: getMargin(
                                                            top: 19, right: 24))
                                                  ]))),
                                      Align(
                                          alignment: Alignment.topLeft,
                                          child: Padding(
                                              padding:
                                                  getPadding(left: 24, top: 76),
                                              child: RichText(
                                                  text: TextSpan(children: [
                                                    TextSpan(
                                                        text:
                                                            "* * * *  * * * *  * * * *",
                                                        style: theme.textTheme
                                                            .headlineSmall),
                                                    TextSpan(
                                                        text: "  4546",
                                                        style: CustomTextStyles
                                                            .headlineSmallRegular)
                                                  ]),
                                                  textAlign: TextAlign.left))),
                                      Align(
                                          alignment: Alignment.bottomRight,
                                          child: Padding(
                                              padding: getPadding(
                                                  right: 24, bottom: 47),
                                              child: Text("Expiry Date",
                                                  overflow:
                                                      TextOverflow.ellipsis,
                                                  textAlign: TextAlign.left,
                                                  style: CustomTextStyles
                                                      .labelMedium10))),
                                      Align(
                                          alignment: Alignment.bottomRight,
                                          child: Padding(
                                              padding: getPadding(
                                                  right: 44, bottom: 27),
                                              child: Text("11/22",
                                                  overflow:
                                                      TextOverflow.ellipsis,
                                                  textAlign: TextAlign.left,
                                                  style: CustomTextStyles
                                                      .titleSmallOnPrimary)))
                                    ])))),
                    CustomCheckboxButton(
                        text: "Use as default payment method",
                        value: isCheckbox1,
                        margin: getMargin(left: 16, top: 25, bottom: 86),
                        padding: getPadding(top: 1, bottom: 1),
                        textStyle: CustomTextStyles.bodyMediumGray900,
                        onChange: (value) {
                          isCheckbox1 = value;
                        })
                  ])),
        ),
        floatingActionButton: CustomFloatingButton(
            height: 36,
            width: 36,
            backgroundColor: appTheme.gray900,
            child: CustomImageView(
                svgPath: ImageConstant.imgGrid,
                height: getVerticalSize(18.0),
                width: getHorizontalSize(18.0))));
  }
}
