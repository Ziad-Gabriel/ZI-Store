import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class TextStyles {
  final TextStyle titleStyle = GoogleFonts.fugazOne();
  final TextStyle bodyStyle = GoogleFonts.stackSansText();

  TextTheme get appTextTheme => TextTheme(
    titleLarge: titleStyle.copyWith(
      fontSize: 28,
      fontWeight: FontWeight.w800,
      letterSpacing: 1.7,
    ),
    bodyLarge: bodyStyle.copyWith(
      fontSize: 16,
      fontWeight: FontWeight.w700,
      letterSpacing: 1.2,
    ),
    bodyMedium: bodyStyle.copyWith(
      fontSize: 12,
      fontWeight: FontWeight.w500,
      letterSpacing: 1.2,
    ),
    bodySmall: bodyStyle.copyWith(
      fontSize: 10,
      fontWeight: FontWeight.w500,
      letterSpacing: 1.2,
    ),
  );
}
