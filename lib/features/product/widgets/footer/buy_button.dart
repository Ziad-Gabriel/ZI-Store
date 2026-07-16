import 'package:flutter/material.dart';

class BuyButton extends StatefulWidget {
  const BuyButton({super.key});

  @override
  State<BuyButton> createState() => _BuyButtonState();
}

class _BuyButtonState extends State<BuyButton> {
  bool isFav = false;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(24.0),
      child: Row(
        children: [
          Expanded(
            child: Card(
              elevation: 4,
              color: Theme.of(context).colorScheme.primary,
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 8.0),
                child: SizedBox(
                  height: 50,

                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'Buy Now',
                        style: Theme.of(context).textTheme.bodyLarge,
                      ),
                      Icon(Icons.arrow_forward_rounded),
                    ],
                  ),
                ),
              ),
            ),
          ),
          Card(
            elevation: 4,
            color: Theme.of(context).colorScheme.primaryContainer,
            child: SizedBox(
              height: 50,
              width: 50,
              child: IconButton(
                onPressed: () => setState(() {
                  isFav = !isFav;
                }),
                icon: Icon(
                  !isFav
                      ? Icons.favorite_border_rounded
                      : Icons.favorite_rounded,
                  size: 26,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
