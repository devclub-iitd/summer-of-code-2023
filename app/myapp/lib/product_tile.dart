import 'cart.dart';
import 'storage.dart';
import 'package:flutter/material.dart';
import 'product.dart';
import 'productdetail.dart';
class ProductTile extends StatefulWidget {
  final Product product;
  final Function() onUpdateParentState;
  ProductTile({required this.product,required this.onUpdateParentState});

  @override
  State<ProductTile> createState() => _ProductTileState();
}

class _ProductTileState extends State<ProductTile> {
  @override
  void initState() {
    super.initState();
  }
  void toggleFavorite() {
    setState(() {
      if (Storage.favorites.contains(widget.product)) {
        Storage.favorites.remove(widget.product);
      } else {
        Storage.favorites.insert(0,widget.product);
      }
      // widget.onUpdateParentState();
    });
  }
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onLongPress:  () {
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => Cart(product: widget.product),
        ),
      );
    },
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => ProductDetailsScreen(product: widget.product,onUpdateParentState: widget.onUpdateParentState),
          ),
        );
      },
      child: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Stack(
              children: [
                Image.asset(widget.product.image),
                Positioned(
                  top: 0,
                  right: 0,
                  child: IconButton(
                    icon: Icon(
                      Storage.favorites.contains(widget.product) ? Icons.favorite : Icons.favorite_border,
                      color: Colors.red,
                    ),
                    onPressed: () {
                      toggleFavorite();
                      // Perform additional logic here
                    },
                    tooltip: Storage.favorites.contains(widget.product) ? 'Remove from favorites' : 'Add to favorites',
                  )
                ),
              ],
            ),
            Center(child: Text(widget.product.title, style: TextStyle(fontWeight: FontWeight.bold))),
            Center(child: Text('\$${widget.product.price.toStringAsFixed(2)}')),
            SizedBox(height: 5)
          ],
        ),
      ),
    );
  }
}
