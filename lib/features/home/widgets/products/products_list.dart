import 'package:flutter/material.dart';
import 'package:zi_store/core/controllers/product_controller.dart';
import 'package:zi_store/features/home/widgets/products/product_container/product_container.dart';
import 'package:zi_store/features/product/view/product_view.dart';

class ProductsList extends StatefulWidget {
  const ProductsList({super.key});

  @override
  State<ProductsList> createState() => _ProductsListState();
}

class _ProductsListState extends State<ProductsList> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: FutureBuilder(
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
          return GridView.builder(
            itemCount: products.length,
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              childAspectRatio: 1.25,
              mainAxisSpacing: 8.0,
              crossAxisSpacing: 4.0,
            ),
            itemBuilder: (context, index) => GestureDetector(
              onTap: () => Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => ProductView(
                    id: products[index].id,
                    images: products[index].images,
                    title: products[index].title,
                    description: products[index].description,
                    category: products[index].category,
                    price: products[index].price,
                  ),
                ),
              ),
              child: ProductContainer(
                id: products[index].id,
                thumbnail: products[index].thumbnail,
                title: products[index].title,
                price: products[index].price,
              ),
            ),
          );
        },
      ),
    );
  }
}
