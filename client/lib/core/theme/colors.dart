import 'package:flutter/material.dart';

const Color WHITE = Colors.white;
const Color BLACK = Colors.black;

const int PRIMARY_COLOR_INT = 0xFFf3f5fa;
const Color PRIMARY_COLOR = Color(PRIMARY_COLOR_INT);
const MaterialColor PRIMARY_MATERIAL_COLOR = MaterialColor(
  PRIMARY_COLOR_INT,
  <int, Color>{
    50: Color(0xFFd1d1d1),
    100: Color(0xFFd7dbde),
    200: Color(0xFFbcc3ca),
    300: Color(0xFFa0abb6),
    400: Color(0xFF8a98a6),
    500: Color(0xFF748696),
    600: Color(0xFF677785),
    700: Color(0xFF56626e),
    800: Color(0xFF474f58),
    900: Color(PRIMARY_COLOR_INT),
  },
);

const int SCAFFOLD_INT_VALUE = 0xFFf3f5fa;
const Color SCAFFOLD_COLOR = Color(SCAFFOLD_INT_VALUE);
const MaterialColor SCAFFOLD_MATERIAL_COLOR = MaterialColor(
  SCAFFOLD_INT_VALUE,
  <int, Color>{
    50: Color(SCAFFOLD_INT_VALUE),
    100: Color(0xFFe1e7f0),
    200: Color(0xFFcfd7e4),
    300: Color(0xFFbac5d7),
    400: Color(0xFFa9b6ca),
    500: Color(0xFF98a7bf),
    600: Color(0xFF8896ac),
    700: Color(0xFF758092),
    800: Color(0xFF646d7b),
    900: Color(0xFF4f5662),
  },
);

const Color SURFACE_DARK_COLOR = Color(0xFFe5e5e5);

const Color ACCENT_COLOR = Color(0xFF311b92);
const Color ACCENT_COLOR_LIGHT = Color(0xFF6746c3);
const Color ACCENT_COLOR_DARK = Color(0xFF000063);

const Color BUTTON_COLOR = Color(0xFF0062CC);
const Color SPLASH_COLOR = Color(0xFFfafafa);
const Color TEXT_COLOR = Color(0xFF212529);
const String FONT_FAMILY = 'Effra';

const Color POSITIVE_COLOR = Colors.blueAccent;
const Color NEGATIVE_COLOR = Colors.redAccent;

const List<Color> HABIT_COLORS = [
  Color(0xFFFED766),
  Color(0xFFEAC435),
  Color(0xFFDD4B1A),
  Color(0xFFB80C09),
  Color(0xFF01BAEF),
  Color(0xFF231942),
];
