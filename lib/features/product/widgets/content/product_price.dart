import 'package:flutter/material.dart';

class ProductPriceAndRate extends StatelessWidget {
  final double price;
  final double discount;
  final double rate;
  const ProductPriceAndRate({
    super.key,
    required this.price,
    required this.discount,
    required this.rate,
  });

  @override
  Widget build(BuildContext context) {
    final mainPrice = (price * 100) / (100 - discount);
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Card(
          elevation: 2,
          color: Theme.of(context).colorScheme.primaryContainer,
          child: Padding(
            padding: const EdgeInsets.all(4.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Text(
                      '$price',
                      style: Theme.of(context).textTheme.bodyLarge,
                    ),
                    Card(
                      elevation: 2,
                      color: Theme.of(context).colorScheme.primary,
                      child: Padding(
                        padding: const EdgeInsets.all(4.0),
                        child: Text(
                          '$discount%',
                          style: Theme.of(context).textTheme.bodyMedium,
                        ),
                      ),
                    ),
                  ],
                ),
                Text(
                  mainPrice.toStringAsFixed(2),
                  style: Theme.of(context).textTheme.bodySmall!.copyWith(
                    decoration: TextDecoration.lineThrough,
                    color: const Color.fromARGB(255, 128, 128, 128),
                  ),
                ),
              ],
            ),
          ),
        ),
        Text('$rate', style: Theme.of(context).textTheme.bodyLarge),
        Icon(Icons.star_rate_rounded, color: Colors.amber),
      ],
    );
  }
}
