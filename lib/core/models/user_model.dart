import 'package:zi_store/core/models/product_model.dart';

class UserModel {
  final int id;
  final String email;
  final String username;
  final String password;
  final List<ProductModel>? favorite;
  final List<ProductModel>? cart;
  final String? profilePicture;
  UserModel({
    required this.id,
    required this.email,
    required this.username,
    required this.password,
    this.favorite,
    this.cart,
    this.profilePicture,
  });
}
