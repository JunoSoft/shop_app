import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../widgets/app_drawer.dart';
import './cart_screen.dart';
import '../widgets/products_grid.dart';
import '../providers/cart.dart';
import '../widgets/badge.dart';
import '../providers/products.dart';

enum FilterOption { All, Favorites }

class ProductsOverviewSCreen extends StatefulWidget {
  const ProductsOverviewSCreen({super.key});

  @override
  State<ProductsOverviewSCreen> createState() => _ProductsOverviewSCreenState();
}

class _ProductsOverviewSCreenState extends State<ProductsOverviewSCreen> {
  bool _isFavourite = false;
  var _isInit = true;
  var _isLoading = false;

  @override
  void didChangeDependencies() {
    if (_isInit) {
      setState(() {
        _isLoading = true;
      });
      Provider.of<Products>(context).fetchAndSetsProduct().then((_) {
        setState(() {
          _isLoading = false;
        });
      });
    }
    _isInit = false;
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Shop'),
        actions: <Widget>[
          PopupMenuButton(
              onSelected: (FilterOption selectedValue) {
                setState(() {
                  if (selectedValue == FilterOption.Favorites) {
                    _isFavourite = true;
                  } else {
                    _isFavourite = false;
                  }
                });
              },
              icon: const Icon(Icons.more_vert),
              itemBuilder: (_) => [
                    const PopupMenuItem(
                      value: FilterOption.All,
                      child: Text('All'),
                    ),
                    const PopupMenuItem(
                      value: FilterOption.Favorites,
                      child: Text('Favourite'),
                    )
                  ]),
          Consumer<Cart>(
            builder: (_, cart, ch) => BadgeMine(
                value: cart.itemCount.toString(),
                color: Colors.amber,
                child: ch),
            child: IconButton(
                onPressed: () {
                  Navigator.of(context).pushNamed(CartScreen.nameRoute);
                },
                icon: const Icon(Icons.shopping_cart)),
          ),
        ],
      ),
      drawer: const AppDrawer(),
      body: _isLoading
          ? const Center(
              child: CircularProgressIndicator(),
            )
          : ProductsGrid(
              showFavs: _isFavourite,
            ),
    );
  }
}
