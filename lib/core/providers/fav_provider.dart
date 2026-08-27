import 'package:flutter/material.dart';
import 'package:zi_store/core/models/product_model.dart';
import 'package:zi_store/core/utils/is_product_fav.dart';

class FavProvider with ChangeNotifier {
  List<ProductModel> favorites = [];
  List<ProductModel> get getFavList => favorites;

  bool isFav(ProductModel product, BuildContext context) {
    if (isProductFav(product, context)) {
      return true;
    } else {
      return false;
    }
  }

  void addToFav(ProductModel product, BuildContext context) {
    if (isProductFav(product, context)) {
      favorites.remove(product);
    } else {
      favorites.add(product);
    }
    notifyListeners();
  }
}
