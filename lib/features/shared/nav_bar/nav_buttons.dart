import 'package:flutter/material.dart';

class NavButtons extends StatefulWidget {
  final int currentIndex;
  final Function(int) onTap;
  const NavButtons({
    super.key,
    required this.currentIndex,
    required this.onTap,
  });

  @override
  State<NavButtons> createState() => _NavButtonsState();
}

class _NavButtonsState extends State<NavButtons> {
  final List<IconData> icons = [
    Icons.home_outlined,
    Icons.favorite_outline,
    Icons.shopping_basket_outlined,
    Icons.settings_outlined,
  ];
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      mainAxisSize: MainAxisSize.max,
      children: List.generate(
        4,
        (index) => InkWell(
          onTap: () => widget.onTap(index),
          child: AnimatedContainer(
            height: widget.currentIndex == index ? 50 : 45,
            width: widget.currentIndex == index ? 50 : 45,
            duration: Duration(milliseconds: 250),
            decoration: BoxDecoration(
              color: widget.currentIndex == index
                  ? Theme.of(context).colorScheme.primary.withAlpha(120)
                  : Theme.of(context).colorScheme.surface,
              borderRadius: BorderRadius.circular(16),
              border: Border.all(
                color: widget.currentIndex == index
                    ? Theme.of(context).colorScheme.primary
                    : Theme.of(context).colorScheme.surface,
                width: 1.5,
              ),
            ),
            child: Icon(
              icons[index],
              size: widget.currentIndex == index ? 28 : 24,
              color: widget.currentIndex == index
                  ? Theme.of(context).colorScheme.primary.withValues()
                  : Theme.of(context).colorScheme.onSurface,
            ),
          ),
        ),
      ),
    );
  }
}
