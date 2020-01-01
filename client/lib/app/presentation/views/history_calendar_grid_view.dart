import 'dart:math';

import 'package:bitplus/app/presentation/widgets/history_calendar_tile.dart';
import 'package:flutter/material.dart';

class HistoryCalendarGridView extends StatelessWidget {
  final List<int> history;
  final int color;

  const HistoryCalendarGridView({
    Key key,
    @required this.history,
    @required this.color,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      padding: const EdgeInsets.all(16.0),
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 6,
        childAspectRatio: 1 / 1,
        crossAxisSpacing: 0,
        mainAxisSpacing: 0,
      ),
      itemBuilder: (context, index) => HistoryCalendarTile(
        color: Color(color),
        history: history[index],
        colorOpacity: history[index] /
            (history.reduce(max) != 0 ? history.reduce(max) : 1),
        date: DateTime.now().subtract(
          Duration(days: index),
        ),
      ),
      itemCount: history.length,
    );
  }
}
