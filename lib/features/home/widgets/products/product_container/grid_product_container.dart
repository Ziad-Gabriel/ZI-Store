import 'package:flutter/material.dart';
import 'package:zi_store/models/product_model.dart';

class GridProductContainer extends StatelessWidget {
  final ProductModel _product;
  const GridProductContainer({super.key, required this._product});

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 4,
      color: Theme.of(context).colorScheme.primaryContainer,
      child: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [
              Theme.of(context).colorScheme.onPrimaryContainer,
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
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Expanded(
                child: Hero(
                  tag: '${_product.id}',
                  child: Center(
                    child: Image.network(
                      _product.thumbnail,
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
              ),
              Padding(
                padding: const EdgeInsets.only(top: 4.0),
                child: Text(
                  _product.title,
                  style: Theme.of(context).textTheme.bodyMedium,
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Text(
                    '${_product.price} \$',
                    style: Theme.of(context).textTheme.bodyMedium,
                  ),
                  Card(
                    elevation: 2,
                    color: Theme.of(context).colorScheme.primary,
                    child: Padding(
                      padding: const EdgeInsets.all(6.0),
                      child: Text(
                        '${_product.discountPercentage}%',
                        style: Theme.of(context).textTheme.bodySmall,
                      ),
                    ),
                  ),
                ],
              ),
              Row(
                children: [
                  Text(
                    '${_product.rating}',
                    style: Theme.of(context).textTheme.bodyMedium,
                  ),
                  Icon(Icons.star_rate_rounded, color: Colors.amber),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
