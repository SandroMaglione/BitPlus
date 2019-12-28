import 'package:flutter/material.dart';

extension TextLight on Color {
  bool get makeTextLight => this.computeLuminance() < 0.6;
}
