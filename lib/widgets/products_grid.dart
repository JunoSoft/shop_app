import 'package:flutter/material.dart';
import 'package:provider/provider.dart';


import './product_item.dart';
import '../providers/products.dart';


class ProductsGrid extends StatelessWidget {


  @override
  Widget build(BuildContext context) {
    final productsData = Provider.of<Products>(context);
    final products = productsData.items;
    return GridView.builder(
      padding: const EdgeInsets.all(10.0),
      itemCount: products.length,
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2, childAspectRatio: 3 / 2, crossAxisSpacing: 10),
      itemBuilder: (ctx, i) => ProductItem(
          id: products[i].id,
          title: products[i].title,
          imgUrl: products[i].imageUrl),
    );
  }
}