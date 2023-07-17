

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
    List<AddedProduct> list=[];
    final response=await http.get(Uri.parse("${constants.apiUri}/api/products/$id"));
    if(response.statusCode==200){
      final parsed=jsonDecode(response.body).cast<Map<String,dynamic>>();
      return parsed.map<AddedProduct>((json)=>
          AddedProduct.fromJson(json)).toList();
    }else{
      return list;
    }

  }
  Future< List<Map<String,dynamic>>> getRecentlyViewedStores(String email) async{
    List<Map<String,dynamic>> list=[];
    final response=await http.get(Uri.parse("${constants.apiUri}/api/s-images/$email"));

    if(response.statusCode==200){
      return jsonDecode(response.body);
    }else{
      return  list;
    }
  }

  Future<List<AddedProduct>> getRecommended(String id)async{
    List<AddedProduct>list=[];
    try{

      final response=await http.get(Uri.parse("${constants.apiUri}/api/recommended/$id"));
      if(response.statusCode==200){
        final parsed=jsonDecode(response.body).cast<Map<String,dynamic>>();
        return parsed.map<AddedProduct>((json)=>
            AddedProduct.fromJson(json)).toList();
      }else{
        return list;
      }
    }catch(e){
      print(e.toString());
      return list;
    }



  }
  Future<List<AddedProduct>> getWishlist(String email,BuildContext context)async{
    try{
      final response=await http.get(Uri.parse("${constants.apiUri}/api/wishlist/$email"));
      if(response.statusCode==200){
        final parsed=jsonDecode(response.body).cast<Map<String,dynamic>>();
        return parsed.map<AddedProduct>((json)=>
            AddedProduct.fromJson(json)).toList();
      }else{
        return [];
      }
    }catch(e){
      return [];
    }



  }

  Future<List<Map<String,dynamic>>> getCategories(BuildContext context)async{
    try{
      List<Map<String,dynamic>> list=[];
      final response=await http.get(Uri.parse("${constants.apiUri}/api/categories"));
      if(response.statusCode==200){
        for (var i=0;i<jsonDecode(response.body).length;i++){
          list.add(jsonDecode(response.body)[i]);
        }
        return list;
      }else{
        showSnakbar(context, Colors.red, jsonDecode(response.body)["error"]);
        return [];
      }

    }catch(e){
      showSnakbar(context, Colors.red, e.toString());
      return [];
    }
  }

  Future<List<AddedProduct>> categoryProducts(String name)async{
    try{
      final response=await http.get(Uri.parse("${constants.apiUri}/api/category/$name"));
      if(response.statusCode==200){
        final parsed=jsonDecode(response.body).cast<Map<String,dynamic>>();
        return parsed.map<AddedProduct>((json)=>
            AddedProduct.fromJson(json)).toList();
      }else{
        return [];
      }
    }catch(e){
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

      }else if(response.statusCode==400){
        showSnakbar(context, Colors.red, jsonDecode(response.body)["msg"]);
      }else{
        showSnakbar(context, Colors.red, jsonDecode(response.body)['error']);
      }
    }catch(e){
      showSnakbar(context, Colors.red, e.toString());
    }

  }

  void  addSuggestion({
    required BuildContext context,
    required String email,
    required String category,}) async{
    try{

      http.Response response=await http.post(Uri.parse("${constants.apiUri}/api/suggestion"),
          body:jsonEncode({
            "email":email,
            "category":category
          }),
          headers: <String,String>{
            'content-Type':'application/json; charset=UTF-8'
          });

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