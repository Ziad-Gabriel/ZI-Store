import 'package:flutter/material.dart';

class BuyButton extends StatelessWidget {
  const BuyButton({super.key});

  @override
  Widget build(BuildContext context) {
    return Card(
            elevation: 4,
            color: Theme.of(context).colorScheme.primary,
            child: Padding(
              padding: const EdgeInsets.symmetric(
                vertical: 4.0,
                horizontal: 12,
              ),
              child: Text(
                'Buy Now',
                style: Theme.of(context).textTheme.bodyLarge,
              ),
            ),
          );
  }
}