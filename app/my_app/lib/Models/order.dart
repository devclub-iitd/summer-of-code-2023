

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



}