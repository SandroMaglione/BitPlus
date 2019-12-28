import 'package:bitplus/app/presentation/bloc/bloc.dart';
import 'package:bitplus/core/router/router.gr.dart';
import 'package:bitplus/core/theme/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  final String title;
  final String subtitle;
  final List<Widget> actions;

  const CustomAppBar({this.actions, this.title, this.subtitle});

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
          Icon(
            Icons.person,
            color: ACCENT_COLOR_DARK,
          ),
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
          InkWell(
            onTap: () {},
            child: Icon(
              Icons.subject,
              color: ACCENT_COLOR_DARK,
            ),
          ),
        ],
      ),
    );
  }

  @override
  Size get preferredSize => Size(
        double.infinity,
        96.0,
      );
}
