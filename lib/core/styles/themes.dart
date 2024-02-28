import 'package:flutter/material.dart';
import 'package:messenger_task/core/styles/colors.dart';

abstract class MyThemes {
  static ThemeData lightTheme = ThemeData(
    fontFamily: 'Mulish',
    colorScheme: const ColorScheme.light(
      background: MyColors.lightMainColor,
      onPrimary: MyColors.darkMainColor,
      onSecondary: MyColors.darkFormFieldColor,
      onSurface: MyColors.lightFormFieldColor,
    ),
  );

  static ThemeData darkTheme = ThemeData(
    fontFamily: 'Mulish',
    colorScheme: const ColorScheme.dark(
      background: MyColors.darkMainColor,
      onPrimary: MyColors.lightMainColor,
      onSecondary: MyColors.lightFormFieldColor,
      onSurface: MyColors.darkFormFieldColor,
    ),
  );
}