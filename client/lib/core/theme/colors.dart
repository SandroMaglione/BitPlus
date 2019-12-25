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

const Color SCAFFOLD_COLOR = Color(0xFFf3f5fa);
const Color SURFACE_DARK_COLOR = Color(0xFFe5e5e5);

const Color ACCENT_COLOR = Color(0xFF311b92);
const Color ACCENT_COLOR_LIGHT = Color(0xFF6746c3);
const Color ACCENT_COLOR_DARK = Color(0xFF000063);

const Color BUTTON_COLOR = Color(0xFF0062CC);
const Color SPLASH_COLOR = Color(0xFFfafafa);
const Color TEXT_COLOR = Color(0xFF212529);
const String FONT_FAMILY = 'Effra';
