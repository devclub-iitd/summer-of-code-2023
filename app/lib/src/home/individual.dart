import 'package:e_commerce/src/Product.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Individual extends StatefulWidget {
  final Product product;
  final bool isfavourite;
  const Individual({super.key, required this.product,required this.isfavourite});

  @override
  State<Individual> createState() => _IndividualState(product,isfavourite);
}

class _IndividualState extends State<Individual> {
  final Product product;
  bool isfavourite;
  _IndividualState(this.product,this.isfavourite);
  @override
  Widget build(BuildContext context) {
    return (Container(
      constraints: const BoxConstraints(maxHeight: 250),
      width: 125,
      height: 220,
      color: Colors.white,
      child: Card(
        color: Colors.white70,
        elevation: 3,
        child: Column(
          children: [
            Container(
                margin: const EdgeInsets.all(5),
                child: Stack(children: [
                  ClipRRect(
                      borderRadius: BorderRadius.circular(10),
                      child: product.img),
                  Positioned(
                    top: 8,
                    right: 8,
                    child: GestureDetector(
                      onTap: ()=>{
                      setState(() {
                      isfavourite=!isfavourite;
                      })
                      },
                      child: Icon(
                        isfavourite?Icons.favorite:Icons.favorite_outline_rounded,
                        color: Colors.grey,
                        size: 22,

                      ),
                    ),
                  ),
                ])),
            Align(
              alignment: Alignment.topLeft,
              child: Column(
                children: [
                  Text(product.name,
                      textAlign: TextAlign.left,
                      style: const TextStyle(
                          fontWeight: FontWeight.w100, fontSize: 10)),
                  Padding(
                      padding: EdgeInsets.fromLTRB(0, 0, 0, 4),
                      child: Text(product.brand,
                          textAlign: TextAlign.left,
                          style: const TextStyle(
                              fontWeight: FontWeight.w100, fontSize: 10))),
                  Text("\$${product.price}",
                      textAlign: TextAlign.start,
                      style: const TextStyle(
                          fontWeight: FontWeight.bold, fontSize: 15))
                ],
              ),
            )
          ],
        ),
      ),
    ));
  }
}
