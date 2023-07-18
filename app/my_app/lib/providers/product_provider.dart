
import 'dart:collection';
import 'package:flutter/cupertino.dart';
import 'package:my_app/Models/AddedProduct.dart';


class ProductProvider extends ChangeNotifier{
  List<AddedProduct> list=[];
  int cartLength=0;
  UnmodifiableListView<AddedProduct> get products=>UnmodifiableListView(list);
  get size=>list.length;

  Map<String,dynamic> user={};




  void setList(List<AddedProduct> cartList){
    list=cartList;
    notifyListeners();
  }
  void setCartLength(int length){
    cartLength=length;
    notifyListeners();
  }
  void setUser(Map<String,dynamic> map){
    user=map;
    notifyListeners();
  }
}