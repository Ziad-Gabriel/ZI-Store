import 'package:flutter/material.dart';

import 'package:zi_store/core/constants/colors/const_colors.dart';
import 'package:zi_store/core/constants/colors/dark_color_scheme.dart';
import 'package:zi_store/core/constants/text_style/text_styles.dart';

class DarkTheme {
  static ThemeData get darkTheme => ThemeData(
    brightness: Brightness.dark,
    scaffoldBackgroundColor: darkBackgroundColor,
    colorScheme: DarkColorScheme.darkColorScheme,
    textTheme: TextStyles().appTextTheme
  );
}