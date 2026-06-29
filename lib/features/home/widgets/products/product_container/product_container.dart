import 'package:flutter/material.dart';

class ProductContainer extends StatelessWidget {
  final int id;
  final String thumbnail;
  final String title;
  final double price;
  final double discount;
  const ProductContainer({
    super.key,
    required this.id,
    required this.thumbnail,
    required this.title,
    required this.price,
    required this.discount,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 4,
      color: Theme.of(context).colorScheme.primaryContainer,
      child: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [
              Colors.grey,
              Theme.of(context).colorScheme.primaryContainer,
            ],
            begin: AlignmentGeometry.bottomCenter,
            end: AlignmentGeometry.center,
          ),
          borderRadius: BorderRadius.circular(8),
        ),
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: [
              Expanded(
                child: Hero(
                  tag: '$id',
                  child: Image.network(
                    thumbnail,
                    fit: BoxFit.fitHeight,
                    loadingBuilder: (context, child, loadingProgress) =>
                        loadingProgress == null
                        ? child
                        : Center(
                            child: Icon(
                              Icons.image,
                              size: 80,
                              color: Theme.of(
                                context,
                              ).colorScheme.onPrimary.withAlpha(175),
                            ),
                          ),
                    errorBuilder: (context, error, stackTrace) => Center(
                      child: Icon(
                        Icons.broken_image_rounded,
                        size: 80,
                        color: Theme.of(
                          context,
                        ).colorScheme.onPrimary.withAlpha(175),
                      ),
                    ),
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
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    '$price \$',
                    style: Theme.of(context).textTheme.bodyMedium,
                  ),
                  Card(
                    elevation: 2,
                    color: Theme.of(context).colorScheme.primary,
                    child: Padding(
                      padding: const EdgeInsets.all(6.0),
                      child: Text(
                        '$discount%',
                        style: Theme.of(context).textTheme.bodySmall,
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
