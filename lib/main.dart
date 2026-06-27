import 'package:flutter/material.dart';

import 'package:zi_store/core/themes/dark_theme.dart';
import 'package:zi_store/core/themes/light_theme.dart';
import 'package:zi_store/features/home/view/home_view.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      themeMode: ThemeMode.system,
      theme: LightTheme.lightTheme,
      darkTheme: DarkTheme.darkTheme,
      home: const HomeView(),
    );
  }
}
