import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:dartx/dartx.dart';

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
          gridData: const FlGridData(
            drawVerticalLine: false,
            drawHorizontalLine: false,
          ),
          borderData: FlBorderData(
            show: false,
          ),
          titlesData: FlTitlesData(
            show: true,
            leftTitles: const SideTitles(
              showTitles: false,
            ),
            bottomTitles: SideTitles(
              showTitles: true,
              margin: 10.0,
              getTitles: (index) {
                if (index != 0 && index != 6) {
                  return '${DateFormat('EEE').format(DateTime.now().subtract(Duration(days: 6 - index.toInt())))}';
                } else {
                  return '';
                }
              },
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
                dotColor: color.withOpacity(0.54),
                dotSize: 0.0,
              ),
              spots: history
                  .getRange(0, 7)
                  .toList()
                  .reversed
                  .mapIndexed(
                    (index, value) => FlSpot(
                      index.toDouble(),
                      value.toDouble(),
                    ),
                  )
                  .toList(),
              isCurved: true,
              isStrokeCapRound: true,
              preventCurveOverShooting: true,
              colors: [
                color.withOpacity(0.54),
              ],
              barWidth: 2.0,
              curveSmoothness: 0.4,
            )
          ],
        ),
      ),
    );
  }
}
