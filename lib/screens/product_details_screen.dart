import 'package:flutter/material.dart';

import 'package:provider/provider.dart';
import '../providers/products.dart';

class ProductDetailsScreen extends StatelessWidget {
  const ProductDetailsScreen({super.key});
  static const nameRoute = '/product_details';

  @override
  Widget build(BuildContext context) {
    final productId = ModalRoute.of(context)!.settings.arguments as String;
    final loadedProduct = Provider.of<Products>(context,listen: false).findById(productId);
    return Scaffold(
      appBar: AppBar(
        title: Text(loadedProduct.title),
      ),
      body: const Center(
        child: Text("Content can be changed "),
      ),
    );
  }
}
