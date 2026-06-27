import 'package:flutter/material.dart';
import 'package:zi_store/core/widgets/app_bar.dart';
import 'package:zi_store/features/product/widgets/footer/buy_button.dart';

class ProductView extends StatelessWidget {
  final int id;
  final List<String> images;
  final String title;
  final String description;
  final String category;
  final double price;
  const ProductView({
    super.key,
    required this.id,
    required this.images,
    required this.title,
    required this.description,
    required this.category,
    required this.price,
  });

  @override
  Widget build(BuildContext context) {
    final Widget gab = SizedBox(height: 12);
    return Scaffold(
      appBar: mainAppBar(context),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Expanded(
            child: SingleChildScrollView(
              child: Column(
                children: [
                  Hero(
                    tag: '$id',
                    child: Container(
                      height: MediaQuery.of(context).size.height * 0.2,
                      width: double.infinity,
                      decoration: BoxDecoration(color: Colors.grey),
                      child: images.isEmpty
                          ? const Center(child: Icon(Icons.image, size: 80))
                          : Image.network(images[0], fit: BoxFit.fitHeight),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          title,
                          style: Theme.of(context).textTheme.bodyLarge,
                        ),
                        gab,
                        Card(
                          color: Theme.of(context).colorScheme.primaryContainer,
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Text(
                              category,
                              style: Theme.of(context).textTheme.bodySmall,
                            ),
                          ),
                        ),
                        gab,
                        Text(
                          description,
                          style: Theme.of(context).textTheme.bodySmall,
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
          BuyButton(),
          gab,
        ],
      ),
    );
  }
}
