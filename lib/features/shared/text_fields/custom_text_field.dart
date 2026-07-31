import 'package:flutter/material.dart';

class CustomTextField extends StatelessWidget {
  final TextEditingController controller;
  final int maxLines;
  final String title;
  final TextInputType keyboardType;
  const CustomTextField({
    super.key,
    required this.controller,
    required this.maxLines,
    required this.title,
    required this.keyboardType,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 2,
      color: Theme.of(context).colorScheme.primaryContainer,
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: TextField(
          controller: controller,
          keyboardType: keyboardType,
          maxLines: maxLines,
          decoration: InputDecoration(
            hintText: title,
            hintStyle: Theme.of(context).textTheme.bodyLarge!.copyWith(
              fontSize: 18,
              color: const Color.fromARGB(255, 128, 128, 128),
              fontWeight: FontWeight.bold,
            ),
            border: InputBorder.none,
          ),
        ),
      ),
    );
  }
}
