import 'package:flutter/material.dart';

class BannerItem extends StatelessWidget {
  final String imageUrl;

  BannerItem({required this.imageUrl});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        image: DecorationImage(
          image: AssetImage(imageUrl),
          fit: BoxFit.cover,
        ),
      ),
    );
  }
}
