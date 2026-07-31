import 'package:flutter/material.dart';
import 'package:zi_store/features/fav/widgets/fav_lists.dart';
import 'package:zi_store/features/shared/main_product_lists/grid_or_list.dart';

class FavView extends StatefulWidget {
  const FavView({super.key});

  @override
  State<FavView> createState() => _FavViewState();
}

class _FavViewState extends State<FavView> {
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
              Text('Favorites', style: Theme.of(context).textTheme.bodyLarge),
              GridOrList(
                isGrid: _isGrid,
                onTap: (isGrid) => setState(() {
                  _isGrid = isGrid;
                }),
              ),
            ],
          ),
          Expanded(child: FavLists(isGrid: _isGrid)),
        ],
      ),
    );
  }
}
