import 'package:flutter/material.dart';
import 'package:zi_store/constants/colors/const_colors.dart';

class LightColorScheme {
  static ColorScheme get lightColorScheme => const ColorScheme.light(
    brightness: Brightness.light,
    primary: primaryColor,
    surface: lightBackgroundColor,
    surfaceContainer: Color.fromARGB(255, 195, 195, 195),
    primaryContainer: lightContainerColor,
    onPrimary: Color(0XFF0D0D0D),
    onPrimaryContainer: Colors.grey,
  );
}
