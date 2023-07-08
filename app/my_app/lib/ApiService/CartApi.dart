
import 'dart:convert';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:my_app/Models/cartItem.dart';
import '../Models/AddedProduct.dart';
import '../Utils/constants.dart';
import '../Utils/widgets.dart';

class CartApiService{
  Constants constants=Constants();

  Future<List> getMyCart(String id,BuildContext context) async{

    try{
      List<CartItem> list=[];
      final response=await http.get(Uri.parse("${constants.apiUri}/api/cart/$id"));
      if(response.statusCode==200){
        int price=0;
        int cartLength=0;
        for (var i=0;i<jsonDecode(response.body).length;i++){
          Map<String,dynamic> json=jsonDecode(response.body)[i]["product"];
          int qty=jsonDecode(response.body)[i]['quantity'];
          AddedProduct addedProduct=AddedProduct.fromJson(json);

          price+=qty*(int.parse(addedProduct.price.split(".")[0]).toInt());
          cartLength+=qty;
          CartItem cartItem=CartItem(addedProduct, qty);
          list.add(cartItem);
        }
        return [list,price,cartLength];
      }else if(response.statusCode==400){
        return [[],0,0];
      }else{
        return [[],0,0];

      }
    }catch(e){
      showSnakbar(context, Colors.red, e.toString());
      return [];
    }



  }

  Future<bool> addTocart({
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
        return true;
      }else if(response.statusCode==400){
        showSnakbar(context,Colors.red, jsonDecode(response.body)["msg"]);
        return false;
      }
      else{
        showSnakbar(context, Colors.red, jsonDecode(response.body)["error"]);
        return false;
      }
    }catch(e){
      showSnakbar(context, Colors.red, e.toString());
      return false;
    }

  }

  Future<bool> removeFromCart({
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
        showSnakbar(context,Colors.green, "removed from cart");
        return true;
      }else if(response.statusCode==400){
        showSnakbar(context,Colors.red, jsonDecode(response.body)["msg"]);
        return false;

      }
      else{
        showSnakbar(context, Colors.red, jsonDecode(response.body)["error"]);
        return false;
      }

    }catch(e){

      showSnakbar(context, Colors.red, e.toString());
      return false;
    }

  }
}