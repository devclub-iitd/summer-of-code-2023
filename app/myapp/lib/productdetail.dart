import 'package:myapp/apiservice.dart';

import 'storage.dart';
import 'package:flutter/material.dart';
import 'product.dart';
import 'cart.dart';
import 'post_products.dart';
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
              child: Image.network(product.image),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Center(
                  child: Text(
                    product.title,
                    style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                  ),
                ),
                SizedBox(height: 8),
                Center(
                  child: Text(
                    '\$${product.price.toStringAsFixed(2)} ${product.isNegotiable ? "" : "Not"} Negotiable',
                    style: TextStyle(fontSize: 18),
                  ),
                ),
                SizedBox(height: 8),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text('Location: \t${product.location}',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
    ),
                    Text('Category: \t${product.category}',
                      style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                    )
                  ],
                ),
                SizedBox(height: 8),
                Text(
                  '${product.description}\n',
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
                          builder: (context) => PostProductForm(addit: "Edit", onUpdateParentState: onUpdateParentState,product:product),
                        ),
                      );
                    },
                    child: Text('Edit Product'),
                  ),
                ),
                SizedBox(width: 16),
                Expanded(
                  child: ElevatedButton(
                    onPressed: () {
                      ApiService.deleteProduct(product.id).then((value) {
                        Navigator.pop(context);
                        onUpdateParentState();
                      });
                    },
                    style: ElevatedButton.styleFrom(backgroundColor: Colors.red),
                    child: Text('Delete Product'),
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
