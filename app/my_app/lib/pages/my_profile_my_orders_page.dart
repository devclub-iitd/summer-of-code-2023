import 'package:my_app/Models/order.dart';

import '../core/utils/size_utils.dart';
import '../theme/app_decoration.dart';
import '../theme/custom_button_style.dart';
import '../theme/custom_text_style.dart';
import '../theme/theme_helper.dart';
import '../widgets/orders_item_widget.dart';

import 'package:flutter/material.dart';

// ignore_for_file: must_be_immutable
class MyProfileMyOrdersPage extends StatefulWidget {
  const MyProfileMyOrdersPage({Key? key})
      : super(
          key: key,
        );

  @override
  MyProfileMyOrdersPageState createState() => MyProfileMyOrdersPageState();
}

class MyProfileMyOrdersPageState extends State<MyProfileMyOrdersPage>
    with AutomaticKeepAliveClientMixin<MyProfileMyOrdersPage> {
  @override
  bool get wantKeepAlive => true;
  @override
  Widget build(BuildContext context) {
    mediaQueryData = MediaQuery.of(context);

    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.transparent,
        body: SizedBox(
          width: double.maxFinite,
          child: Padding(
            padding: getPadding(
              left: 16,
              top: 30,
              right: 15,
            ),
            child: ListView.separated(
              physics: BouncingScrollPhysics(),
              shrinkWrap: true,
              separatorBuilder: (
                context,
                index,
              ) {
                return SizedBox(
                  height: getVerticalSize(
                    24,
                  ),
                );
              },
              itemCount: 3,
              itemBuilder: (context, index) {
                return Container();
              },
            ),
          ),
        ),
      ),
    );
  }
}
