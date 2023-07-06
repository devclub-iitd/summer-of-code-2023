
import 'dart:collection';
import 'package:flutter/cupertino.dart';
import 'package:my_app/Models/AddedProduct.dart';


class ProductProvider extends ChangeNotifier{
  List<AddedProduct> list=[];
  UnmodifiableListView<AddedProduct> get products=>UnmodifiableListView(list);
  get size=>list.length;

  void addProduct(AddedProduct product){
    list.add(product);
    notifyListeners();
  }
  void removeProduct(AddedProduct product){
    list.remove(product);
    notifyListeners();
  }
  void setList(List<AddedProduct> cartList){
    list=cartList;
    notifyListeners();
  }
}