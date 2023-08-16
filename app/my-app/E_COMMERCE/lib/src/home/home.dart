import 'dart:convert';
import 'dart:math';

import 'package:e_commerce/src/home/Advertisement.dart';
import 'package:e_commerce/src/home/individual.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import '../Product.dart';
class Home extends StatefulWidget {
  final List<Image> advertisement;
  const Home({super.key,required this.advertisement});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  _HomeState(){
    get();
  }
  List<Product> products=[];
  Future<void> get()async{
    try{
      var response =await http.get(Uri.parse("https://marketplace-1-b3203472.deta.app/search/featured"));
      if(response.statusCode==200){
        var data = jsonDecode(response.body);
        // Assuming the response is a list of products
        List<Product> fetchedProducts = [];
        for (var item in data) {
          fetchedProducts.add(Product(item['title'],item['description'],item['category'],Image(image:NetworkImage(item['img_url']??"https://assets.myntassets.com/h_1440,q_100,w_1080/v1/assets/images/9690967/2020/3/20/fd04d1d1-bdbf-483f-863a-7b7ab70437dc1584705981436-Mast--Harbour-Men-Brown-Solid-Bomber-Jacket-4101584705978988-1.jpg")),item['price'].toDouble(),item['isNegotiable']));
        }

        setState(() {
          products = fetchedProducts;
        });
      }
      else{
        print("error");
      }
    }
    catch(error){
      print("Error:$error");
    }
  }
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
                    arguments:products[index],
                  );}, child: Individual(product: products[index],isfavourite: false,));
                } else {
                  next=index+2+Random().nextInt(3);
                  return Wrap(spacing: 40,
                      runSpacing: 20,
                      direction: Axis.horizontal,children: [GestureDetector(onTap:(){Navigator.pushNamed(context,"/product",
                        arguments:index,
                      );},child: Individual(product: products[index],isfavourite: false,)),Advertisement(advertisement: widget.advertisement)]);
                }
              }),
            ),
          ],
        ),
      ),
      floatingActionButton:FloatingActionButton(
        child: const Icon(Icons.shopping_cart),
        onPressed: (){Navigator.pushNamed(context, '/cart');},
      ),
    );
  }
}

