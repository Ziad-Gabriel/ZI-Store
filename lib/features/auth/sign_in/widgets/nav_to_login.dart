import 'package:flutter/material.dart';
import 'package:zi_store/features/auth/log_in/view/log_in_view.dart';

class NavToLogin extends StatelessWidget {
  const NavToLogin({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          "Already have an account?",
          style: Theme.of(context).textTheme.bodyMedium,
        ),
        TextButton(
          onPressed: () => Navigator.pushReplacement(
            context,
            MaterialPageRoute(builder: (context) => LogInView()),
          ),
          child: Text(
            'Log In',
            style: Theme.of(
              context,
            ).textTheme.bodyMedium!.copyWith(color: Colors.blue),
          ),
        ),
      ],
    );
  }
}
