import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:zi_store/features/shared/main_product_lists/the_lists/grid.dart';
import 'package:zi_store/features/shared/main_product_lists/the_lists/list.dart';
import 'package:zi_store/providers/fav_provider.dart';
import 'package:zi_store/repository/product_repository.dart';

class FavLists extends StatefulWidget {
  final bool isGrid;
  const FavLists({super.key, required this.isGrid});

  @override
  State<FavLists> createState() => _FavListsState();
}

class _FavListsState extends State<FavLists> {
  @override
  Widget build(BuildContext context) {
    final favList = context.watch<FavProvider>().getFavList;
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
        if (favList.isEmpty) {
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
                  ? Expanded(child: GridProduct(products: favList))
                  : Expanded(child: ListProduct(products: favList)),
            ],
          ),
        );
      },
    );
  }
}
