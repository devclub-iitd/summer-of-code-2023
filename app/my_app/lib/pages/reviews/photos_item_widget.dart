import 'package:flutter/material.dart';
import 'package:my_app/core/utils/size_utils.dart';

import '../../core/utils/image_constant.dart';
import '../../widgets/custom_image_view.dart';

// ignore: must_be_immutable
class PhotosItemWidget extends StatelessWidget {
  const PhotosItemWidget({Key? key})
      : super(
          key: key,
        );

  @override
  Widget build(BuildContext context) {
    return CustomImageView(
      imagePath: ImageConstant.imgImage2104x104,
      height: getSize(
        104,
      ),
      width: getSize(
        104,
      ),
      radius: BorderRadius.circular(
        getHorizontalSize(
          4,
        ),
      ),
    );
  }
}
