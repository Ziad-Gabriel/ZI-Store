import 'package:flutter/material.dart';
import 'package:zi_store/core/constants/colors/const_colors.dart';

class LightColorScheme {
  static ColorScheme get lightColorScheme => const ColorScheme.light(
    brightness: Brightness.light,
    primary: primaryColor,
    surface: lightBackgroundColor,
    primaryContainer: lightContainerColor,
    onPrimary: Color(0XFF0D0D0D),
  );
}
