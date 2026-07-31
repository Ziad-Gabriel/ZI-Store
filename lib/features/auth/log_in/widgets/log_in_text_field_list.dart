import 'package:flutter/material.dart';
import 'package:zi_store/features/shared/text_fields/custom_text_field.dart';

class LogInTextFieldList extends StatelessWidget {
  final List<TextEditingController> controllers;
  final int maxLines;
  final List<String> titles;
  final List<TextInputType> keyboardTypes;
  const LogInTextFieldList({
    super.key,
    required this.controllers,
    required this.maxLines,
    required this.titles,
    required this.keyboardTypes,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: List.generate(
        2,
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
