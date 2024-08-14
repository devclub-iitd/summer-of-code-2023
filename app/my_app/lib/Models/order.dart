

import 'package:my_app/Models/AddedProduct.dart';

class Order{
  final String id;
  final List<AddedProduct> products;
  final List<int> quantity;
  final String address;
  final int orderedAt;
  final int status;
  final int totalPrice;

  Order(this.id, this.products, this.quantity, this.address,
      this.orderedAt, this.status, this.totalPrice);


  factory Order.fromJson(Map<String,dynamic> json){
    return Order(json["_id"], getproducts(json["products"])[0], getproducts(json["products"])[1], json['address'],json["orderedAt"], json['status'],  int.parse(json['totalPrice']));

  }





}
List getproducts(List<dynamic> json){
  List<AddedProduct> products=[];
  List<int> quantities=[];
  for (var i=0;i<json.length;i++){
    Map<String,dynamic> product1=json[i]["product"];
    int qty=json[i]['quantity'];
    AddedProduct addedProduct=AddedProduct.fromJson(product1);
    products.add(addedProduct);
    quantities.add(qty);
  }
  return [products,quantities];
}