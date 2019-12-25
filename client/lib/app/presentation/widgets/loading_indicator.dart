import 'package:bitplus/core/theme/colors.dart';
import 'package:flutter/material.dart';

class LoadingIndicator extends StatelessWidget {
  final String message;
  final Color color;

  const LoadingIndicator({
    this.message,
    this.color,
  });

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          CircularProgressIndicator(
            valueColor: AlwaysStoppedAnimation(
              color ?? ACCENT_COLOR,
            ),
          ),
          if (message != null)
            SizedBox(
              height: 24.0,
            ),
          if (message != null)
            Text(
              '$message',
            ),
        ],
      ),
    );
  }
}
