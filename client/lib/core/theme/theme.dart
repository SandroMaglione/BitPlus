import 'package:bitplus/core/theme/colors.dart';
import 'package:flutter/material.dart';

final ThemeData themeData = ThemeData(
  primarySwatch: PRIMARY_MATERIAL_COLOR,
  primaryTextTheme: TextTheme(
    title: TextStyle(
      fontWeight: FontWeight.w700,
    ),
  ),
  accentColor: ACCENT_COLOR,
  scaffoldBackgroundColor: SCAFFOLD_COLOR,
  appBarTheme: AppBarTheme(
    elevation: 0.0,
    color: ACCENT_COLOR_LIGHT,
  ),
  buttonTheme: ButtonThemeData(
    buttonColor: BUTTON_COLOR,
    padding: const EdgeInsets.all(8.0),
  ),
  fontFamily: FONT_FAMILY,
  inputDecorationTheme: InputDecorationTheme(
    fillColor: PRIMARY_MATERIAL_COLOR[500],
    hintStyle: TextStyle(
      color: PRIMARY_MATERIAL_COLOR[800],
    ),
  ),
  cardTheme: CardTheme(
    elevation: 0.0,
    color: WHITE,
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(12.0),
    ),
  ),
);
