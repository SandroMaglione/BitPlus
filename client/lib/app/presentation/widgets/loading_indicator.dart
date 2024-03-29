import 'package:bitplus/core/theme/colors.dart';
import 'package:flutter/material.dart';
import 'package:loading_animations/loading_animations.dart';

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
          LoadingBouncingGrid.square(
            backgroundColor: ACCENT_COLOR_LIGHT,
            duration: const Duration(
              milliseconds: 1500,
            ),
          ),
          if (message != null)
            const SizedBox(
              height: 24.0,
            ),
          if (message != null)
            Text(
              '$message',
              style: TextStyle(
                color: ACCENT_COLOR_DARK,
              ),
            ),
        ],
      ),
    );
  }
}
