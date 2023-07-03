
import 'dart:convert';

class AddedProduct{
  final String userId;
  final String title;
  final String category;
  final String desc;
  final String price;
  final String location;
  final bool isNegotiable;
  final String image;

  AddedProduct(this.userId, this.title,this.category, this.desc, this.price, this.location,
      this.isNegotiable, this.image);
  factory AddedProduct.fromJson(Map<String,dynamic> json){
    return AddedProduct(json["userId"], json["title"],json["category"], json["desc"], json["price"], json["location"], json["isNegotiable"], json["image"]);
  }

  Map<String,dynamic> toMap(){
    return {
      "userId":userId,
      "title":title,
      "category":category,
      "desc":desc,
      "price":price,
      "location":location,
      "isNegotiable":isNegotiable,
      "image":image
    };

  }

  String toJson() => jsonEncode(toMap());
}