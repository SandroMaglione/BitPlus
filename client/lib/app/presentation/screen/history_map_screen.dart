import 'dart:math';

import 'package:bitplus/app/data/models/history_habit.dart';
import 'package:bitplus/app/presentation/widgets/custom_app_bar.dart';
import 'package:bitplus/app/presentation/widgets/history_habit_tile.dart';
import 'package:bitplus/app/presentation/widgets/history_tile.dart';
import 'package:flutter/material.dart';

class HistoryMapScreen extends StatelessWidget {
  final List<int> history;
  final List<HistoryHabit> habitHistory;
  final String name;
  final int color;

  HistoryMapScreen({
    @required this.history,
    @required this.name,
    @required this.color,
    @required this.habitHistory,
  }) {
    habitHistory.sort(
      (h1, h2) => h2.historyCheck.day.compareTo(
        h1.historyCheck.day,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: CustomAppBar(
          title: name,
          subtitle: 'Last ${history.length} days',
        ),
        body: Padding(
          padding: const EdgeInsets.symmetric(
            horizontal: 16.0,
            vertical: 24.0,
          ),
          child: Column(
            children: <Widget>[
              Expanded(
                child: CustomScrollView(
                  slivers: <Widget>[
                    SliverGrid(
                      delegate: SliverChildBuilderDelegate(
                        (context, index) => HistoryTile(
                          color: Color(color),
                          history: history[index],
                          colorOpacity: history[index] /
                              (history.reduce(max) != 0
                                  ? history.reduce(max)
                                  : 1),
                          date: DateTime.now().subtract(
                            Duration(days: index),
                          ),
                        ),
                        childCount: history.length,
                      ),
                      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 5,
                        childAspectRatio: 1 / 1,
                        crossAxisSpacing: 0,
                        mainAxisSpacing: 0,
                      ),
                    ),
                    SliverList(
                      delegate: SliverChildBuilderDelegate(
                        (context, index) => HistoryHabitTile(
                          historyHabit: habitHistory[index],
                        ),
                        childCount: habitHistory.length,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
