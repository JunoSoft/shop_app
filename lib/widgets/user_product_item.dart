import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../screens/edit_products.dart';
import '../providers/products.dart';

class UsserProductsItem extends StatelessWidget {
  final String? id;
  final String title;
  final String imageUrl;

  const UsserProductsItem(
      {required this.id, required this.title, required this.imageUrl, super.key});

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(title),
      leading: CircleAvatar(
        backgroundImage: NetworkImage(imageUrl),
      ),
      trailing: Container(
        width: 100,
        child: Row(
          children: <Widget>[
            IconButton(
              onPressed: () {
                Navigator.of(context).pushNamed(EditProductsScreen.nameRoute,arguments: id);
              },
              icon: const Icon(Icons.edit),
              color: Theme.of(context).primaryColor,
            ),
            IconButton(
              onPressed: () {
 Provider.of<Products>(context,listen: false).deleteProduct(id!);
              },
              icon: const Icon(Icons.delete),
              color: Theme.of(context).errorColor,
            ),
          ],
        ),
      ),
    );
  }
}
