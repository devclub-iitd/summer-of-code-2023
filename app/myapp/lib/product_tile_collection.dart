import 'package:flutter/material.dart';
import 'product_tile.dart';
import 'productdetail.dart';
import 'product.dart';
import 'cart.dart';
import 'storage.dart';
import 'post_products.dart';
import 'promoted_product_banners.dart';
class ProductTileCollection extends StatefulWidget {
  @override
  _ProductTileCollectionState createState() => _ProductTileCollectionState();
}

class _ProductTileCollectionState extends State<ProductTileCollection> {
  void _updateParentState() {
    setState(() {
    });
  }
  final double height = 200;
  final double width = 150;
  @override
  Widget build(BuildContext context) {
    return ListView(
      children: [
        PromotedProductBanners(),
        Visibility(
          visible: Storage.favorites.isNotEmpty,
          child: Padding(
            padding: const EdgeInsets.all(12.0),
            child: Center(
              child: Text(
                'Your Favorites!',
                style: TextStyle(
                  fontFamily: 'Cupertino',
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ),
        ),

        Visibility(
          visible: Storage.favorites.isNotEmpty,
          child: SizedBox(
            height: height, // Set a specific height for the first ListView.builder
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: Storage.favorites.length,
              itemBuilder: (BuildContext context, int index) {
                return GestureDetector(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => ProductDetailsScreen(product: Storage.favorites[index],onUpdateParentState: _updateParentState,),
                      ),
                    );
                  },
                  child: SizedBox(
                    width: width, // Specify the desired width for the tile
                    child: ProductTile(product: Storage.favorites[index],onUpdateParentState: _updateParentState,),
                  ),
                );
              },
            ),
          ),
        ),
        SizedBox(height: 8.0),
        Padding(
          padding: const EdgeInsets.all(12.0),
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
        SizedBox(
          height: height, // Set a specific height for the second ListView.builder
          child: ListView.builder(
            scrollDirection: Axis.horizontal,
            itemCount: Storage.products.length,
            itemBuilder: (BuildContext context, int index) {
              return GestureDetector(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => ProductDetailsScreen(product: Storage.products[index],onUpdateParentState: _updateParentState,),
                    ),
                  );
                },
                child: SizedBox(
                  width: width, // Specify the desired width for the tile
                  child: ProductTile(product: Storage.products[index],onUpdateParentState: _updateParentState,),
                ),
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
                        builder: (context) => PostProductForm(),
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

    );
  }
}
