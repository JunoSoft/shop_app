import 'package:flutter/material.dart';

import '../screens/product_details_screen.dart';

class ProductItem extends StatelessWidget {
  final String id;
  final String title;
  final String imgUrl;

  const ProductItem(
      {required this.id, required this.title, required this.imgUrl, super.key});

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(10),
      child: GestureDetector(
        onTap:(){ Navigator.of(context).pushNamed(ProductDetailsScreen.nameRoute,arguments: id);},
        child: GridTile(
          child: Image.network(
            imgUrl,
            fit: BoxFit.cover,
          ),
          footer: GridTileBar(
            backgroundColor: Colors.black87,
            leading: IconButton(
                onPressed: () {},
                color: Theme.of(context).accentColor,
                icon: const Icon(Icons.favorite)),
            trailing: IconButton(
                onPressed: () {},
                color: Theme.of(context).accentColor,
                icon: const Icon(Icons.shopping_cart)),
            title: Text(
              title,
              textAlign: TextAlign.center,
            ),
          ),
        ),
      ),
    );
  }
}
