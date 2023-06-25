import 'package:flutter/material.dart';
import 'productdetail.dart';
import 'product.dart';
import 'storage.dart';

class ProductListingScreen extends StatelessWidget {
  final List<Product> products = ProductData.products;
  final ScrollController _scrollController = ScrollController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Product Listings'),
      ),
      body: Scrollbar(
        controller: _scrollController,
        thumbVisibility: true,
        thickness: 8,
        radius: Radius.circular(4.0),
        trackVisibility: true,
        child: ListView.builder(
          controller: _scrollController,
          itemCount: products.length,
          itemBuilder: (BuildContext context, int index) {
            return GestureDetector(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => ProductDetailsScreen(product: products[index]),
                  ),
                );
              },
              child: Card(
                child: ListTile(
                  leading: Image.asset(products[index].image),
                  title: Text(products[index].title),
                  subtitle: Text('\$${products[index].price.toStringAsFixed(2)}'),
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}