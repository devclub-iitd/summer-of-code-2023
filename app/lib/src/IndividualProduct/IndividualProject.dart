import 'package:e_commerce/data.dart';
import 'package:e_commerce/src/Product.dart';
import 'package:flutter/material.dart';

class IndividualProduct extends StatefulWidget {
  late Map<int,int> cart;
  IndividualProduct({super.key,required this.cart});

  @override
  State<IndividualProduct> createState() => _IndividualProductState();
}

class _IndividualProductState extends State<IndividualProduct> {
  final int index=0;
  @override
  Widget build(BuildContext context) {
    final int index=ModalRoute.of(context)!.settings.arguments as int;
    Product product=Data().products[index];
    return Row(
      children: [
        Flexible(child:Container(padding:const EdgeInsets.all(20),child: product.img)),
        Flexible(
          child: Container(
            padding: const EdgeInsets.all(30),
            margin: const EdgeInsets.fromLTRB(0, 20, 0, 0),
            constraints: BoxConstraints(maxWidth: 500),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [Text(product.name,style: const TextStyle(
                fontSize: 60,
                fontWeight: FontWeight.bold,
                color: Colors.black,
                decoration: TextDecoration.none,
              ),),
                Text(product.brand,style: const TextStyle(
                  fontSize: 30,
                  fontWeight: FontWeight.bold,
                  color: Colors.black,
                  decoration: TextDecoration.none,
                ),),
                Text(product.description,style: const TextStyle(
                  fontSize: 15,
                  fontWeight: FontWeight.normal,
                  color: Colors.grey,
                  decoration: TextDecoration.none,
                ),),
                const Spacer(),
                Text(product.isnegotiable?"The product is negotiable":"The product is not Negotiable",style: TextStyle(
                  fontSize: 25,
                  fontWeight: FontWeight.normal,
                  color: product.isnegotiable?Colors.green:Colors.red,
                  decoration: TextDecoration.none,
                ),),
                Text("\$${product.price.toString()}",style: const TextStyle(
                  fontSize: 60,
                  fontWeight: FontWeight.bold,
                  color: Colors.black,
                  decoration: TextDecoration.none,
                ),),
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.blue,
                    minimumSize: const Size.fromHeight(50), // NEW
                  ),
                  onPressed: () {
                    widget.cart[index]=(widget.cart[index]??0)+1;
                    },
                  child: const ListTile(
                    leading: Icon(Icons.add_shopping_cart),
                    iconColor: Colors.white,

                    title: Text(
                      'Add to Cart',
                      style: TextStyle(fontSize: 24,color: Colors.white),
                    ),
                  ),
                ),
              ],
            ),
          ),
        )
      ],
    );
  }
}
