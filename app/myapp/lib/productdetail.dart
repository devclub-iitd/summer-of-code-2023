import 'storage.dart';
import 'package:flutter/material.dart';
import 'product.dart';
import 'cart.dart';
class ProductDetailsScreen extends StatelessWidget {
  final Product product;
  final Function() onUpdateParentState;
  ProductDetailsScreen({required this.product, required this.onUpdateParentState});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Product Details'),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(
            child: Center(
              child: Image.asset(product.image),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  product.title,
                  style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                ),
                SizedBox(height: 8),
                Text(
                  '\$${product.price.toStringAsFixed(2)}',
                  style: TextStyle(fontSize: 18),
                ),
                SizedBox(height: 8),
                Text(
                  product.description,
                  style: TextStyle(fontSize: 16),
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Row(
              children: [
                Expanded(
                  child: ElevatedButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => Cart(product: product),
                        ),
                      );
                    },
                    child: Text('Add to Cart'),
                  ),
                ),
                SizedBox(width: 16),
                Expanded(
                  child: ElevatedButton(
                    onPressed: () {
                      onUpdateParentState();
                      if (!Storage.favorites.contains(product))
                      {Storage.favorites.insert(0,product);}
                    },
                    child: Text('Add to Favorites'),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
