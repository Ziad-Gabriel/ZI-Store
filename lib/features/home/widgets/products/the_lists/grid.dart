import 'package:flutter/material.dart';
import 'package:zi_store/features/home/widgets/products/product_container/grid_product_container.dart';
import 'package:zi_store/features/product/view/product_view.dart';
import 'package:zi_store/models/product_model.dart';

class GridProduct extends StatelessWidget {
  final List<ProductModel> products;
  const GridProduct({super.key, required this.products});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8.0),
      child: GridView.builder(
        itemCount: products.length,
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          childAspectRatio: 0.8,
          mainAxisSpacing: 10.0,
          crossAxisSpacing: 8.0,
        ),
        itemBuilder: (context, index) {
          final theProduct = products[index];
          return GestureDetector(
            onTap: () => Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => ProductView(product: theProduct),
              ),
            ),
            child: GridProductContainer(product: theProduct),
          );
        },
      ),
    );
  }
}
