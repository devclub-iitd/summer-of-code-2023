import 'package:e_commerce/src/Cart/Cart.dart';
import 'package:e_commerce/src/Form/form.dart';
import 'package:e_commerce/src/IndividualProduct/IndividualProject.dart';
import 'package:e_commerce/src/Product.dart';
import 'package:e_commerce/src/home/Advertisement.dart';
import 'package:e_commerce/src/home/home.dart';
import 'package:flutter/material.dart';
import 'package:e_commerce/data.dart';
void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    Data data=Data();
    return MaterialApp(
      title: 'Flutter Demo',
      initialRoute: '/',
      routes: {
        '/':(context)=>Home(products:data.products,advertisement: data.advertisement,),
        '/add_product':(context)=>MakeForm(products: data.products),
        '/product':(context)=>IndividualProduct(cart: data.cart,),
        '/cart':(context)=>Cart(cart:data.cart),
      },
    );
  }
}
class Trial extends StatelessWidget {
  const Trial({super.key});

  @override
  Widget build(BuildContext context) {
    Data data=Data();
    Product product=data.product;
    List<Product> products=[];
    for(int i=1;i<=10;i++) {
      products.add(product);
    }
    List<Image> advertisement=data.advertisement;
    return MakeForm(products: data.products,);
  }
}
