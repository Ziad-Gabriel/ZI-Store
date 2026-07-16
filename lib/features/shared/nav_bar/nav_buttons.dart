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
    Icons.home_rounded,
    Icons.favorite,
    Icons.shopping_basket_rounded,
    Icons.settings,
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
            height: widget.currentIndex == index ? 60 : 50,
            width: widget.currentIndex == index ? 75 : 50,
            duration: Duration(milliseconds: 250),
            decoration: BoxDecoration(
              gradient: RadialGradient(
                colors: widget.currentIndex == index
                    ? [
                        Theme.of(context).colorScheme.primary,
                        Theme.of(context).colorScheme.primary.withAlpha(235),
                      ]
                    : [
                        Theme.of(context).colorScheme.surface,
                        Theme.of(context).colorScheme.surfaceContainer,
                      ],
                radius: 1.5,
              ),
              borderRadius: BorderRadius.circular(50),
            ),
            child: Icon(
              icons[index],
              size: widget.currentIndex == index ? 28 : 24,
            ),
          ),
        ),
      ),
    );
  }
}
