import 'dart:math';

import 'package:bitplus/app/data/models/life_area.dart';
import 'package:bitplus/app/presentation/bloc/area_overview_bloc.dart';
import 'package:bitplus/app/presentation/widgets/area_chart.dart';
import 'package:bitplus/app/presentation/widgets/area_progress_indicator.dart';
import 'package:bitplus/app/presentation/widgets/rich_text_activity.dart';
import 'package:bitplus/core/router/router.gr.dart';
import 'package:bitplus/core/theme/colors.dart';
import 'package:flutter/material.dart';
import 'package:bitplus/core/extensions/string_extension.dart';
import 'package:bitplus/core/extensions/build_collection_extension.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AreaPage extends StatelessWidget {
  final LifeArea area;
  final int areaIndex;

  const AreaPage({
    @required this.area,
    @required this.areaIndex,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(
        horizontal: 8.0,
        vertical: 8.0,
      ),
      child: Card(
        child: InkWell(
          onTap: () {
            Navigator.of(context).pushNamed(
              Router.historyMapScreen,
              arguments: HistoryMapScreenArguments(
                history: area.history.toList(),
                habitHistory: area.habitChecks.toList(),
                name: area.name,
                color: area.color,
                areaIndex: areaIndex,
              ),
            );
          },
          child: Padding(
            padding: const EdgeInsets.only(
              top: 16.0,
              bottom: 24.0,
              left: 20.0,
              right: 20.0,
            ),
            child: Column(
              children: <Widget>[
                Padding(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 8.0,
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      Text(
                        area.name.capitalize,
                        style: TextStyle(
                          fontSize: 16.0,
                          fontWeight: FontWeight.w700,
                          color: Color(area.color),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: CircleAvatar(
                          backgroundColor: SCAFFOLD_COLOR,
                          foregroundColor: _colorAlert,
                          child: Icon(
                            _iconAlert,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                Expanded(
                  child: AreaChart(
                    history: area.history.toList(),
                    color: Color(area.color),
                    maxY: _maxAreaCount(context),
                  ),
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    AreaProgressIndicator(
                      value: area.percentageActivity,
                      color: _colorAlert.withOpacity(0.84),
                    ),
                    AreaProgressIndicator(
                      value: area.percentageArea,
                      color: SCAFFOLD_COLOR,
                    ),
                    SizedBox(
                      height: 12.0,
                    ),
                    RichTextActivity(
                      amount: area.countChecksPositive,
                      color: Colors.blueAccent,
                      text: ' good activities the last 30 days',
                    ),
                    RichTextActivity(
                      amount: area.countChecksNegative,
                      color: Colors.redAccent,
                      text: ' bad activities the last 30 days',
                    ),
                  ],
                )
              ],
            ),
          ),
        ),
      ),
    );
  }

  double _maxAreaCount(BuildContext context) =>
      BlocProvider.of<AreaOverviewBloc>(context).state.fold(
            0.0,
            (prevMax, current) => current.history.reduceEmpty(0, max) > prevMax
                ? current.history.reduce(max).toDouble()
                : prevMax,
          );

  IconData get _iconAlert =>
      area.percentageArea > .75 && area.percentageActivity < .25
          ? Icons.sentiment_very_dissatisfied
          : area.percentageArea > .5 && area.percentageActivity < .25
              ? Icons.sentiment_dissatisfied
              : area.percentageArea > .5 && area.percentageActivity < .5
                  ? Icons.sentiment_neutral
                  : area.percentageArea > .25 && area.percentageActivity < .5
                      ? Icons.sentiment_satisfied
                      : Icons.sentiment_very_satisfied;

  Color get _colorAlert =>
      area.percentageArea > .75 && area.percentageActivity < .25
          ? Colors.black87
          : area.percentageArea > .5 && area.percentageActivity < .25
              ? Colors.redAccent
              : area.percentageArea > .5 && area.percentageActivity < .5
                  ? Colors.orangeAccent
                  : area.percentageArea > .25 && area.percentageActivity < .5
                      ? Colors.greenAccent
                      : Colors.blueAccent;
}
