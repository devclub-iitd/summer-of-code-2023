
import 'package:e_commerce/data.dart';
import 'package:e_commerce/src/Product.dart';
import 'package:flutter/material.dart';

class Cart extends StatefulWidget {
  final Map<int,int> cart;
  const Cart({super.key,required this.cart});

  @override
  State<Cart> createState() => _CartState();
}

class _CartState extends State<Cart> {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(20),
      child: Table(
        children: [
          TableRow(children:[ Container(child:const Text("Title",style:TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 30,
              decoration: TextDecoration.none,
              color: Colors.black
          ),)),
            Container(child:const Text("Quantity",style:TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 30,
                decoration: TextDecoration.none,
                color: Colors.black
            ),)),
            Container(child:const Text("Final Price",style:TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 30,
                decoration: TextDecoration.none,
                color: Colors.black
            ),)),
            Container(child:const Text("",style:TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 20,
                decoration: TextDecoration.none,
                color: Colors.black
            ),))
          ])
          ,
          ...widget.cart.keys.map((key) {
            Product product = Data().products[key];
            return TableRow(
              children: [
                Container(
                  child:Text(product.name,style:TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 20,
                    decoration: TextDecoration.none,
                    color: Colors.grey[600]
                  ),)
                ),
                Container(
                  child:Text((widget.cart[key]??0).toString(),style:TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 20,
            decoration: TextDecoration.none,
            color: Colors.grey[600]
            ),),
                ),
                Container(
                  child:Text("\$${product.price*(widget.cart[key]??0)}",style:TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 20,
                      decoration: TextDecoration.none,
                      color: Colors.grey[600]
                  ),)
                ),
                Container(
                  child: TextButton(
                    child:Text("Remove from Cart"),
                    style: ButtonStyle(
                      foregroundColor: MaterialStateProperty.all<Color>(Colors.blue),
                    ),
                    onPressed: () { setState(() {
                      widget.cart.remove(key);
                    });},
                  ),
                )
              ],
            );
          }),
        ],
      ),
    );
  }
}
