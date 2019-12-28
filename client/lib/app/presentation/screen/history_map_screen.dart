import 'dart:math';

import 'package:bitplus/app/presentation/widgets/custom_app_bar.dart';
import 'package:bitplus/app/presentation/widgets/history_tile.dart';
import 'package:flutter/material.dart';

class HistoryMapScreen extends StatelessWidget {
  final List<int> history;
  final String name;
  final int color;

  const HistoryMapScreen({
    @required this.history,
    @required this.name,
    @required this.color,
  });

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
                child: GridView.builder(
                  physics: const NeverScrollableScrollPhysics(),
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 5,
                    childAspectRatio: 1 / 1,
                    crossAxisSpacing: 0,
                    mainAxisSpacing: 0,
                  ),
                  itemCount: history.length,
                  itemBuilder: (context, index) => HistoryTile(
                    color: Color(color),
                    history: history[index],
                    colorOpacity: history[index] /
                        (history.reduce(max) != 0 ? history.reduce(max) : 1),
                    date: DateTime.now().subtract(
                      Duration(days: index),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
