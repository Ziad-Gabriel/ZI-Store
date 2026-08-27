import 'package:flutter/material.dart';
import 'package:zi_store/features/shared/text_fields/custom_text_field.dart';

class SignInTextFields extends StatelessWidget {
  final List<TextEditingController> controllers;
  const SignInTextFields({super.key, required this.controllers});

  @override
  Widget build(BuildContext context) {
    final List<String> titles = [
      'E-mail',
      'Username',
      'Password',
      'Confirm Password',
    ];

    final List<TextInputType> keyboardTypes = [
      TextInputType.emailAddress,
      TextInputType.name,
      TextInputType.name,
      TextInputType.name,
    ];

    final List<IconData> icons = [
      Icons.mail_outlined,
      Icons.person_outline_rounded,
      Icons.lock_outline_rounded,
      Icons.done_all_rounded,
    ];
    return Column(
      spacing: 8,
      children: List.generate(
        4,
        (index) => Padding(
          padding: const EdgeInsets.symmetric(horizontal: 12.0, vertical: 6),
          child: CustomTextField(
            controller: controllers[index],
            maxLines: 1,
            title: titles[index],
            keyboardType: keyboardTypes[index],
            icon: icons[index],
          ),
        ),
      ),
    );
  }
}
