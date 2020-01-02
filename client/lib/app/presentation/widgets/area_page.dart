import 'package:bitplus/app/data/models/life_area.dart';
import 'package:bitplus/app/presentation/widgets/area_progress_indicator.dart';
import 'package:bitplus/core/router/router.gr.dart';
import 'package:bitplus/core/theme/colors.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

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
        horizontal: 16.0,
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
                        area.name,
                        style: TextStyle(
                          fontSize: 16.0,
                          fontWeight: FontWeight.w700,
                          color: ACCENT_COLOR_DARK,
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
                  child: Padding(
                    padding: const EdgeInsets.only(
                      top: 20.0,
                      bottom: 20.0,
                      right: 4.0,
                      left: 4.0,
                    ),
                    child: LineChart(
                      LineChartData(
                        gridData: FlGridData(
                          drawVerticalLine: true,
                          drawHorizontalLine: true,
                          getDrawingHorizontalLine: (val) => FlLine(
                            color: SCAFFOLD_COLOR,
                          ),
                          getDrawingVerticalLine: (val) => FlLine(
                            color: SCAFFOLD_COLOR,
                          ),
                        ),
                        backgroundColor: WHITE,
                        titlesData: FlTitlesData(
                          show: true,
                          leftTitles: SideTitles(
                            showTitles: false,
                          ),
                          bottomTitles: SideTitles(
                            showTitles: true,
                            margin: 10.0,
                            getTitles: (index) =>
                                '${DateFormat('EEE').format(DateTime.now().subtract(Duration(days: index.toInt())))}',
                          ),
                        ),
                        maxX: 6,
                        minX: 0,
                        extraLinesData: ExtraLinesData(
                          showHorizontalLines: false,
                          showVerticalLines: false,
                        ),
                        lineTouchData: LineTouchData(
                          enabled: false,
                        ),
                        lineBarsData: [
                          LineChartBarData(
                            dotData: FlDotData(
                              dotColor: Color(area.color).withOpacity(0.72),
                              dotSize: 3.0,
                            ),
                            spots: area.history
                                .getRange(0, 7)
                                .toList()
                                .reversed
                                .toList()
                                .asMap()
                                .map(
                                  (index, value) => MapEntry(
                                    index,
                                    FlSpot(
                                      index.toDouble(),
                                      value.toDouble(),
                                    ),
                                  ),
                                )
                                .values
                                .toList(),
                            isCurved: true,
                            isStrokeCapRound: true,
                            preventCurveOverShooting: true,
                            colors: [
                              Color(area.color).withOpacity(0.54),
                            ],
                            barWidth: 1.0,
                            curveSmoothness: 0.0,
                          )
                        ],
                      ),
                    ),
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
                    Divider(),
                    RichText(
                      text: TextSpan(
                        style: TextStyle(
                          fontSize: 12.0,
                          color: SCAFFOLD_MATERIAL_COLOR[800],
                        ),
                        children: [
                          TextSpan(
                            text: '${area.countChecksPositive}',
                            style: TextStyle(
                              fontSize: 16.0,
                              fontWeight: FontWeight.w700,
                              color: Colors.blueAccent,
                            ),
                          ),
                          TextSpan(
                            text: ' good activities the last 30 days',
                          ),
                        ],
                      ),
                    ),
                    RichText(
                      text: TextSpan(
                        style: TextStyle(
                          fontSize: 12.0,
                          color: SCAFFOLD_MATERIAL_COLOR[800],
                        ),
                        children: [
                          TextSpan(
                            text: '${area.countChecksNegative}',
                            style: TextStyle(
                              fontSize: 16.0,
                              fontWeight: FontWeight.w700,
                              color: Colors.redAccent,
                            ),
                          ),
                          TextSpan(
                            text: ' bad activities the last 30 days',
                          ),
                        ],
                      ),
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
