import 'package:flutter/material.dart';
import 'package:zi_store/features/cart/widgets/cart_lists.dart';
import 'package:zi_store/features/shared/main_product_lists/grid_or_list.dart';

class CartView extends StatefulWidget {
  const CartView({super.key});

  @override
  State<CartView> createState() => _CartViewState();
}

class _CartViewState extends State<CartView> {
  bool _isGrid = true;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text('Cart', style: Theme.of(context).textTheme.titleSmall),
              GridOrList(
                isGrid: _isGrid,
                onTap: (isGrid) => setState(() {
                  _isGrid = isGrid;
                }),
              ),
            ],
          ),
          Expanded(child: CartLists(isGrid: _isGrid)),
        ],
      ),
    );
  }
}
