import 'package:flutter/material.dart';
import 'package:zi_store/core/widgets/app_bar.dart';

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
    return Scaffold(
      appBar: mainAppBar(context),
      body: ListView(
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
          Text(title, style: Theme.of(context).textTheme.bodyLarge),
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
          Text(description, style: Theme.of(context).textTheme.bodySmall),
        ],
      ),
    );
  }
}
