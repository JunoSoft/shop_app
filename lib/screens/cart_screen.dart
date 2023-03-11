import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../providers/orders.dart';
import '../providers/cart.dart' show Cart;
import '../widgets/cart_item.dart';

class CartScreen extends StatelessWidget {
  static const nameRoute = '/cart';
  const CartScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final cart = Provider.of<Cart>(context);
    return Scaffold(
        appBar: AppBar(
          title: const Text('Your cart'),
        ),
        body: Column(
          children: <Widget>[
            Card(
              margin: EdgeInsets.all(15),
              child: Padding(
                padding: const EdgeInsets.all(8),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    Text(
                      'Total',
                      style: TextStyle(
                        fontSize: 20,
                      ),
                    ),
                    Spacer(),
                    Chip(
                      label: Text(
                        '\$${cart.totalAmount!.toDouble().toStringAsFixed(2)}',
                        style: const TextStyle(
                          color: Colors.white,
                        ),
                      ),
                      backgroundColor: Theme.of(context).primaryColor,
                    ),
                    TextButton(
                      child: Text('ORDER NOW'),
                      onPressed: () {
                        Provider.of<Orders>(context, listen: false).addOrder(
                            cart.items.values.toList(),
                            cart.totalAmount as double);
                        cart.clear();
                      },
                      style: TextButton.styleFrom(
                          primary: Theme.of(context).primaryColor),
                    )
                  ],
                ),
              ),
            ),
            const SizedBox(height: 10),
            Expanded(
                child: ListView.builder(
                    itemCount: cart.items.length,
                    itemBuilder: (ctx, i) => CartItem(
                        id: cart.items.values.toList()[i].id,
                        prodId: cart.items.keys.toList()[i],
                        price: cart.items.values.toList()[i].price,
                        quantity: cart.items.values.toList()[i].quantity,
                        title: cart.items.values.toList()[i].title)))
          ],
        ));
  }
}
