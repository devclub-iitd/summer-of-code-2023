
import 'dart:collection';


import 'package:flutter/cupertino.dart';

import 'Models/Product.dart';

class ProductProvider extends ChangeNotifier{
  List<Product> list=[];
  UnmodifiableListView<Product> get products=>UnmodifiableListView(list);
  get size=>list.length;

  void addProduct(Product product){
    list.add(product);
    notifyListeners();
  }
  void removeProduct(Product product){
    list.remove(product);
    notifyListeners();
  }
}