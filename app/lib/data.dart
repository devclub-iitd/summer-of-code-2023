import 'package:flutter/material.dart';

import 'package:e_commerce/src/Product.dart';

class Data{
  Product product=Product("name", "description", "brand", const Image(image: NetworkImage("https://assets.myntassets.com/h_1440,q_100,w_1080/v1/assets/images/9690967/2020/3/20/fd04d1d1-bdbf-483f-863a-7b7ab70437dc1584705981436-Mast--Harbour-Men-Brown-Solid-Bomber-Jacket-4101584705978988-1.jpg"),), 1000,false);
  List<Product> products=[];
  Map<int,int> cart={};
  List<Image> advertisement=[Image(image: NetworkImage("https://study.com/cimages/multimages/16/burgerad15179945781952220614.png")),Image(image: NetworkImage("https://upload.wikimedia.org/wikipedia/commons/thumb/6/63/7_Up_-_You_like_it%2C_it_likes_you%2C_1948.jpg/1200px-7_Up_-_You_like_it%2C_it_likes_you%2C_1948.jpg"))];
  Data(){
    for(int i=1;i<=10;i++) {
      products.add(product);
    }
  }
}