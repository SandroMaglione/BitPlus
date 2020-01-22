import 'package:bitplus/core/theme/colors.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class AreaChart extends StatelessWidget {
  final Color color;
  final List<int> history;
  final double maxY;

  const AreaChart({
    Key key,
    @required this.history,
    @required this.color,
    @required this.maxY,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
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
            leftTitles: const SideTitles(
              showTitles: false,
            ),
            bottomTitles: SideTitles(
              showTitles: true,
              margin: 10.0,
              getTitles: (index) =>
                  '${DateFormat('EEE').format(DateTime.now().subtract(Duration(days: 6 - index.toInt())))}',
            ),
          ),
          maxX: 6,
          minX: 0,
          maxY: maxY,
          extraLinesData: const ExtraLinesData(
            showHorizontalLines: false,
            showVerticalLines: false,
          ),
          lineTouchData: const LineTouchData(
            enabled: false,
          ),
          lineBarsData: [
            LineChartBarData(
              dotData: FlDotData(
                dotColor: color.withOpacity(0.72),
                dotSize: 3.0,
              ),
              spots: history
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
                color.withOpacity(0.54),
              ],
              barWidth: 1.0,
              curveSmoothness: 0.0,
            )
          ],
        ),
      ),
    );
  }
}
