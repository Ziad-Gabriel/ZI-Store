import 'package:flutter/material.dart';
import 'package:zi_store/features/shared/text_fields/custom_text_field.dart';

class SignInTextFields extends StatelessWidget {
  final List<TextEditingController> controllers;
  final List<String> titles;
  final int maxLines;
  final List<TextInputType> keyboardTypes;
  const SignInTextFields({
    super.key,
    required this.controllers,
    required this.titles,
    required this.maxLines,
    required this.keyboardTypes,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: List.generate(
        4,
        (index) => Padding(
          padding: const EdgeInsets.symmetric(horizontal: 12.0, vertical: 6),
          child: CustomTextField(
            controller: controllers[index],
            maxLines: maxLines,
            title: titles[index],
            keyboardType: keyboardTypes[index],
          ),
        ),
      ),
    );
  }
}
