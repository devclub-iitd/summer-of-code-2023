
import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:my_app/Models/AddedProduct.dart';
import 'package:my_app/Models/user.dart';
import 'package:my_app/Utils/constants.dart';
import 'package:my_app/Utils/widgets.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../Models/Product.dart';
import 'package:http/http.dart' as http;

import '../homepage.dart';
import '../providers/userProvider.dart';


class ApiService{
  Constants constants=Constants();
  List<Product> getProducts(String res){

    final parsed=jsonDecode(res).cast<Map<String,dynamic>>();
    return parsed.map<Product>((json)=>
        Product.fromJson(json)).toList();
  }


  Future<List<Product>>fetchProduct() async{
    final response=await http.get(Uri.parse("https://fakestoreapi.com/products"));
    return getProducts(response.body);
  }



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
      if(response.statusCode==200){
        final parsed=jsonDecode(response.body).cast<Map<String,dynamic>>();
        return parsed.map<AddedProduct>((json)=>
            AddedProduct.fromJson(json)).toList();
      }else{
        return [];
      }

  }


  Future<User> signUP({
    required BuildContext context,
    required String name,
    required String email,
    required String password,

  }) async{
    try{
      User user=User('', name, email, password, '', [], '',[]);

      http.Response response=await http.post(Uri.parse("${constants.apiUri}/api/signUp"),
          body: user.toJson(),
          headers: <String,String>{
            'content-Type':'application/json; charset=UTF-8'
          });
      if (response.statusCode==200){
        User user=User.fromJson(jsonDecode(response.body));
        showSnakbar(context,Colors.green, "account created");
        return user;
      }else if(response.statusCode==400){
        showSnakbar(context, Colors.red, jsonDecode(response.body)['msg']);
        User user=User('', '', '', '', '', [], '',[]);
        return user;
      }else{
        showSnakbar(context, Colors.red, jsonDecode(response.body)["error"]);
        User user=User('', '', '', '', '', [], '',[]);
        return user;
      }
    }catch(e){
      showSnakbar(context, Colors.red, e.toString());
      User user=User('', '', '', '', '', [], '',[]);
      return user;
    }

  }

  void signIn({
    required BuildContext context,
    required String email,
    required String password,

  }) async{
    try{

      http.Response response=await http.post(Uri.parse("${constants.apiUri}/api/signIn"),
          body: {"email":email,"password":password},
          headers: <String,String>{
            'content-Type':'application/json; charset=UTF-8'
          });
      if (response.statusCode==200){
        SharedPreferences prefs = await SharedPreferences.getInstance();
        Provider.of<UserProvider>(context, listen: false).setUser(jsonDecode(response.body));
        await prefs.setString('x-auth-token', jsonDecode(response.body)['token']);
        Navigator.of(context).pushAndRemoveUntil(MaterialPageRoute(
            builder: (context) =>  const HomePage()), (Route route) => false);
      }else if(response.statusCode==400){
        showSnakbar(context, Colors.red, jsonDecode(response.body)['msg']);
      }else{
        showSnakbar(context, Colors.red, jsonDecode(response.body)["error"]);
      }
    }catch(e){
      showSnakbar(context, Colors.red, e.toString());
    }

  }


  void getUserData(
      BuildContext context,
      ) async {
    try {
      SharedPreferences prefs = await SharedPreferences.getInstance();
      String? token = prefs.getString('x-auth-token');

      if (token == null) {
        prefs.setString('x-auth-token', '');
      }

      var tokenRes = await http.post(
        Uri.parse('${constants.apiUri}/tokenValid'),

        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8',
          'x-auth-token': token!
        },
      );

      var response = jsonDecode(tokenRes.body);

      if (response == true) {
        http.Response userRes = await http.get(
          Uri.parse('${constants.apiUri}/authorized-User'),
          headers: <String, String>{
            'Content-Type': 'application/json; charset=UTF-8',
            'x-auth-token': token
          },
        );

        var userProvider = Provider.of<UserProvider>(context, listen: false);
        userProvider.setUser(jsonDecode(userRes.body));
      }
    } catch (e) {
      showSnakbar(context, Colors.red, e.toString());
    }
  }



  void  addTowishlist({
    required String email,
    required String id,}) async{
    try{

      http.Response response=await http.post(Uri.parse("${constants.apiUri}/api/addtowishlist"),
          body:jsonEncode({
            "email":email,
            "id":id
          }),
          headers: <String,String>{
            'content-Type':'application/json; charset=UTF-8'
          });

    }catch(e){
      print(e.toString());
    }

  }
  Future<bool> isInWishlist(String id,String email) async{
    try{
      final response=await http.post(Uri.parse("${constants.apiUri}/api/isInWishlist"),
          body: jsonEncode({
            "email":email,
            "id":id,
          }),
          headers: <String,String>{
            'content-Type':'application/json; charset=UTF-8'
          });

      if(response.statusCode==200){
        return true;
      }else{
        return false;
      }
    }catch(e){
      return false;
    }
  }



  Future<bool> updateAddress({
    required BuildContext context,
    required String email,
    required String name,
    required List address,
    required String image,
    required String phone

  }) async{
    try{

      http.Response response=await http.post(Uri.parse("${constants.apiUri}/api/update-user"),
          body: jsonEncode({
            "email":email,
            "address":address,
            "name":name,
            "image":image,
            "phone":phone,
          }),
          headers: <String,String>{
            'content-Type':'application/json; charset=UTF-8'
          });
      if (response.statusCode==200){
        showSnakbar(context,Colors.green, "details updated");
        return true;
      }else if(response.statusCode==400){
        showSnakbar(context, Colors.red, "400");
        return false;
      }else{
        showSnakbar(context, Colors.red, jsonDecode(response.body)['error']);
        return false;
      }
    }catch(e){
      showSnakbar(context, Colors.red, e.toString());
      return false;
    }

  }


  Future<User> authorizedUser({required String email, required BuildContext context}) async{
    try{
      final response=await http.get(Uri.parse("${constants.apiUri}/user/$email"));
      if(response.statusCode==200){
        User user=User.fromJson(jsonDecode(response.body));
        Provider.of<UserProvider>(context, listen: false).setUserFromModel(user);
        return user;
      }else if(response.statusCode==400){
        User user=User('', '', '', '', '', [], '',[]);
        return user;
      }else{
        showSnakbar(context, Colors.blue, jsonDecode(response.body)["error"]);
        User user=User('', '', '', '', '', [], '',[]);
        return user;
      }
    }catch(e){
      showSnakbar(context, Colors.red, e.toString());
      print(e.toString());
      User user=User('', '', '', '', '', [], '',[]);
      return user;
    }


  }






}




