import 'package:flutter/material.dart';

import 'package:zi_store/core/constants/colors/const_colors.dart';
import 'package:zi_store/core/constants/colors/color_schemes.dart';
import 'package:zi_store/core/constants/text_style/text_styles.dart';

class AppTheme {

  static ThemeData get lightTheme => ThemeData(
    brightness: Brightness.light,
    scaffoldBackgroundColor: lightBackgroundColor,
    colorScheme: AppColorScheme.lightColorScheme,
    textTheme: TextStyles().appTextTheme,
  );

  static ThemeData get darkTheme => ThemeData(
    brightness: Brightness.dark,
    scaffoldBackgroundColor: darkBackgroundColor,
    colorScheme: AppColorScheme.darkColorScheme,
    textTheme: TextStyles().appTextTheme
  );
}