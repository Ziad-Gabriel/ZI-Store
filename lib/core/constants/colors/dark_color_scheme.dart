import 'package:flutter/material.dart';
import 'package:zi_store/core/constants/colors/const_colors.dart';

class DarkColorScheme {
  static ColorScheme get darkColorScheme => const ColorScheme.dark(
    brightness: Brightness.dark,
    primary: primaryColor,
    surface: darkBackgroundColor,
    primaryContainer: darkContainerColor,
    onPrimary: Color(0xFFEBEBEB),
  );
}
