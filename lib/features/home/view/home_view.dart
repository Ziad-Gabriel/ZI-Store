import 'package:flutter/material.dart';
import 'package:zi_store/features/shared/main_product_lists/grid_or_list.dart';
import 'package:zi_store/features/home/widgets/products/products_list.dart';

class HomeView extends StatefulWidget {
  const HomeView({super.key});

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  bool _isGrid = true;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text('Products', style: Theme.of(context).textTheme.titleSmall),
              GridOrList(
                isGrid: _isGrid,
                onTap: (isGrid) => setState(() {
                  _isGrid = isGrid;
                }),
              ),
            ],
          ),
        ),
        Expanded(child: ProductsList(isGrid: _isGrid)),
      ],
    );
  }
}
