import 'package:flutter/material.dart';
import 'package:zi_store/constants/colors/const_colors.dart';

class DarkColorScheme {
  static ColorScheme get darkColorScheme => ColorScheme.dark(
    brightness: Brightness.dark,
    primary: primaryColor,
    surface: darkBackgroundColor,
    primaryContainer: darkContainerColor,
    onPrimary: Color(0xFFEBEBEB),
    onPrimaryContainer: Colors.grey.shade800,
  );
}
