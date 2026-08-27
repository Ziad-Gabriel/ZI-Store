import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:zi_store/features/shared/main_product_lists/product_container/product_image.dart';
import 'package:zi_store/core/models/product_model.dart';
import 'package:zi_store/core/providers/fav_provider.dart';

class GridProductContainer extends StatelessWidget {
  final ProductModel _product;
  const GridProductContainer({super.key, required this._product});

  @override
  Widget build(BuildContext context) {
    bool isFav = context.watch<FavProvider>().isFav(_product, context);
    return Card(
      elevation: 4,
      color: Theme.of(context).colorScheme.primaryContainer,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(
            child: Stack(
              children: [
                ProductImage(id: _product.id, thumbnail: _product.thumbnail),
                Positioned(
                  top: 0,
                  right: 0,
                  child: IconButton(
                    onPressed: () =>
                        context.read<FavProvider>().addToFav(_product, context),
                    icon: Container(
                      padding: EdgeInsets.all(8),
                      decoration: BoxDecoration(
                        color: Theme.of(
                          context,
                        ).colorScheme.surface.withAlpha(150),
                        borderRadius: BorderRadius.circular(50),
                      ),
                      child: Icon(
                        !isFav
                            ? Icons.favorite_border_rounded
                            : Icons.favorite_rounded,
                        size: 24,
                        color: !isFav
                            ? Theme.of(context).colorScheme.onSurface
                            : Theme.of(context).colorScheme.error,
                      ),
                    ),
                  ),
                ),
                Positioned(
                  top: 4,
                  left: 4,
                  child: Card(
                    elevation: 2,
                    color: Theme.of(context).colorScheme.secondary,
                    child: Padding(
                      padding: const EdgeInsets.all(6.0),
                      child: Text(
                        '${_product.discountPercentage}%',
                        style: Theme.of(context).textTheme.bodySmall,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(4.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  _product.title,
                  style: Theme.of(context).textTheme.bodySmall!.copyWith(
                    overflow: TextOverflow.ellipsis,
                  ),
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                ),
                Row(
                  children: [
                    Column(
                      children: [
                        Text(
                          '${_product.price} \$',
                          style: Theme.of(context).textTheme.bodySmall!
                              .copyWith(
                                color: Theme.of(
                                  context,
                                ).colorScheme.onSurface.withAlpha(180),
                              ),
                        ),
                        Row(
                          spacing: 4,
                          children: [
                            Text(
                              '${_product.rating}',
                              style: Theme.of(context).textTheme.bodySmall,
                            ),
                            Icon(Icons.star_rate_rounded, color: Colors.amber),
                          ],
                        ),
                      ],
                    ),
                    Spacer(),
                    Container(
                      height: 40,
                      width: 40,
                      decoration: BoxDecoration(
                        color: Theme.of(
                          context,
                        ).colorScheme.primary.withAlpha(40),
                        borderRadius: BorderRadius.circular(50),
                      ),
                      child: Center(
                        child: Icon(
                          Icons.add_rounded,
                          size: 32,
                          color: Theme.of(context).colorScheme.primary,
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
