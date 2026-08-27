import 'package:zi_store/core/models/product_model.dart';

class CartModel {
  final ProductModel product;
  final int count;
  CartModel({required this.product, required this.count});
}
