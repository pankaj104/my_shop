import 'package:flutter/material.dart';
import 'package:my_shop/models/cart.dart';
import 'package:velocity_x/velocity_x.dart';

import '../core/store.dart';

class CartPage extends StatelessWidget {
  const CartPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.purpleAccent,
        title: const Text("My Cart"),
      ),
      body: Column(
        children: [
          _CartList().p32().expand(),
          const Divider(),
          const _cartTotal(),
        ],
      ),
    );
  }
}

class _cartTotal extends StatelessWidget {
  const _cartTotal({super.key});

  @override
  Widget build(BuildContext context) {
    final CartModel _cart = (VxState.store as MyStore).cart;

    // final _cart = CartModel();
    return SizedBox(
        height: 200,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            VxBuilder(
              ///notifications: {},
              mutations: const {RemoveMutation},
              builder: (context, store, status) {
                return "\$${_cart.totalPrice}".text.xl5.make();
              },
              // builder: (context) {
              //   return "\$${_cart.totalPrice}".text.xl5.make();
              // },
            ),
            30.widthBox,
            ElevatedButton(
                onPressed: () {
                  if (_cart.totalPrice > 1) {
                    ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                      content: "Aukat dekhe ho apni".text.make(),
                    ));
                  } else {
                    ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                      content: "Aa gaye Aukat me".text.make(),
                    ));
                  }
                },
                style: ButtonStyle(
                    backgroundColor: MaterialStateProperty.all(Colors.purple)),
                child: "Buy Now".text.white.make())
            // TextButton(onPressed: (() {}), child: "Buy Now".text.xl4.make())
          ],
        ));
  }
}

class _CartList extends StatelessWidget {
  // final _cart = CartModel();
  @override
  Widget build(BuildContext context) {
    VxState.watch(context, on: [RemoveMutation]);
    final CartModel _cart = (VxState.store as MyStore).cart;

    return _cart.items.isEmpty
        ? "Nothing to show".text.xl3.makeCentered()
        : ListView.builder(
            itemCount: _cart.items.length,
            itemBuilder: (context, index) => ListTile(
              leading: const Icon(Icons.done),
              trailing: IconButton(
                icon: const Icon(
                  Icons.remove_circle_outline,
                ),
                onPressed: (() => RemoveMutation(_cart.items[index])
                    // _cart.remove(_cart.items[index]);
                    // setState(() {});
                    ),
              ),
              title: _cart.items[index].name.text.make(),
            ),
          );
  }
}
