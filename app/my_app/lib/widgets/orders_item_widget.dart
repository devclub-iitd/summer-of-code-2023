import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:my_app/Utils/widgets.dart';
import 'package:my_app/pages/orderpage.dart';

import '../Models/order.dart';
import '../core/utils/size_utils.dart';
import '../theme/app_decoration.dart';
import '../theme/custom_button_style.dart';
import '../theme/custom_text_style.dart';
import '../theme/theme_helper.dart';
import 'custom_outlined_button.dart';

// ignore: must_be_immutable
class OrdersItemWidget extends StatelessWidget {
  final Order order;
  const OrdersItemWidget({Key? key, required this.order})
      : super(
          key: key,
        );

  @override
  Widget build(BuildContext context) {
    int items = 0;
    for (var i = 0; i < order.quantity.length; i++) {
      items += order.quantity[i];
    }
    return Container(
      padding: getPadding(
        left: 15,
        top: 18,
        right: 15,
        bottom: 18,
      ),
      decoration: AppDecoration.outline6.copyWith(
        borderRadius: BorderRadiusStyle.roundedBorder8,
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Padding(
            padding: getPadding(
              left: 4,
              right: 3,
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "Order № 1947034",
                  overflow: TextOverflow.ellipsis,
                  textAlign: TextAlign.left,
                  style: theme.textTheme.titleMedium,
                ),
                Padding(
                  padding: getPadding(
                    top: 1,
                  ),
                  child: Text(
                    DateFormat.yMMMd().format(
                        DateTime.fromMillisecondsSinceEpoch(order.orderedAt)),
                    overflow: TextOverflow.ellipsis,
                    textAlign: TextAlign.left,
                    style: theme.textTheme.bodyMedium,
                  ),
                ),
              ],
            ),
          ),
          Padding(
            padding: getPadding(
              left: 3,
              top: 17,
            ),
            child: Row(
              children: [
                Padding(
                  padding: getPadding(
                    top: 1,
                  ),
                  child: Text(
                    "Tracking number:",
                    overflow: TextOverflow.ellipsis,
                    textAlign: TextAlign.left,
                    style: theme.textTheme.bodyMedium,
                  ),
                ),
                Padding(
                  padding: getPadding(
                    left: 10,
                    bottom: 1,
                  ),
                  child: Text(
                    order.id,
                    overflow: TextOverflow.ellipsis,
                    textAlign: TextAlign.left,
                    style: theme.textTheme.titleSmall,
                  ),
                ),
              ],
            ),
          ),
          Padding(
            padding: getPadding(
              left: 4,
              top: 7,
            ),
            child: Row(
              children: [
                Padding(
                  padding: getPadding(
                    top: 2,
                  ),
                  child: Text(
                    "Quantity:",
                    overflow: TextOverflow.ellipsis,
                    textAlign: TextAlign.left,
                    style: theme.textTheme.bodyMedium,
                  ),
                ),
                Padding(
                  padding: getPadding(
                    left: 11,
                  ),
                  child: Text(
                    items.toString(),
                    overflow: TextOverflow.ellipsis,
                    textAlign: TextAlign.left,
                    style: theme.textTheme.titleMedium,
                  ),
                ),
                Spacer(),
                Padding(
                  padding: getPadding(
                    top: 1,
                  ),
                  child: Text(
                    "Total Amount:",
                    overflow: TextOverflow.ellipsis,
                    textAlign: TextAlign.left,
                    style: theme.textTheme.bodyMedium,
                  ),
                ),
                Padding(
                  padding: getPadding(
                    left: 11,
                  ),
                  child: Text(
                    "Rs. " + order.totalPrice.toString(),
                    overflow: TextOverflow.ellipsis,
                    textAlign: TextAlign.left,
                    style: theme.textTheme.titleMedium,
                  ),
                ),
              ],
            ),
          ),
          Padding(
            padding: getPadding(
              left: 4,
              top: 17,
              right: 4,
              bottom: 1,
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                CustomOutlinedButton(
                  onTap: () {
                    nextScreen(context, OrderDetailPage(order: order));
                  },
                  text: "Details",
                  buttonStyle: CustomButtonStyles.outlineGray900.copyWith(
                      fixedSize: MaterialStateProperty.all<Size>(Size(
                    getHorizontalSize(
                      98,
                    ),
                    getVerticalSize(
                      36,
                    ),
                  ))),
                  buttonTextStyle: theme.textTheme.titleSmall!,
                ),
                Padding(
                  padding: getPadding(
                    top: 10,
                    bottom: 11,
                  ),
                  child: Text(
                    "confirmed",
                    overflow: TextOverflow.ellipsis,
                    textAlign: TextAlign.left,
                    style: CustomTextStyles.titleSmallGreen600,
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
