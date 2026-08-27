import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:zi_store/features/shared/main_product_lists/the_lists/grid.dart';
import 'package:zi_store/features/shared/main_product_lists/the_lists/list.dart';
import 'package:zi_store/core/providers/cart_provider.dart';
import 'package:zi_store/core/repository/product_repository.dart';

class CartLists extends StatefulWidget {
  final bool isGrid;
  const CartLists({super.key, required this.isGrid});

  @override
  State<CartLists> createState() => _CartListsState();
}

class _CartListsState extends State<CartLists> {
  @override
  Widget build(BuildContext context) {
    final cartList = context.watch<CartProvider>().getProductInCart;
    return FutureBuilder(
      future: ProductRepository().getProduct(),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return Center(child: CircularProgressIndicator());
        }
        if (snapshot.hasError) {
          return Center(
            child: Text(
              'Error: ${snapshot.error}',
              style: Theme.of(context).textTheme.bodyLarge,
            ),
          );
        }
        if (cartList.isEmpty) {
          return Center(
            child: Text(
              'No products',
              style: Theme.of(context).textTheme.bodyLarge,
            ),
          );
        }
        return Padding(
          padding: const EdgeInsets.symmetric(horizontal: 8.0),
          child: Column(
            children: [
              widget.isGrid
                  ? Expanded(child: GridProduct(products: cartList))
                  : Expanded(child: ListProduct(products: cartList)),
            ],
          ),
        );
      },
    );
  }
}
