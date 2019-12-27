import 'dart:math';

import 'package:bitplus/app/presentation/widgets/custom_app_bar.dart';
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
          subtitle: name,
          title: 'Last ${history.length} days',
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
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 7,
                    childAspectRatio: 1 / 1,
                    crossAxisSpacing: 0,
                    mainAxisSpacing: 0,
                  ),
                  itemCount: history.length,
                  itemBuilder: (context, index) => Container(
                    decoration: BoxDecoration(
                      border: Border.all(
                        width: 1,
                        color: Color.fromRGBO(0, 0, 0, 0.24),
                      ),
                      color: Color(color).withOpacity(
                        history[index] / history.reduce(max),
                      ),
                    ),
                    child: Container(
                      alignment: Alignment.center,
                      child: Text('${history[index]}'),
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
