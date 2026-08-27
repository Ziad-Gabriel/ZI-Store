import 'package:flutter/material.dart';

AppBar productAppBar(BuildContext context) {
  return AppBar(
    title: Text(
      'Product Details',
      style: Theme.of(context).textTheme.titleSmall
    ),
    // centerTitle: true,
    scrolledUnderElevation: 0,
    backgroundColor: Theme.of(context).colorScheme.primaryContainer,
  );
}
