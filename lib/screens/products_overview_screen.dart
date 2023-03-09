import 'package:flutter/material.dart';

import '../widgets/products_grid.dart';

class ProductsOverviewSCreen extends StatelessWidget {
  ProductsOverviewSCreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('JunoShop'),
      ),
      body: ProductsGrid(),
    );
  }
}

