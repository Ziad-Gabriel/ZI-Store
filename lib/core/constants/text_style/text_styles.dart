import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class TextStyles {
  final TextStyle titleStyle = GoogleFonts.bebasNeue();
  final TextStyle bodyStyle = GoogleFonts.inter();

  TextTheme get appTextTheme => TextTheme(
    titleLarge: titleStyle.copyWith(
      fontSize: 30,
      fontWeight: FontWeight.w800,
      letterSpacing: 1.7,
    ),
    titleMedium: titleStyle.copyWith(
      fontSize: 26,
      fontWeight: FontWeight.w600,
      letterSpacing: 1.7,
    ),
    titleSmall: titleStyle.copyWith(
      fontSize: 22,
      fontWeight: FontWeight.w300,
      letterSpacing: 1.5,
    ),
    bodyLarge: bodyStyle.copyWith(
      fontSize: 16,
      fontWeight: FontWeight.w900,
      letterSpacing: 1.2,
    ),
    bodyMedium: bodyStyle.copyWith(
      fontSize: 14,
      fontWeight: FontWeight.w900,
      letterSpacing: 1.2,
    ),
    bodySmall: bodyStyle.copyWith(
      fontSize: 12,
      fontWeight: FontWeight.w900,
      letterSpacing: 1.2,
    ),
  );
}
