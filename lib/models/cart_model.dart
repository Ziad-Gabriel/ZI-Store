import 'package:zi_store/models/product_model.dart';

class CartModel {
  final ProductModel product;
  final int count;
  CartModel({required this.product, required this.count});
}
