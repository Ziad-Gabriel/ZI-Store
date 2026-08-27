import 'package:flutter/material.dart';
import 'package:zi_store/core/constants/colors/const_colors.dart';

class AppColorScheme {
  static ColorScheme get lightColorScheme => const ColorScheme.light(
    brightness: Brightness.light,
    primary: primaryColor,
    secondary: secondaryColor,
    error: errorColor,
    surface: lightBackgroundColor,
    primaryContainer: lightContainerColor,
    onSurface: darkContainerColor,
    onPrimary: lightContainerColor,
    shadow: lightShadowColor,
  );

  static ColorScheme get darkColorScheme => ColorScheme.dark(
    brightness: Brightness.dark,
    primary: primaryColor,
    secondary: secondaryColor,
    error: errorColor,
    surface: darkBackgroundColor,
    primaryContainer: darkContainerColor,
    onSurface: Color(0xFFEBEBEB),
    onPrimary: lightContainerColor,
    shadow: darkShadowColor,
  );
}
