import 'package:flutter/material.dart';
import 'package:minhtu/utils/colors.dart';

class ThemeDataSetting {
  static final ThemeData darkTheme = ThemeData(
    primaryColor: ColorUtils.darkBlueColor,
    splashColor: ColorUtils.darkBlueColor,
    highlightColor: ColorUtils.darkBlueColor,
    // fontFamily: 'Georgia',
    textTheme: const TextTheme(
      headline1: TextStyle(
        fontSize: 72.0,
        fontWeight: FontWeight.bold,
      ),
    ),
  );
  static final ThemeData lightTheme = ThemeData(
    primaryColor: ColorUtils.darkBlueColor,
    splashColor: ColorUtils.darkBlueColor,
    highlightColor: ColorUtils.darkBlueColor,
    // fontFamily: 'Georgia',
    textTheme: const TextTheme(

      headline1: TextStyle(
        fontSize: 72.0,
        fontWeight: FontWeight.bold,
      ),
    ),
  );
}
