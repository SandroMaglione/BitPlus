import 'package:bitplus/core/theme/colors.dart';
import 'package:flutter/material.dart';

class StreakIndicator extends StatelessWidget {
  final int color;
  final int streak;

  const StreakIndicator({
    Key key,
    this.color,
    this.streak,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CircleAvatar(
      backgroundColor: SCAFFOLD_COLOR,
      foregroundColor: Color(color),
      child: Text(
        'x$streak',
        style: TextStyle(
          color: Color(color),
          fontWeight: FontWeight.w700,
        ),
      ),
    );
  }
}
