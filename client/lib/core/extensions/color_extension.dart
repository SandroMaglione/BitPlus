import 'package:flutter/material.dart';

extension TextLight on Color {
  bool get makeTextLight => computeLuminance() < 0.6;
}
