import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class TextStyles {
  final TextStyle appTextStyle = GoogleFonts.carterOne();
  final TextStyle titleTextTheme = GoogleFonts.luckiestGuy();

  TextTheme get appTextTheme => TextTheme(
    titleLarge: titleTextTheme.copyWith(
      fontSize: 28,
      fontWeight: FontWeight.w800,
      letterSpacing: 2,
    ),
    bodyLarge: appTextStyle.copyWith(
      fontSize: 18,
      fontWeight: FontWeight.w200,
      letterSpacing: 1.5,
    ),
    bodyMedium: appTextStyle.copyWith(
      fontSize: 14,
      fontWeight: FontWeight.w200,
      letterSpacing: 1.5,
    ),
    bodySmall: appTextStyle.copyWith(
      fontSize: 12,
      fontWeight: FontWeight.w200,
      letterSpacing: 1.5,
    ),
  );
}
