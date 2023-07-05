
import 'dart:convert';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import '../Models/AddedProduct.dart';
import '../Utils/constants.dart';
import '../Utils/widgets.dart';

class CartApiService{
  Constants constants=Constants();


  Future<List<AddedProduct>> getMyCart(String id,BuildContext context) async{

    List<AddedProduct> list=[];
    final response=await http.get(Uri.parse("${constants.apiUri}/api/cart/$id"));
    if(response.statusCode==200){
      for (var i=0;i<jsonDecode(response.body).length;i++){
        Map<String,dynamic> json=jsonDecode(response.body)[i]["product"];
        AddedProduct addedProduct=AddedProduct.fromJson(json);
        list.add(addedProduct);
      }
      return list;
    }else if(response.statusCode==400){
      return [];
    }else{
      showSnakbar(context, Colors.red, jsonDecode(response.body)['error']);
      return [];

    }

  }

  void addTocart({
    required BuildContext context,
    required String userId,
    required String id,
    required int quantity
  }) async{
    try{

      http.Response response=await http.post(Uri.parse("${constants.apiUri}/api/addToCart"),
          body: jsonEncode({
            "userId":userId,
            "id":id,
            "quantity":quantity
          },),
          headers: <String,String>{
            'content-Type':'application/json; charset=UTF-8'
          }
      );
      if (response.statusCode==200){
        showSnakbar(context,Colors.green, "added to cart");
      }else if(response.statusCode==400){
        showSnakbar(context,Colors.red, jsonDecode(response.body)["msg"]);
      }
      else{
        showSnakbar(context, Colors.red, jsonDecode(response.body)["error"]);
      }
    }catch(e){
      showSnakbar(context, Colors.red, e.toString());
    }

  }

  void removeFromCart({
    required BuildContext context,
    required String userId,
    required String id,
  }) async{
    try{

      http.Response response=await http.post(Uri.parse("${constants.apiUri}/api/remove-from-cart"),
          body: jsonEncode({
            "userId":userId,
            "id":id
          },),
          headers: <String,String>{
            'content-Type':'application/json; charset=UTF-8'
          }
      );
      if (response.statusCode==200){
        showSnakbar(context,Colors.green, "removed to cart");
      }else if(response.statusCode==400){
        showSnakbar(context,Colors.red, jsonDecode(response.body)["msg"]);
      }
      else{
        showSnakbar(context, Colors.red, jsonDecode(response.body)["error"]);
      }
    }catch(e){
      showSnakbar(context, Colors.red, e.toString());
    }

  }
}