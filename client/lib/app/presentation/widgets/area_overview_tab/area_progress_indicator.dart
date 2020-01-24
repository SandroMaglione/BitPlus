import 'package:flutter/material.dart';

class AreaProgressIndicator extends StatelessWidget {
  final double value;
  final Color color;
  final Color background;
  final double radius;

  const AreaProgressIndicator({
    Key key,
    @required this.value,
    @required this.color,
    this.background = Colors.transparent,
    this.radius = 0.0,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(radius),
      child: LinearProgressIndicator(
        backgroundColor: background,
        value: value,
        valueColor: AlwaysStoppedAnimation<Color>(
          color,
        ),
      ),
    );
  }
}
