import 'dart:math';

import 'package:e_commerce/src/home/Advertisement.dart';
import 'package:e_commerce/src/home/individual.dart';
import 'package:flutter/material.dart';

import '../Product.dart';

class Home extends StatelessWidget {
  final List<Product> products;
  final List<Image> advertisement;
  const Home({super.key,required this.products,required this.advertisement});

  @override
  Widget build(BuildContext context) {
    int next=2+Random().nextInt(3);
    return Scaffold(
      body: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: Column(
          children: [
            Wrap(
              spacing: 40,
              runSpacing: 20,
              direction: Axis.horizontal,
              children: List.generate(products.length, (index){
                if(next!=index) {
                  return GestureDetector(onTap:(){Navigator.pushNamed(context,"/product",
                    arguments:index,
                  );}, child: Individual(product: products[index],isfavourite: false,));
                } else {
                  next=index+2+Random().nextInt(3);
                  return Wrap(spacing: 40,
                      runSpacing: 20,
                      direction: Axis.horizontal,children: [GestureDetector(onTap:(){Navigator.pushNamed(context,"/product",
                        arguments:index,
                      );},child: Individual(product: products[index],isfavourite: false,)),Advertisement(advertisement: advertisement)]);
                }
              }),
            ),
          ],
        ),
      ),
      floatingActionButton:FloatingActionButton(
        child: Icon(Icons.shopping_cart),
        onPressed: (){Navigator.pushNamed(context, '/cart');},
      ),
    );
  }
}
