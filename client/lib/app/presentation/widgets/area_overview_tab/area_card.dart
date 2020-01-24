import 'package:bitplus/app/data/models/life_area.dart';
import 'package:bitplus/app/presentation/bloc/area_overview_bloc.dart';
import 'package:bitplus/app/presentation/widgets/area_overview_tab/area_chart.dart';
import 'package:bitplus/app/presentation/widgets/area_overview_tab/area_progress_indicator.dart';
import 'package:bitplus/core/router/router.gr.dart';
import 'package:bitplus/core/theme/colors.dart';
import 'package:flutter/material.dart';
import 'package:bitplus/core/extensions/string_extension.dart';
import 'package:supercharged/supercharged.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AreaCard extends StatelessWidget {
  final LifeArea area;
  final int areaIndex;

  const AreaCard({
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
          onTap: () => _onTapViewAreaInfo(context),
          child: Column(
            children: <Widget>[
              _areaName,
              Expanded(
                child: _areaChart(context),
              ),
              Padding(
                padding: const EdgeInsets.only(
                  top: 16.0,
                  bottom: 24.0,
                  left: 24.0,
                  right: 24.0,
                ),
                child: _bottomProgressIndicator,
              )
            ],
          ),
        ),
      ),
    );
  }

  void _onTapViewAreaInfo(BuildContext context) {
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
  }

  Widget get _areaName => Padding(
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
      );

  AreaChart _areaChart(BuildContext context) => AreaChart(
        history: area.history.toList(),
        color: Color(area.color),
        maxY: _maxAreaCount(context),
      );

  Widget get _bottomProgressIndicator => Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              _countText(
                area.countChecksPositive,
                POSITIVE_COLOR,
              ),
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 16.0,
                  ),
                  child: AreaProgressIndicator(
                    value: _progressPercentage,
                    color: POSITIVE_COLOR.withOpacity(0.84),
                    background: NEGATIVE_COLOR.withOpacity(0.84),
                  ),
                ),
              ),
              _countText(
                area.countChecksNegative,
                NEGATIVE_COLOR,
              ),
            ],
          ),
        ],
      );

  Text _countText(int amount, Color color) => Text(
        '$amount',
        style: TextStyle(
          fontSize: 16.0,
          fontWeight: FontWeight.w700,
          color: color,
        ),
      );

  double get _progressPercentage =>
      area.countChecksPositive /
      (area.countChecksPositive + area.countChecksNegative);

  double _maxAreaCount(BuildContext context) =>
      BlocProvider.of<AreaOverviewBloc>(context)
          .state
          .expand((h) => h.history)
          .max()
          .toDouble();
}
