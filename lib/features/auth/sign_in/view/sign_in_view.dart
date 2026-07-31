import 'package:flutter/material.dart';
import 'package:zi_store/features/auth/sign_in/widgets/sign_in_buttons.dart';
import 'package:zi_store/features/auth/sign_in/widgets/sign_in_text_fields.dart';

class SignInView extends StatefulWidget {
  const SignInView({super.key});

  @override
  State<SignInView> createState() => _SignInViewState();
}

class _SignInViewState extends State<SignInView> {
  TextEditingController emailController = TextEditingController();
  TextEditingController username = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController confirmPasswordController = TextEditingController();

  List<TextEditingController> get controllers => [
    emailController,
    username,
    passwordController,
    confirmPasswordController,
  ];

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

  @override
  void dispose() {
    emailController.dispose();
    username.dispose();
    passwordController.dispose();
    confirmPasswordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.primaryContainer,
      body: Column(
        children: [
          Hero(
            tag: 'zi store',
            curve: Curves.easeInOutBack,
            child: Container(
              height: MediaQuery.of(context).size.height * 0.35,
              width: double.infinity,
              decoration: BoxDecoration(
                color: Theme.of(context).colorScheme.surface,
                borderRadius: BorderRadius.vertical(
                  bottom: Radius.circular(50),
                ),
                boxShadow: [
                  BoxShadow(
                    offset: Offset(0, 0),
                    color: Theme.of(
                      context,
                    ).colorScheme.onPrimary.withAlpha(50),
                    blurRadius: 10,
                  ),
                ],
              ),
              child: Center(
                child: Center(
                  child: Text(
                    'ZI Store',
                    style: Theme.of(
                      context,
                    ).textTheme.titleLarge!.copyWith(fontSize: 34),
                  ),
                ),
              ),
            ),
          ),
          Expanded(
            child: ListView(
              children: [
                SignInTextFields(
                  controllers: controllers,
                  titles: titles,
                  maxLines: 1,
                  keyboardTypes: keyboardTypes,
                ),
              ],
            ),
          ),
          SignInButtons(),
          SizedBox(height: 50),
        ],
      ),
    );
  }
}
