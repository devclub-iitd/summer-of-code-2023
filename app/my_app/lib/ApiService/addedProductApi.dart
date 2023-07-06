

import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:my_app/Utils/constants.dart';
import 'package:http/http.dart' as http;
import '../Models/AddedProduct.dart';
import '../Utils/widgets.dart';
import '../homepage.dart';

class MyProductApi{
  Constants constants=Constants();
  Future<List<AddedProduct>> getMyProducts(String id)async{
    List<Map<String,dynamic>> list=[];
    final response=await http.get(Uri.parse("${constants.apiUri}/api/products/$id"));
    if(response.statusCode==200){
      final parsed=jsonDecode(response.body).cast<Map<String,dynamic>>();
      return parsed.map<AddedProduct>((json)=>
          AddedProduct.fromJson(json)).toList();
    }else{
      return [];
    }

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
    required String image,}) async{
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

  void deleteProduct({
    required BuildContext context,
    required String id,}) async{
    try{

      http.Response response=await http.post(Uri.parse("${constants.apiUri}/api/addProduct"),
          body: jsonEncode({"id":id}),
          headers: <String,String>{
            'content-Type':'application/json; charset=UTF-8'
          });
      if (response.statusCode==200){
        showSnakbar(context,Colors.green, "product removed");
      }else{
        showSnakbar(context, Colors.red, jsonDecode(response.body)["error"]);
      }
    }catch(e){
      showSnakbar(context, Colors.red, e.toString());
    }

  }

  void updateMyproduct({
    required BuildContext context,
    required String id,
    required String userId,
    required String title,
    required String category,
    required String desc,
    required String price,
    required String location,
    required bool isNegotiable,
    required String image,}) async{
    try{
      AddedProduct addedProduct=AddedProduct(id,userId, title,category, desc, price, location, isNegotiable, image);

      http.Response response=await http.post(Uri.parse("${constants.apiUri}/api/editProduct/$id"),
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