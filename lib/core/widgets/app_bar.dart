import 'package:flutter/material.dart';

AppBar mainAppBar(BuildContext context) {
  return AppBar(
    title: Hero(
      tag: 'main app bar',
      child: Text('ZI Store', style: Theme.of(context).textTheme.titleLarge),
    ),
    centerTitle: true,
    backgroundColor: Theme.of(context).colorScheme.primary,
  );
}
