import 'package:flutter/material.dart';
import 'package:zi_store/features/auth/sign_in/view/sign_in_view.dart';

class NavToSignin extends StatelessWidget {
  const NavToSignin({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
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
            style: Theme.of(
              context,
            ).textTheme.bodyMedium!.copyWith(color: Colors.blue),
          ),
        ),
      ],
    );
  }
}
