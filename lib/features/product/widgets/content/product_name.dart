import 'package:flutter/material.dart';

class ProductName extends StatelessWidget {

  final String name;
  const ProductName({super.key,required this.name});

  @override
  Widget build(BuildContext context) {
    return Text(name,style: Theme.of(context).textTheme.bodyLarge,);
  }
}