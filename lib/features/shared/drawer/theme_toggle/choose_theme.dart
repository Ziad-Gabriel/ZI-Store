import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:zi_store/providers/theme_provider.dart';

class ChooseTheme extends StatefulWidget {
  const ChooseTheme({super.key});

  @override
  State<ChooseTheme> createState() => _ChooseThemeState();
}

class _ChooseThemeState extends State<ChooseTheme> {
  @override
  Widget build(BuildContext context) {
    int selectedIndex = context.watch<ThemeProvider>().getThemeIndex;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text('App Theme', style: Theme.of(context).textTheme.bodyLarge),
        Card(
          color: Theme.of(context).colorScheme.primaryContainer,
          child: Column(
            children: [
              CheckboxListTile(
                title: Text(
                  'Light Theme',
                  style: Theme.of(context).textTheme.bodyMedium,
                ),
                value: selectedIndex == 0,
                onChanged: (_) {
                  setState(() {
                    selectedIndex = 0;
                  });
                  context.read<ThemeProvider>().setThemeMode(0);
                },
              ),
              CheckboxListTile(
                title: Text(
                  'Dark Theme',
                  style: Theme.of(context).textTheme.bodyMedium,
                ),
                value: selectedIndex == 1,
                onChanged: (_) {
                  setState(() {
                    selectedIndex = 1;
                  });
                  context.read<ThemeProvider>().setThemeMode(1);
                },
              ),
              CheckboxListTile(
                title: Text(
                  'Device Theme',
                  style: Theme.of(context).textTheme.bodyMedium,
                ),
                value: selectedIndex == 2,
                onChanged: (_) {
                  setState(() {
                    selectedIndex = 2;
                  });
                  context.read<ThemeProvider>().setThemeMode(2);
                },
              ),
            ],
          ),
        ),
      ],
    );
  }
}
