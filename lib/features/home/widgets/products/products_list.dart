import 'package:flutter/material.dart';
import 'package:zi_store/features/home/widgets/products/the_lists/grid.dart';
import 'package:zi_store/features/home/widgets/products/the_lists/list.dart';
import 'package:zi_store/repository/product_repository.dart';

class ProductsList extends StatefulWidget {

  final bool isGrid;
  const ProductsList({super.key,required this.isGrid});

  @override
  State<ProductsList> createState() => _ProductsListState();
}

class _ProductsListState extends State<ProductsList> {
  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: ProductController().getProduct(),
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
        if (!snapshot.hasData || snapshot.data!.isEmpty) {
          return Center(
            child: Text(
              'No products',
              style: Theme.of(context).textTheme.bodyLarge,
            ),
          );
        }
        final products = snapshot.data!;
        return Column(
          children: [widget.isGrid? Expanded(child: GridProduct(products: products)):Expanded(child: ListProduct(products: products))],
        );
      },
    );
  }
}
