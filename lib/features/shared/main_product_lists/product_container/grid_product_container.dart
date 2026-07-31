import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:zi_store/features/shared/main_product_lists/product_container/product_image.dart';
import 'package:zi_store/models/product_model.dart';
import 'package:zi_store/providers/fav_provider.dart';

class GridProductContainer extends StatelessWidget {
  final ProductModel _product;
  const GridProductContainer({super.key, required this._product});

  @override
  Widget build(BuildContext context) {
    bool isFav = context.watch<FavProvider>().isFav(_product, context);
    return Card(
      elevation: 4,
      color: Theme.of(context).colorScheme.primaryContainer,
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Expanded(
              child: ProductImage(
                id: _product.id,
                thumbnail: _product.thumbnail,
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
                Spacer(),
                IconButton(
                  onPressed: () =>
                      context.read<FavProvider>().addToFav(_product, context),
                  icon: Icon(
                    !isFav
                        ? Icons.favorite_border_rounded
                        : Icons.favorite_rounded,
                    size: 24,
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
