import 'package:flutter/material.dart';
import 'banner_item.dart';

class PromotedProductBanners extends StatefulWidget {
  @override
  _PromotedProductBannersState createState() => _PromotedProductBannersState();
}

class _PromotedProductBannersState extends State<PromotedProductBanners> {
  final List<String> bannerImageUrls =
  List.generate(6, (index) => 'assets/banner/${index + 1}.jpg');
  final PageController _pageController = PageController();
  int _currentPage = 0;

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          height: 200, // Adjust the height as needed
          child: PageView.builder(
            controller: _pageController,
            itemCount: bannerImageUrls.length,
            onPageChanged: (int index) {
              setState(() {
                _currentPage = index;
              });
            },
            itemBuilder: (BuildContext context, int index) {
              final imageUrl = bannerImageUrls[index];
              return Padding(
                padding:
                const EdgeInsets.symmetric(vertical: 0.0, horizontal: 8.0),
                child: BannerItem(imageUrl: imageUrl),
              );
            },
          ),
        ),
        Positioned(
          left: 0,
          right: 0,
          bottom: 100,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              IconButton(
                icon: Icon(Icons.chevron_left),
                onPressed: () {
                  _pageController.previousPage(
                    duration: Duration(milliseconds: 300),
                    curve: Curves.easeInOut,
                  );
                },
              ),
              IconButton(
                icon: Icon(Icons.chevron_right),
                onPressed: () {
                  _pageController.nextPage(
                    duration: Duration(milliseconds: 300),
                    curve: Curves.easeInOut,
                  );
                },
              ),
            ],
          ),
        ),
      ],
    );
  }
}
