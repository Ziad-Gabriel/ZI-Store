import 'dart:async';

import 'package:flutter/material.dart';
import 'package:zi_store/features/home/view/home_view.dart';

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
      ()=> Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => HomeView()),
      ),
    );

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Hero(
        tag: 'main app bar',
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
