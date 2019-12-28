import 'package:bitplus/core/theme/colors.dart';
import 'package:flutter/material.dart';

class AreaProgressIndicator extends StatelessWidget {
  final double value;
  final Color color;

  const AreaProgressIndicator({
    Key key,
    @required this.value,
    @required this.color,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(
        6.0,
      ),
      child: LinearProgressIndicator(
        backgroundColor: WHITE,
        value: value,
        valueColor: AlwaysStoppedAnimation<Color>(
          color,
        ),
      ),
    );
  }
}
