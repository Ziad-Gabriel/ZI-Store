import 'package:flutter/material.dart';
import 'package:zi_store/features/auth/log_in/widgets/log_in_buttons.dart';
import 'package:zi_store/features/auth/log_in/widgets/log_in_text_field_list.dart';

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

  final List<String> titles = ['E-mail', 'Password'];

  final List<TextInputType> keyboardTypes = [
    TextInputType.emailAddress,
    TextInputType.name,
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
      backgroundColor: Theme.of(context).colorScheme.primaryContainer,
      body: Column(
        children: [
          Hero(
            tag: 'zi store',
            curve: Curves.easeInOutBack,
            child: Container(
              height: MediaQuery.of(context).size.height * 0.4,
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
                child: Text(
                  'ZI Store',
                  style: Theme.of(
                    context,
                  ).textTheme.titleLarge!.copyWith(fontSize: 34),
                ),
              ),
            ),
          ),
          Expanded(
            child: ListView(
              children: [
                LogInTextFieldList(
                  controllers: controllers,
                  maxLines: 1,
                  titles: titles,
                  keyboardTypes: keyboardTypes,
                ),
              ],
            ),
          ),
          LogInButtons(),
          SizedBox(height: 50),
        ],
      ),
    );
  }
}
