
import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:my_app/Models/AddedProduct.dart';
import 'package:my_app/Utils/constants.dart';
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

  Constants constants=Constants();

  Future<List<Map<String,dynamic>>>getUser()async{
    List<Map<String,dynamic>> list=[];
    final response=await http.get(Uri.parse("${constants.apiUri}/api/users"));
    for (var i=0;i<jsonDecode(response.body).length;i++){
      list.add(jsonDecode(response.body)[i]);
    }
    return list;
  }

  Future<List<AddedProduct>> getMyProducts(String id)async{
    List<Map<String,dynamic>> list=[];
    final response=await http.get(Uri.parse("${constants.apiUri}/api/products/$id"));
    final parsed=jsonDecode(response.body).cast<Map<String,dynamic>>();
    return parsed.map<AddedProduct>((json)=>
        AddedProduct.fromJson(json)).toList();
  }

  void addProduct({
    required BuildContext context,
    required String userId,
    required String title,
    required String category,
    required String desc,
    required String price,
    required String location,
    required bool isNegotiable,
    required String image,

}) async{
    try{
      AddedProduct addedProduct=AddedProduct("",userId, title,category, desc, price, location, isNegotiable, image);

      http.Response response=await http.post(Uri.parse("${constants.apiUri}/api/addProduct"),
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




