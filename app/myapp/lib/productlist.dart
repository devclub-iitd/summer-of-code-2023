import 'package:flutter/material.dart';
import 'product_tile_collection.dart';
import 'product.dart';
import 'storage.dart';

class ProductListingScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Product Listings'),
      ),
      body: ProductTileCollection()
    );
  }
}