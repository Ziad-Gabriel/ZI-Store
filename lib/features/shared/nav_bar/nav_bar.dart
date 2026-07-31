import 'package:flutter/material.dart';
import 'package:zi_store/features/shared/nav_bar/nav_buttons.dart';

class CustomNavBar extends StatefulWidget {

  final int currentIndex;
  final Function(int) onTap;
  const CustomNavBar({super.key,required this.currentIndex,required this.onTap});

  @override
  State<CustomNavBar> createState() => _CustomNavBarState();
}

class _CustomNavBarState extends State<CustomNavBar> {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Theme.of(context).colorScheme.primaryContainer,
      child: Padding(
        padding: const EdgeInsets.only(top: 8.0, bottom: 12),
        child: SizedBox(
          height: 70,
          child: NavButtons(
            currentIndex: widget.currentIndex,
            onTap: (index) => widget.onTap(index),
          ),
        ),
      ),
    );
  }
}
