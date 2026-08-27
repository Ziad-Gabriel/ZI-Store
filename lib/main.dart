import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:zi_store/core/providers/cart_provider.dart';
import 'package:zi_store/core/providers/fav_provider.dart';
import 'package:zi_store/core/providers/theme_provider.dart';

import 'package:zi_store/core/themes/themes.dart';
// import 'package:zi_store/features/splash_screen/splash_screen.dart';
import 'package:zi_store/main_view.dart';

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
      theme: AppTheme.lightTheme,
      darkTheme: AppTheme.darkTheme,
      home: const MainView(),
    );
  }
}
