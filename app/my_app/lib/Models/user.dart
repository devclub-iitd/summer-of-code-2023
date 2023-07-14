

import 'dart:convert';

class User{
  final String id;
  final String name;
  final String email;
  final String password;
  final String phone;
  final String address;
  final String image;
  final List<dynamic> suggestion;




  User(this.id, this.name, this.email, this.password,this.phone, this.address,
      this.image,this.suggestion);

  factory User.fromJson(Map<String,dynamic> json){
    return User(json["_id"], json["name"], json["email"], json['password'],json["phone"], json['address'],  json['image'],json['suggestion']);

  }
  Map<String,dynamic> toMap(){
    return {
      "name":name,
      "email":email,
      "password":password,
      "phone":phone,
      "address":address,
      "image":image
    };

  }

  String toJson() => jsonEncode(toMap());

}