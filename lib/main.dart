import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:zi_store/providers/cart_provider.dart';
import 'package:zi_store/providers/fav_provider.dart';
import 'package:zi_store/providers/theme_provider.dart';

import 'package:zi_store/themes/dark_theme.dart';
import 'package:zi_store/themes/light_theme.dart';
import 'package:zi_store/features/splash_screen/splash_screen.dart';

void main() {
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => ThemeProvider()),
        ChangeNotifierProvider(create: (context) => FavProvider()),
        ChangeNotifierProvider(create: (context) => CartProvider()),
      ],
      child: const MainApp(),
    ),
  );
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      themeMode: Provider.of<ThemeProvider>(context).getThemeMode,
      theme: LightTheme.lightTheme,
      darkTheme: DarkTheme.darkTheme,
      home: const SplashScreen(),
    );
  }
}
