import 'package:flutter/foundation.dart';

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

      void isFavouriteToggle(){
        isFavourite = !isFavourite;
        notifyListeners();
      }
}
