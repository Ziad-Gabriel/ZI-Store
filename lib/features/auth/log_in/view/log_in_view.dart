import 'package:flutter/material.dart';
import 'package:zi_store/features/auth/log_in/widgets/log_in_buttons.dart';
import 'package:zi_store/features/auth/log_in/widgets/log_in_text_field_list.dart';
import 'package:zi_store/features/auth/log_in/widgets/nav_to_signin.dart';
import 'package:zi_store/features/shared/fast_auth/google_auth.dart';
import 'package:zi_store/features/shared/fast_auth/ios_auth.dart';

class LogInView extends StatefulWidget {
  const LogInView({super.key});

  @override
  State<LogInView> createState() => _LogInViewState();
}

class _LogInViewState extends State<LogInView> {
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  List<TextEditingController> get controllers => [
    emailController,
    passwordController,
  ];

  @override
  void dispose() {
    emailController.dispose();
    passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: MediaQuery.of(context).size.height * 0.075),

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
                      'Welcome Back,\nPlease Log In.',
                      style: Theme.of(context).textTheme.titleSmall,
                    ),
                  ),
                ],
              ),
              SizedBox(height: MediaQuery.of(context).size.height * 0.075),
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
                            'Or Log In with',
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
                    LogInTextFieldList(controllers: controllers),
                    LogInButtons(),
                  ],
                ),
              ),
              NavToSignin(),
            ],
          ),
        ),
      ),
    );
  }
}
