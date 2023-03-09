import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';

class ProductItem extends StatelessWidget {
  final String id;
  final String title;
  final String imgUrl;

  const ProductItem(
      {required this.id, required this.title, required this.imgUrl, super.key});

  @override
  Widget build(BuildContext context) {
    return GridTile(
      child: Image.network(
        imgUrl,
        fit: BoxFit.cover,
      ),
      footer: GridTileBar(
        backgroundColor: Colors.black54,
        leading: IconButton(onPressed: () {}, icon: const Icon(Icons.favorite)),
        trailing:
            IconButton(onPressed: () {}, icon: const Icon(Icons.shopping_cart)),
        title: Text(
          title,
          textAlign: TextAlign.center,
        ),
      ),
    );
  }
}