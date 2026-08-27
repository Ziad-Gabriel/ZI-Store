import 'package:flutter/material.dart';
import 'package:zi_store/features/auth/sign_in/widgets/nav_to_login.dart';
import 'package:zi_store/features/auth/sign_in/widgets/sign_in_buttons.dart';
import 'package:zi_store/features/auth/sign_in/widgets/sign_in_text_fields.dart';
import 'package:zi_store/features/shared/fast_auth/google_auth.dart';
import 'package:zi_store/features/shared/fast_auth/ios_auth.dart';

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
      body: SafeArea(
        child: Column(
          spacing: 20,
          children: [
            SizedBox(height: MediaQuery.of(context).size.height * 0.035),
            Row(
              spacing: 12,
              children: [
                Hero(
                  tag: 'zi store',
                  curve: Curves.easeInOutBack,
                  child: Card(
                    elevation: 2,
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(10),
                      child: Image.asset(
                        'assets/logo/logo.png',
                        width: 95,
                        height: 95,
                      ),
                    ),
                  ),
                ),
                Expanded(
                  child: Text(
                    'Welcome,\nPlease Sign In.',
                    style: Theme.of(context).textTheme.titleSmall,
                  ),
                ),
              ],
            ),
            SingleChildScrollView(
              child: Column(
                children: [
                  Container(
                    margin: EdgeInsets.all(8),
                    padding: EdgeInsets.symmetric(horizontal: 8, vertical: 12),
                    decoration: BoxDecoration(
                      color: Theme.of(context).colorScheme.primaryContainer,
                      borderRadius: BorderRadius.circular(30),
                      boxShadow: [
                        BoxShadow(
                          color: Theme.of(context).colorScheme.shadow,
                          offset: Offset(0, 1),
                          blurRadius: 20,
                        ),
                      ],
                    ),
                    child: Column(
                      spacing: 12,
                      children: [
                        Row(
                          mainAxisSize: MainAxisSize.max,
                          children: [
                            Expanded(child: GoogleAuth()),
                            Expanded(child: IosAuth()),
                          ],
                        ),
                        Row(
                          children: [
                            Expanded(
                              child: Divider(
                                color: Theme.of(context).colorScheme.shadow,
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Text(
                                'Or Sign In with',
                                style: Theme.of(context).textTheme.bodyMedium,
                              ),
                            ),
                            Expanded(
                              child: Divider(
                                color: Theme.of(context).colorScheme.shadow,
                              ),
                            ),
                          ],
                        ),
                        SignInTextFields(controllers: controllers),
                        SignInButtons(),
                      ],
                    ),
                  ),
                  NavToLogin(),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
