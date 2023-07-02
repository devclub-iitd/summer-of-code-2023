import 'storage.dart';
import 'package:flutter/material.dart';
import 'product.dart';

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
      widget.onUpdateParentState();
    });
  }
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        width: double.infinity,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
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
            SizedBox(height: 8),
            Center(child: Text(widget.product.title, style: TextStyle(fontWeight: FontWeight.bold))),
            SizedBox(height: 4),
            Center(child: Text('\$${widget.product.price.toStringAsFixed(2)}')),
          ],
        ),
      ),
    );
  }
}
