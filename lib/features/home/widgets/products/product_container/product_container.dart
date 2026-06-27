import 'package:flutter/material.dart';

class ProductContainer extends StatelessWidget {

  final int id;
  final String thumbnail;
  final String title;
  final double price;
  const ProductContainer({
    super.key,
    required this.id,
    required this.thumbnail,
    required this.title,
    required this.price,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 4.0,
      color: Theme.of(context).colorScheme.primaryContainer,
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            Expanded(
              child: Hero(
                tag: '$id',
                child: Container(
                  width: double.infinity,
                  decoration: BoxDecoration(
                    color: Colors.grey,
                    borderRadius: BorderRadius.vertical(
                      top: Radius.circular(6.0),
                    ),
                  ),
                  child: thumbnail.isEmpty
                      ? const Center(child: Icon(Icons.image, size: 50))
                      : Image.network(thumbnail, fit: BoxFit.fitHeight),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 4.0),
              child: Text(
                title,
                style: Theme.of(context).textTheme.bodyMedium,
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
              ),
            ),
            Text('$price \$', style: Theme.of(context).textTheme.bodyMedium),
          ],
        ),
      ),
    );
  }
}
