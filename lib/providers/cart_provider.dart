import 'package:flutter/material.dart';
import 'package:zi_store/models/cart_model.dart';
import 'package:zi_store/models/product_model.dart';
import 'package:zi_store/utils/is_in_cart.dart';

class CartProvider with ChangeNotifier {
  List<CartModel> cartList = [];
  List<CartModel> get getCart => cartList;

  List<ProductModel> get getProductInCart{
    List<ProductModel> products=[];
    for (CartModel cart in cartList){
      products.add(cart.product);
    }
    return products;
  }

  void addToCart(ProductModel product, BuildContext context) {
    if(!isInCart(product, context)){
      cartList.add(CartModel(product: product, count: 1));
    }
    notifyListeners();
  }
}
