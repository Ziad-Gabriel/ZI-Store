import 'package:flutter/material.dart';

class ProductPrice extends StatelessWidget {
  final double price;
  final double discount;
  const ProductPrice({super.key, required this.price, required this.discount});

  @override
  Widget build(BuildContext context) {
    final mainPrice = (price * 100) / (100 - discount);
    return Card(
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
                Text('$price', style: Theme.of(context).textTheme.bodyLarge),
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
    );
  }
}
