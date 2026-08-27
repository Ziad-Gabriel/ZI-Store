import 'package:flutter/material.dart';
import 'package:zi_store/features/shared/text_fields/custom_text_field.dart';

class LogInTextFieldList extends StatelessWidget {
  final List<TextEditingController> controllers;

  const LogInTextFieldList({super.key, required this.controllers});

  @override
  Widget build(BuildContext context) {
    final List<String> titles = ['E-mail', 'Password'];

    final List<TextInputType> keyboardTypes = [
      TextInputType.emailAddress,
      TextInputType.name,
    ];

    final iconList = [Icons.mail_outlined, Icons.lock_outline_rounded];
    return Column(
      children: List.generate(
        2,
        (index) => Padding(
          padding: const EdgeInsets.symmetric(horizontal: 12.0, vertical: 6),
          child: CustomTextField(
            controller: controllers[index],
            maxLines: 1,
            title: titles[index],
            keyboardType: keyboardTypes[index],
            icon: iconList[index],
          ),
        ),
      ),
    );
  }
}
