

import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:my_app/Utils/widgets.dart';

import '../Models/AddedProduct.dart';
import '../Models/order.dart';
import '../Utils/constants.dart';
import 'package:http/http.dart' as http;

class OrderApi{
  Constants constants=Constants();
  Future<List<Order>> getMyOrders(String email,BuildContext context) async{

    try{
      List<Order> list=[];
      final response=await http.get(Uri.parse("${constants.apiUri}/api/my-orders/$email"));
      if(response.statusCode==200){

        for (var i=0;i<jsonDecode(response.body).length;i++){
          List orders=jsonDecode(response.body)[i]["products"];
          List<AddedProduct> products=[];
          List<int> qty=[];
          for(var j=0;j<orders.length;j++){
            Map<String,dynamic> json=orders[j]["product"];
            AddedProduct addedProduct=AddedProduct.fromJson(json);
            int count=orders[j]['quantity'];
            qty.add(count);
            products.add(addedProduct);
          }
          Map<String,dynamic> singleOrder=jsonDecode(response.body)[i];

          Order order=Order(singleOrder["_id"], products, qty, singleOrder["address"], singleOrder["orderedAt"], singleOrder["status"], int.parse(singleOrder["totalPrice"]));

          list.add(order);
        }

        return list;

      }else if(response.statusCode==400){
        return [];
      }else{
        showSnakbar(context, Colors.red,jsonDecode(response.body)["error"]);
        return [];
      }

    }catch(e){
      showSnakbar(context, Colors.red, e.toString());
      return [];
    }
  }

  Future<Order> placeOrderFromCart({
    required BuildContext context,
    required String email,
    required String price,
    required String address,

  }) async{
    try{

      http.Response response=await http.post(Uri.parse("${constants.apiUri}/api/order-from-cart"),
          body: jsonEncode({
            "email":email,
            "price":price,
            "address":address
          },),
          headers: <String,String>{
            'content-Type':'application/json; charset=UTF-8'
          }
      );

      if(response.statusCode==200){
        return Order.fromJson(jsonDecode(response.body));
      }
      else{
        print(jsonDecode(response.body)["error"].toString());
        showSnakbar(context,Colors.red, jsonDecode(response.body)["error"]);
        return Order("", [], [], "", 0, 0, 0);
      }

    }catch(e){
      print(e.toString());
      return Order("", [], [], "", 0, 0, 0);
    }
  }

  Future<Order> placeSingleOrder({
    required BuildContext context,
    required String email,
    required String id,
    required String address,

  }) async{
    try{

      http.Response response=await http.post(Uri.parse("${constants.apiUri}/api/order-single-product"),
          body: jsonEncode({
            "email":email,
            "address":address,
            "id":id

          },),
          headers: <String,String>{
            'content-Type':'application/json; charset=UTF-8'
          }
      );

      if(response.statusCode==200){
        return Order.fromJson(jsonDecode(response.body));
      }
      else{
        showSnakbar(context,Colors.red, jsonDecode(response.body)["error"]);
        return Order("", [], [], "", 0, 0, 0);
      }

    }catch(e){
      showSnakbar(context,Colors.red, e.toString());
      return Order("", [], [], "", 0, 0, 0);
    }
  }


  Future<bool> cancelOrder({
    required String id,
})async{
    http.Response response=await http.post(Uri.parse("${constants.apiUri}/api/cancel-order/$id"),
        headers: <String,String>{
          'content-Type':'application/json; charset=UTF-8'
        }
    );

    if(response.statusCode==200){
      return true;
    }else{
      return false;
    }
  }




}