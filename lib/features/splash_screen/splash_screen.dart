import 'dart:async';

import 'package:flutter/material.dart';
import 'package:zi_store/features/auth/log_in/view/log_in_view.dart';
import 'package:zi_store/main_view.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});
  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    Future.delayed(
      Duration(seconds: 2),
      () => Navigator.pushReplacement(
        // ignore: use_build_context_synchronously
        context,
        MaterialPageRoute(builder: (context) => LogInView()),
      ),
    );
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Hero(
        tag: 'zi store',
        child: Center(
          child: Text(
            'ZI Store',
            style: Theme.of(
              context,
            ).textTheme.titleLarge!.copyWith(fontSize: 34),
          ),
        ),
      ),
    );
  }
}
