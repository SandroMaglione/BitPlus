import 'package:bitplus/core/theme/colors.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class HistoryCalendarTile extends StatelessWidget {
  final int countPositive;
  final int countNegative;
  final DateTime date;

  const HistoryCalendarTile({
    Key key,
    @required this.countNegative,
    @required this.countPositive,
    @required this.date,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(4.0),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(4.0),
        child: Container(
          decoration: BoxDecoration(
            color: SCAFFOLD_COLOR,
            border: Border.all(
              width: 1.0,
              color: SCAFFOLD_MATERIAL_COLOR[600],
            ),
          ),
          child: LayoutBuilder(
            builder: (context, constraints) => Stack(
              alignment: Alignment.center,
              children: <Widget>[
                Positioned(
                  top: 0,
                  child: Container(
                    width: constraints.maxWidth,
                    height: countNegative + countPositive == 0
                        ? 0
                        : countPositive *
                            constraints.maxHeight /
                            (countNegative + countPositive),
                    color: Colors.blueAccent.withOpacity(0.72),
                  ),
                ),
                Positioned(
                  bottom: 0,
                  child: Container(
                    width: constraints.maxWidth,
                    height: countNegative + countPositive == 0
                        ? 0
                        : countNegative *
                            constraints.maxHeight /
                            (countNegative + countPositive),
                    color: Colors.redAccent.withOpacity(0.72),
                  ),
                ),
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Text(
                      '${DateFormat('d').format(date)}',
                      style: TextStyle(
                        fontWeight: FontWeight.w700,
                        color: ACCENT_COLOR_DARK,
                      ),
                    ),
                    Text(
                      '${DateFormat('MMM').format(date)}',
                      style: TextStyle(
                        color: ACCENT_COLOR_DARK,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
