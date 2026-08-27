import 'package:flutter/material.dart';

class CustomTextField extends StatelessWidget {
  final TextEditingController controller;
  final int maxLines;
  final String title;
  final TextInputType keyboardType;
  final IconData icon;
  const CustomTextField({
    super.key,
    required this.controller,
    required this.maxLines,
    required this.title,
    required this.keyboardType,
    required this.icon,
  });

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: controller,
      keyboardType: keyboardType,
      maxLines: maxLines,
      decoration: InputDecoration(
        contentPadding: EdgeInsets.all(24),
        hintText: title,
        hintStyle: Theme.of(context).textTheme.bodyLarge!.copyWith(
          fontSize: 18,
          color: const Color.fromARGB(255, 128, 128, 128),
          fontWeight: FontWeight.bold,
        ),
        prefixIcon: Icon(
          icon,
          size: 24,
          color: Theme.of(context).colorScheme.shadow,
        ),
        prefixIconColor: Theme.of(context).colorScheme.shadow,
        filled: true,
        fillColor: Theme.of(context).colorScheme.surface,
        border: InputBorder.none,
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(20),
          borderSide: BorderSide.none,
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(20),
          borderSide: BorderSide.none,
        ),
      ),
    );
  }
}
