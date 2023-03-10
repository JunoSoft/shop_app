import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import './product_item.dart';
import '../providers/products.dart';

class ProductsGrid extends StatelessWidget {
  final bool showFavs;
  const ProductsGrid({super.key, required this.showFavs});
  @override
  Widget build(BuildContext context) {
    final productsData = Provider.of<Products>(context);
    final products = showFavs ? productsData.fovoriteItem : productsData.items;
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
