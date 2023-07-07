
import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:my_app/Utils/widgets.dart';

import '../Models/AddedProduct.dart';
import '../Utils/constants.dart';

class SearchApi{

  Constants constants=Constants();
  Future<List<AddedProduct>> getSearchedProducts(String query,BuildContext context)async{
    try{
      List<Map<String,dynamic>> list=[];
      final response=await http.get(Uri.parse("${constants.apiUri}/api/search/$query"));
      if(response.statusCode==200){
        final parsed=jsonDecode(response.body).cast<Map<String,dynamic>>();
        return parsed.map<AddedProduct>((json)=>
            AddedProduct.fromJson(json)).toList();
      }else{
        return [];
      }

    }catch(e){
      showSnakbar(context, Colors.red, e.toString());
      return [];

    }

  }
}