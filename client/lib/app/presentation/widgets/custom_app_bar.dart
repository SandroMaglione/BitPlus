import 'package:bitplus/core/router/router.gr.dart';
import 'package:bitplus/core/theme/colors.dart';
import 'package:flutter/material.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  final String title;
  final String subtitle;
  final void Function() rightAction;
  final void Function() leftAction;
  final IconData rightIcon;
  final IconData leftIcon;

  const CustomAppBar({
    @required this.title,
    this.subtitle,
    this.leftAction,
    this.rightAction,
    this.rightIcon,
    this.leftIcon,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(
        left: 32.0,
        right: 32.0,
        top: 30.0,
        bottom: 24.0,
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          _backAction(context),
          Column(
            children: <Widget>[
              Text(
                title.toUpperCase(),
                style: TextStyle(
                  fontSize: 20.0,
                  fontWeight: FontWeight.w700,
                  color: ACCENT_COLOR_DARK,
                ),
              ),
              Text(
                subtitle != null ? subtitle.toUpperCase() : 'BITPLUS',
                style: TextStyle(
                  fontSize: 12.0,
                  fontWeight: FontWeight.w300,
                  color: ACCENT_COLOR,
                ),
              ),
            ],
          ),
          if (rightAction != null)
            GestureDetector(
              onTap: rightAction,
              child: Icon(
                rightIcon,
                color: ACCENT_COLOR_DARK,
              ),
            )
          else
            GestureDetector(
              onTap: () {
                Navigator.of(context).pushNamed(
                  Router.creationHabitScreen,
                );
              },
              child: Icon(
                Icons.playlist_add,
                color: ACCENT_COLOR_DARK,
              ),
            ),
        ],
      ),
    );
  }

  @override
  Size get preferredSize => const Size(
        double.infinity,
        96.0,
      );

  Widget _backAction(BuildContext context) => Navigator.of(context).canPop()
      ? GestureDetector(
          onTap: () => Navigator.of(context).pop(),
          child: Icon(
            Icons.arrow_back,
            color: ACCENT_COLOR_DARK,
          ),
        )
      : GestureDetector(
          onTap: leftAction,
          child: Icon(
            leftIcon ?? Icons.exit_to_app,
            color: ACCENT_COLOR_DARK,
          ),
        );
}
