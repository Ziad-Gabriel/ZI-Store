import 'package:flutter/material.dart';
import 'package:zi_store/features/home/widgets/products/product_container/list_product_container.dart';
import 'package:zi_store/features/product/view/product_view.dart';
import 'package:zi_store/models/product_model.dart';

class ListProduct extends StatelessWidget {
  final List<ProductModel> products;
  const ListProduct({super.key,required this.products});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: products.length,
      itemBuilder: (context,index){
        final theProduct=products[index];
        return GestureDetector(
            onTap: () => Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => ProductView(product: theProduct),
              ),
            ),
            child: ListProductContainer(product: theProduct),
          );
      });
  }
}