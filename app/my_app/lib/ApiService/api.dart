
import 'dart:convert';

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
}

