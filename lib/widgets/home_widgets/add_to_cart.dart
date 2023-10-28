import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:my_shop/core/store.dart';
import 'package:velocity_x/velocity_x.dart';

import '../../models/cart.dart';
import '../../models/catalog.dart';

class addToCart extends StatelessWidget {
  addToCart({
    Key? key,
    required this.catalog,
  }) : super(key: key);

  final Item catalog;

  final _cart = CartModel();

  @override
  Widget build(BuildContext context) {
    VxState.watch(context, on: [AddMutation, RemoveMutation]);
    // VxState.watch(context, on: [AddMutation]);
    final CartModel _cart = (VxState.store as MyStore).cart;
    // final CatalogModel _catalog = (VxState.store as MyStore).catalog;

    // bool isInCart = true;
    bool isInCart = _cart.items.contains(catalog) ? true : false;

    return ElevatedButton(
      onPressed: () {
        if (!isInCart) {
          isInCart = isInCart.toggle();
          AddMutation(catalog);
          //  final _catalog = CatalogModel();
          // _cart.catalog = _catalog;
          //  _cart.add(catalog);
        }
      },
      style: ButtonStyle(
        backgroundColor: MaterialStateProperty.all(
          Colors.purple,
        ),
        shape: MaterialStateProperty.all(
          const StadiumBorder(),
        ),
      ),
      //child: isInCart ? Icon(Icons.done) : "Buy".text.make(),
      child: isInCart ? Icon(Icons.done) : Icon(CupertinoIcons.cart_badge_plus),
    );
  }
}
