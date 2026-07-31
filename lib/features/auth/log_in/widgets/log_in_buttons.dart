import 'package:flutter/material.dart';
import 'package:zi_store/features/auth/sign_in/view/sign_in_view.dart';
import 'package:zi_store/features/shared/buttons/main_button.dart';
import 'package:zi_store/main_view.dart';

class LogInButtons extends StatelessWidget {
  const LogInButtons({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        MainButton(
          title: 'Log In',
          color: Theme.of(context).colorScheme.primary,
          onTap: () => Navigator.pushReplacement(
            context,
            MaterialPageRoute(builder: (context) => MainView()),
          ),
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              "Don't have an account?",
              style: Theme.of(context).textTheme.bodyMedium,
            ),
            TextButton(
              onPressed: () => Navigator.pushReplacement(
                context,
                MaterialPageRoute(builder: (context) => SignInView()),
              ),
              child: Text(
                'Sign In',
                style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                  fontSize: 12,
                  fontWeight: FontWeight.w500,
                  color: Colors.blue,
                ),
              ),
            ),
          ],
        ),
      ],
    );
  }
}
