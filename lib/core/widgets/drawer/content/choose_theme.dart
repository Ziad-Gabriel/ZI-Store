import 'package:flutter/material.dart';

class ChooseTheme extends StatefulWidget {
  const ChooseTheme({super.key});

  @override
  State<ChooseTheme> createState() => _ChooseThemeState();
}

class _ChooseThemeState extends State<ChooseTheme> {
  int _isSelected = 0;
  @override
  Widget build(BuildContext context) {
    return Column(
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
                value: _isSelected == 1,
                onChanged: (_) {
                  setState(() {
                    _isSelected = 1;
                  });
                },
              ),
              CheckboxListTile(
                title: Text(
                  'Dark Theme',
                  style: Theme.of(context).textTheme.bodyMedium,
                ),
                value: _isSelected == 2,
                onChanged: (_) {
                  setState(() {
                    _isSelected = 2;
                  });
                },
              ),
              CheckboxListTile(
                title: Text(
                  'Device Theme',
                  style: Theme.of(context).textTheme.bodyMedium,
                ),
                value: _isSelected == 0,
                onChanged: (_) {
                  setState(() {
                    _isSelected = 0;
                  });
                },
              ),
            ],
          ),
        ),
      ],
    );
  }
}
