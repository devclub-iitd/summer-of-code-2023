import 'package:flutter/material.dart';
import 'product.dart';
import 'storage.dart';
class CartItem {
  final Product product;
  int quantity;

  CartItem({required this.product, this.quantity = 1});
}

class Cart extends StatefulWidget {
  List<CartItem> cartItems = Storage.cartItems;
  Cart({Product? product}){
    if (product != null) {
      var existingItem = cartItems.firstWhere(
            (item) => item.product == product,
        orElse: () => CartItem(product: product, quantity: 0), // Provide a default value
      );

      if (existingItem.quantity > 0) {
        // If the product is already in the cart, increase the quantity by 1
        existingItem.quantity += 1;
      } else {
        // If the product is not in the cart, add it as a new item with a quantity of 1
        existingItem.quantity = 1;
        cartItems.add(existingItem);
      }
    }
  }
  @override
  _CartState createState() => _CartState();
}

class _CartState extends State<Cart> {
  List<CartItem> cartItems = Storage.cartItems;
  void addToCart(Product product) {
    setState(() {
      // Check if the product is already in the cart
      var existingItem = cartItems.firstWhere(
            (item) => item.product == product,
        orElse: () => CartItem(product: product, quantity: 0), // Provide a default value
      );

      if (existingItem.quantity > 0) {
        // If the product is already in the cart, increase the quantity by 1
        existingItem.quantity += 1;
      } else {
        // If the product is not in the cart, add it as a new item with a quantity of 1
        existingItem.quantity = 1;
        cartItems.add(existingItem);
      }
    });
  }


  void removeItem(CartItem item) {
    setState(() {
      cartItems.remove(item);
    });
  }

  void increaseQuantity(CartItem item) {
    setState(() {
      item.quantity += 1;
    });
  }

  void decreaseQuantity(CartItem item) {
    setState(() {
      if (item.quantity > 1) {
        item.quantity -= 1;
      }
    });
  }

  double getTotalAmount() {
    double total = 0;
    for (var item in cartItems) {
      total += (item.product.price * item.quantity);
    }
    return total;
  }
  int getitemcount() {
    int total = 0;
    for (var item in cartItems) {
      total += (item.quantity);
    }
    return total;
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Cart'),
      ),
      body: Column(
        children: [
          Expanded(
            child: ListView.builder(
              itemCount: cartItems.length,
              itemBuilder: (BuildContext context, int index) {
                final cartItem = cartItems[index];

                return ListTile(
                  leading: Image.network(cartItem.product.image),
                  title: Text(cartItem.product.title),
                  subtitle: Text('\$${cartItem.product.price.toStringAsFixed(2)}'),
                  trailing: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      IconButton(
                        icon: Icon(Icons.remove),
                        onPressed: () => decreaseQuantity(cartItem),
                      ),
                      Text(cartItem.quantity.toString()),
                      IconButton(
                        icon: Icon(Icons.add),
                        onPressed: () => increaseQuantity(cartItem),
                      ),
                      IconButton(
                        icon: Icon(Icons.delete),
                        onPressed: () => removeItem(cartItem),
                      ),
                    ],
                  ),
                );
              },
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text('Total Items: ${getitemcount()}'),
                    Text('Total Amount: \$${getTotalAmount().toStringAsFixed(2)}'),
                  ],
                ),
                SizedBox(height: 16.0),
                ElevatedButton(
                  onPressed: () {
                    // TODO: PURCHASE
                  },
                  child: Text('Purchase'),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
