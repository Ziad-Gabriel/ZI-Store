import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:zi_store/models/product_model.dart';
import 'package:zi_store/providers/fav_provider.dart';

bool isProductFav(ProductModel product,BuildContext context){
  final favList=context.read<FavProvider>().getFavList;
  for (ProductModel fav in favList){
    if(fav.id==product.id){
      return true;
    }
  }
  return false;
}