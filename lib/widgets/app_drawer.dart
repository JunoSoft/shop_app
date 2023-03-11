import 'package:flutter/material.dart';
import '../screens/orders_screen.dart';

class AppDrawer extends StatelessWidget {
  const AppDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Column(
        children: [
          AppBar(
            title: const Text('__Shop Now__'),
            automaticallyImplyLeading: false,
          ),
          const Divider(),
          ListTile(
            leading: Icon(Icons.shop),
            title: const Text('Shop'),
            onTap: () {
              Navigator.of(context).restorablePushReplacementNamed('/');
            },
          ),
          const Divider(),
          ListTile(
            leading: Icon(Icons.payment),
            title: const Text('Orders'),
            onTap: () {
              Navigator.of(context)
                  .restorablePushReplacementNamed(OrdersScreen.nameRoute);
            },
          )
        ],
      ),
    );
  }
}
