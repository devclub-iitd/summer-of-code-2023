import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Advertisement extends StatefulWidget {
  final List<Image> advertisement;
  const Advertisement({super.key,required this.advertisement});

  @override
  State<Advertisement> createState() => _AdvertisementState();
}
class _AdvertisementState extends State<Advertisement> {
  late PageController _pageController;
  int _currentPageIndex=0;

  @override
  void initState() {
    super.initState();
    _pageController = PageController(initialPage: 0);
    _pageController.addListener(_onPageChanged);
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }
  void _onPageChanged() {
    setState(() {
      _currentPageIndex = _pageController.page!.round();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 220,
      constraints: BoxConstraints(maxHeight: 300,maxWidth: 250),
      child: Stack(
        children:[ PageView(
          controller: _pageController,
          scrollDirection: Axis.horizontal,
          children:widget.advertisement,
        ),
          Align(alignment: Alignment.bottomCenter,child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: List.generate(widget.advertisement.length, (index){
              return Padding(
                padding: const EdgeInsets.fromLTRB(2, 0, 2, 8),
                child: (
                Icon(Icons.circle,
                color: index==_currentPageIndex?Colors.blue:Colors.white,
                size: 10,)
                ),
              );
            }),
          ))
        ]
      ),
    );
  }
}
