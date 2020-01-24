import 'dart:math';

import 'package:bitplus/app/data/models/life_area.dart';
import 'package:bitplus/app/presentation/bloc/area_overview_bloc.dart';
import 'package:bitplus/app/presentation/widgets/area_chart.dart';
import 'package:bitplus/app/presentation/widgets/area_progress_indicator.dart';
import 'package:bitplus/app/presentation/widgets/rich_text_activity.dart';
import 'package:bitplus/core/router/router.gr.dart';
import 'package:flutter/material.dart';
import 'package:bitplus/core/extensions/string_extension.dart';
import 'package:supercharged/supercharged.dart';
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
          child: Column(
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: 24.0,
                  vertical: 24.0,
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    Text(
                      area.name.capitalize,
                      style: TextStyle(
                        fontSize: 18.0,
                        fontWeight: FontWeight.w700,
                        color: Color(area.color),
                        letterSpacing: 1.0,
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
              Padding(
                padding: const EdgeInsets.only(
                  top: 16.0,
                  bottom: 24.0,
                  left: 24.0,
                  right: 24.0,
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        RichTextActivity(
                          amount: area.countChecksPositive,
                          color: Colors.blueAccent,
                          text: '',
                        ),
                        Expanded(
                          child: Padding(
                            padding: const EdgeInsets.symmetric(
                              horizontal: 16.0,
                            ),
                            child: AreaProgressIndicator(
                              value: area.countChecksPositive /
                                  (area.countChecksPositive +
                                      area.countChecksNegative),
                              color: Colors.blueAccent.withOpacity(0.84),
                              background: Colors.redAccent.withOpacity(0.84),
                            ),
                          ),
                        ),
                        RichTextActivity(
                          amount: area.countChecksNegative,
                          color: Colors.redAccent,
                          text: '',
                        ),
                      ],
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }

  double _maxAreaCount(BuildContext context) =>
      BlocProvider.of<AreaOverviewBloc>(context)
          .state
          .expand((h) => h.history)
          .max()
          .toDouble();
}
