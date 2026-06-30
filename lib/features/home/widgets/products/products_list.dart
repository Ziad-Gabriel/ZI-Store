import 'package:flutter/material.dart';
import 'package:zi_store/core/repository/product_repository.dart';
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
                    builder: (context) => ProductView(
                      id: theProduct.id,
                      images: theProduct.images,
                      title: theProduct.title,
                      description: theProduct.description,
                      category: theProduct.category,
                      price: theProduct.price,
                      discount: theProduct.discountPercentage,
                      reviews: theProduct.reviews,
                    ),
                  ),
                ),
                child: ProductContainer(
                  id: theProduct.id,
                  thumbnail: theProduct.thumbnail,
                  title: theProduct.title,
                  price: theProduct.price,
                  discount: theProduct.discountPercentage,
                ),
              );
            },
          );
        },
      ),
    );
  }
}
