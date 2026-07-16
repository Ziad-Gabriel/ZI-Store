import 'package:flutter/material.dart';

import 'package:zi_store/constants/colors/const_colors.dart';
import 'package:zi_store/constants/colors/light_color_scheme.dart';
import 'package:zi_store/constants/text_style/text_styles.dart';

class LightTheme {
  static ThemeData get lightTheme => ThemeData(
    brightness: Brightness.light,
    scaffoldBackgroundColor: lightBackgroundColor,
    colorScheme: LightColorScheme.lightColorScheme,
    textTheme: TextStyles().appTextTheme,
  );
}