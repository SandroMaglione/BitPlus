import 'package:flutter/material.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  final String title;
  final String subtitle;
  final List<Widget> actions;

  const CustomAppBar({
    this.actions,
    this.title,
    this.subtitle
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Padding(
        padding: const EdgeInsets.symmetric(
          horizontal: 32.0,
          vertical: 24.0,
        ),
        child: Row(
          children: <Widget>[
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Text(
                  subtitle ?? 'Welcome',
                  style: TextStyle(
                    fontSize: 12.0,
                    fontWeight: FontWeight.w300,
                  ),
                ),
                Text(
                  title ?? 'Welcome',
                  style: TextStyle(
                    fontSize: 24.0,
                    fontWeight: FontWeight.w700,
                  ),
                ),
              ],
            ),
            if (actions != null)
              Expanded(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: actions,
                ),
              ),
          ],
        ),
      ),
    );
  }

  @override
  Size get preferredSize => Size(
        double.infinity,
        96.0,
      );
}
