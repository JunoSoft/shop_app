import 'dart:convert';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

import '../providers/products.dart';
import 'package:http/http.dart' as http;

class Product with ChangeNotifier {
  final String? id;
  final String title;
  final String description;
  final double price;
  final String imageUrl;
  bool isFavourite;
  Product(
      {required this.id,
      required this.description,
      required this.imageUrl,
      required this.price,
      required this.title,
      this.isFavourite = false});
  void _setFavValue(bool newValue) {
    isFavourite = newValue;
    notifyListeners();
  }

  Future<void> isFavouriteToggle() async {
    var oldStatus = isFavourite;
    isFavourite = !isFavourite;
    notifyListeners();
    final url =
        'https://shopapp-9168e-default-rtdb.firebaseio.com/products/$id.json';

    try {
      final response = await http.patch(Uri.parse(url),
          body: json.encode({'isFavourite': isFavourite}));
      if (response.statusCode >= 400) {
        _setFavValue(oldStatus);
      }
    } catch (error) {
      _setFavValue(oldStatus);
    }
  }
}
