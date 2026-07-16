import 'package:flutter/material.dart';

class GridList extends StatelessWidget {
  final bool isGrid;
  final Function(bool) onTap;
  const GridList({super.key, required this.isGrid, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 50,
      width: 110,
      decoration: BoxDecoration(
        color: Theme.of(context).colorScheme.primaryContainer,
        borderRadius: BorderRadius.circular(30),
      ),
      child: Row(
        children: [
          Expanded(
            child: AnimatedContainer(
              duration: Duration(milliseconds: 200),

              decoration: BoxDecoration(
                color: isGrid
                    ? Theme.of(context).colorScheme.primary.withAlpha(215)
                    : Colors.transparent,
                borderRadius: BorderRadius.horizontal(
                  left: Radius.circular(30),
                ),
              ),
              child: IconButton(
                onPressed: () {
                  if (!isGrid) {
                    onTap(true);
                  }
                },
                icon: Icon(Icons.grid_on_rounded),
              ),
            ),
          ),
          Container(
            height: double.infinity,
            width: 2,
            color: Theme.of(context).colorScheme.onPrimary,
          ),
          Expanded(
            child: AnimatedContainer(
              duration: Duration(milliseconds: 200),
              decoration: BoxDecoration(
                color: isGrid
                    ? Colors.transparent
                    : Theme.of(context).colorScheme.primary.withAlpha(215),
                borderRadius: BorderRadius.horizontal(
                  right: Radius.circular(30),
                ),
              ),
              child: IconButton(
                onPressed: () {
                  if (isGrid) {
                    onTap(false);
                  }
                },
                icon: Icon(Icons.view_list_rounded),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
