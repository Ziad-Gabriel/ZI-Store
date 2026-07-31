import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:zi_store/models/product_model.dart';
import 'package:zi_store/providers/cart_provider.dart';

bool isInCart(ProductModel product,BuildContext context){
  final cartList=context.read<CartProvider>().getProductInCart;
  for (ProductModel cartProduct in cartList){
    if(cartProduct.id==product.id){
      return true;
    }
  }
  return false;
}