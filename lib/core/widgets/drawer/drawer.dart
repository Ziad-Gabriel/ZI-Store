import 'package:flutter/material.dart';
import 'package:zi_store/core/widgets/drawer/content/choose_theme.dart';

class MainDrawer extends StatelessWidget {
  const MainDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      backgroundColor: Theme.of(context).colorScheme.surface,
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: ListView(children: [ChooseTheme()]),
      ),
    );
  }
}
