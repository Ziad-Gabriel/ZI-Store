import 'package:flutter/material.dart';

AppBar mainAppBar(BuildContext context) {
  return AppBar(
    leading: Image.asset('assets/logo/logo-removebg-.png'),
    title: Text(
      'Nova Bazaar',
      style: Theme.of(context).textTheme.titleMedium!.copyWith(
        color: Theme.of(context).colorScheme.primary,
      ),
    ),
    // centerTitle: true,
    scrolledUnderElevation: 0,
    backgroundColor: Theme.of(context).colorScheme.primaryContainer,
  );
}
