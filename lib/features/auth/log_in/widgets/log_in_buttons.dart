import 'package:flutter/material.dart';
import 'package:zi_store/features/shared/buttons/main_auth_button.dart';
import 'package:zi_store/main_view.dart';

class LogInButtons extends StatelessWidget {
  const LogInButtons({super.key});

  @override
  Widget build(BuildContext context) {
    return MainAuthButton(
      title: 'Log In',
      onTap: () => Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => MainView()),
      ),
    );
  }
}
