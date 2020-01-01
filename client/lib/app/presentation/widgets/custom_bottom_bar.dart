import 'package:bitplus/core/theme/colors.dart';
import 'package:flutter/material.dart';

class CustomBottomBar extends StatelessWidget {
  final int currentIndex;
  final void Function(int index) onTap;
  final List<BottomNavigationBarItem> items;

  const CustomBottomBar({
    Key key,
    @required this.currentIndex,
    @required this.onTap,
    @required this.items,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: const BorderRadius.only(
        topLeft: Radius.circular(16.0),
        topRight: Radius.circular(16.0),
      ),
      child: BottomNavigationBar(
        currentIndex: currentIndex,
        selectedItemColor: ACCENT_COLOR_DARK,
        unselectedItemColor: ACCENT_COLOR_DARK.withOpacity(0.56),
        backgroundColor: WHITE,
        showSelectedLabels: true,
        showUnselectedLabels: false,
        onTap: onTap,
        items: items,
      ),
    );
  }
}
