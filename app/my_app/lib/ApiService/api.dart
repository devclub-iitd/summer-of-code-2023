
import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:my_app/Models/AddedProduct.dart';
import 'package:my_app/Utils/widgets.dart';

import '../Models/Product.dart';
import 'package:http/http.dart' as http;
class ApiService{
  List<Product> getProducts(String res){

    final parsed=jsonDecode(res).cast<Map<String,dynamic>>();
    return parsed.map<Product>((json)=>
        Product.fromJson(json)).toList();
  }

  Future<List<Product>>fetchProduct() async{
    final response=await http.get(Uri.parse("https://fakestoreapi.com/products"));
    return getProducts(response.body);
  }

  List<User> get(String res){

    final parsed=jsonDecode(res).cast<Map<String,dynamic>>();
    return parsed.map<User>((json)=>
        User.fromJson(json)).toList();
  }

  Future<List<User>>getUser()async{
    final response=await http.get(Uri.parse("https://aditya-impact.onrender.com/api/users"));
    return get(response.body);
  }

  void addProduct({
    required BuildContext context,
    required String userId,
    required String title,
    required String desc,
    required String price,
    required String location,
    required bool isNegotiable,
    required String image,

}) async{
    try{
      AddedProduct addedProduct=AddedProduct(userId, title, desc, price, location, isNegotiable, image);

      http.Response response=await http.post(Uri.parse("https://aditya-impact.onrender.com/api/addProduct"),
          body: addedProduct.toJson(),
          headers: <String,String>{
            'content-Type':'application/json; charset=UTF-8'
          });
      if (response.statusCode==200){
        showSnakbar(context,Colors.green, "Product Added");
      }else{
        showSnakbar(context, Colors.red, jsonDecode(response.body)["error"]);
      }
    }catch(e){
      showSnakbar(context, Colors.red, e.toString());
    }

  }
}
class User{
  final String name;
  final String email;

  User(this.name, this.email);
  factory User.fromJson(Map<String,dynamic> json){
    return User(json["name"], json["email"]);
  }
}


