import 'package:flutter/material.dart';
import 'product_tile.dart';
import 'product.dart';
import 'apiservice.dart';
import 'promoted_product_banners.dart';
import 'post_products.dart';
import 'cart.dart';
class ProductTileCollection extends StatefulWidget {
  @override
  _ProductTileCollectionState createState() => _ProductTileCollectionState();
}

class _ProductTileCollectionState extends State<ProductTileCollection> {
  List<Product> products = [];

  @override
  void initState() {
    super.initState();
    _updateParentState();
  }

  Future<void> _updateParentState() async {
    try {
      List<Product> fetchedProducts = await ApiService.fetchProducts();
      setState(() {
        products = fetchedProducts;
      });
    } catch (e) {
      // Handle any error that occurred during product fetching
      print('Error: $e');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Product Listings'),
      ),
      body: Column(
        children: [
          PromotedProductBanners(),
          const Padding(
            padding: EdgeInsets.all(12.0),
            child: Center(
              child: Text(
                'Items You Need!',
                style: TextStyle(
                  fontFamily: 'Cupertino',
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ),
          Expanded(
            child: GridView.builder(
              itemCount: products.length,
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                mainAxisSpacing: 5,
                crossAxisSpacing: 0,
                childAspectRatio: 0.82,
              ),
              itemBuilder: (BuildContext context, int index) {
                return ProductTile(
                  product: products[index],
                  onUpdateParentState: _updateParentState,
                );
              },
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
                          builder: (context) => Cart(),
                        ),
                      );
                    },
                    child: Text('View Cart'),
                  ),
                ),
                SizedBox(width: 16),
                Expanded(
                  child: ElevatedButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => PostProductForm(addit:"Add",onUpdateParentState: _updateParentState,),
                        ),
                      );
                    },
                    child: Text('Add your Product'),
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
