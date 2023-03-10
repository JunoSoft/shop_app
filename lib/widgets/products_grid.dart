import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import './product_item.dart';
import '../providers/products.dart';

class ProductsGrid extends StatelessWidget {
  final bool isFavourite ;
  const ProductsGrid({super.key, required this.isFavourite});
  @override
  Widget build(BuildContext context) {
    final productsData = Provider.of<Products>(context);
    final products = isFavourite?productsData.fovoriteItem:productsData.items;
    return GridView.builder(
      padding: const EdgeInsets.all(10.0),
      itemCount: products.length,
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2, childAspectRatio: 3 / 2, crossAxisSpacing: 10),
      itemBuilder: (ctx, i) =>
          ChangeNotifierProvider.value(value: products[i], child: ProductItem()
              // id: products[i].id,
              // title: products[i].title,
              // imgUrl: products[i].imageUrl,
              ),
    );
  }
}
