import 'package:bitplus/core/theme/colors.dart';
import 'package:flutter/material.dart';

class RichTextActivity extends StatelessWidget {
  final int amount;
  final Color color;
  final String text;

  const RichTextActivity({
    Key key,
    @required this.amount,
    @required this.color,
    @required this.text,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return RichText(
      text: TextSpan(
        style: TextStyle(
          fontSize: 12.0,
          color: SCAFFOLD_MATERIAL_COLOR[800],
        ),
        children: [
          TextSpan(
            text: '$amount',
            style: TextStyle(
              fontSize: 16.0,
              fontWeight: FontWeight.w700,
              color: color,
            ),
          ),
          TextSpan(
            text: text,
          ),
        ],
      ),
    );
  }
}
