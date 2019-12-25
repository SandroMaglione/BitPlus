import 'dart:math';

import 'package:flutter/material.dart';

Color getHabitColor() {
  final rand = Random().nextInt(20);
  switch (rand) {
    case 0:
      return Color(0xFFB80C09);
    case 1:
      return Color(0xFF01BAEF);
    case 2:
      return Color(0xFFEAC435);
    case 3:
      return Color(0xFFE40066);
    case 4:
      return Color(0xFFFB4D3D);
    case 5:
      return Color(0xFF157F1F);
    case 6:
      return Color(0xFF6610F2);
    case 7:
      return Color(0xFFD11149);
    case 8:
      return Color(0xFFFED766);
    case 9:
      return Color(0xFF231942);
    case 10:
      return Color(0xFFDD4B1A);
    case 11:
      return Color(0xFF054A91);
    case 12:
      return Color(0xFFF56416);
    case 13:
      return Color(0xFF0A122A);
    case 14:
      return Color(0xFF957FEF);
    case 15:
      return Color(0xFF880044);
    case 16:
      return Color(0xFF00CC99);
    case 17:
      return Color(0xFF4E3822);
    case 18:
      return Color(0xFFE3D26F);
    case 19:
      return Color(0xFFF72C25);
    default:
      return Color(0xFFDD4B1A);
  }
}
