import 'dart:convert';

import 'package:zi_store/core/models/product_model.dart';
import 'package:zi_store/core/services/product_service.dart';

class ProductController {
  Future<List<ProductModel>> getProduct() async {
    List<ProductModel> productsList = [];
    final response = await ProductService().getProduct();
    final getData = jsonDecode(response.body);
    final products = getData['products'];

    for (dynamic product in products) {
      productsList.add(ProductModel.fromJson(product));
    }
    return productsList;
  }
}
