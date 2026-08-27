import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:zi_store/core/models/product_model.dart';
import 'package:zi_store/core/providers/cart_provider.dart';
import 'package:zi_store/core/providers/fav_provider.dart';

class BuyButton extends StatefulWidget {
  final ProductModel product;
  const BuyButton({super.key, required this.product});

  @override
  State<BuyButton> createState() => _BuyButtonState();
}

class _BuyButtonState extends State<BuyButton> {
  @override
  Widget build(BuildContext context) {
    bool isFav = context.watch<FavProvider>().isFav(widget.product, context);
    return Padding(
      padding: const EdgeInsets.all(24.0),
      child: Row(
        children: [
          Card(
            elevation: 4,
            color: Theme.of(context).colorScheme.secondary,
            child: SizedBox(
              height: 50,
              width: 50,
              child: IconButton(
                onPressed: () => context.read<FavProvider>().addToFav(
                  widget.product,
                  context,
                ),
                icon: Icon(
                  !isFav
                      ? Icons.favorite_border_rounded
                      : Icons.favorite_rounded,
                  size: 26,
                  color: !isFav
                      ? Theme.of(context).colorScheme.onSurface
                      : Theme.of(context).colorScheme.error,
                ),
              ),
            ),
          ),
          Expanded(
            child: GestureDetector(
              onTap: () {
                context.read<CartProvider>().addToCart(widget.product, context);
                Navigator.pop(context);
              },
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
          ),
        ],
      ),
    );
  }
}
