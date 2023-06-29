import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:myproject/core/store.dart';
import 'package:myproject/models/cart.dart';
import 'package:myproject/models/catalog.dart';
import 'package:velocity_x/velocity_x.dart';

class AddToCart extends StatelessWidget {
  final Item catalog;
  // ignore: prefer_const_constructors_in_immutables
  AddToCart({
    Key? key,
    required this.catalog,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    VxState.watch(context, on: [AddMutation, RemoveMutation]);
    // ignore: no_leading_underscores_for_local_identifiers
    final CartModel _cart = (VxState.store as MyStore).cart;
    bool isInCart = _cart.items.contains(catalog);
    return ElevatedButton(
      onPressed: () {
        if (!isInCart) {
          AddMutation(catalog);
        }
      },
      style: ButtonStyle(
          backgroundColor:MaterialStatePropertyAll(context.theme.primaryColorDark),
          shape: MaterialStateProperty.all(
            const StadiumBorder(),
          )),
      child: isInCart ? const Icon(Icons.done) : const Icon(CupertinoIcons.cart_badge_plus),
    );
  }
}