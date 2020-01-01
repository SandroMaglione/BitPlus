import 'package:bitplus/core/theme/colors.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class HistoryCalendarTile extends StatelessWidget {
  final Color color;
  final double colorOpacity;
  final int history;
  final DateTime date;

  const HistoryCalendarTile({
    Key key,
    @required this.color,
    @required this.history,
    @required this.date,
    @required this.colorOpacity,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(2.0),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(4.0),
        child: Opacity(
          opacity: colorOpacity == 0 ? 0.72 : 1,
          child: Container(
            color: _applyColorOpacity,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.end,
              children: <Widget>[
                Padding(
                  padding: const EdgeInsets.only(
                    bottom: 8.0,
                  ),
                  child: Column(
                    children: <Widget>[
                      Text(
                        '${DateFormat('d').format(date)}',
                        style: TextStyle(
                          fontWeight: FontWeight.w700,
                          color: colorOpacity == 0
                              ? ACCENT_COLOR.withOpacity(0.36)
                              : _makeTextLight ? WHITE : ACCENT_COLOR,
                        ),
                      ),
                      Text(
                        '${DateFormat('MMM').format(date)}',
                        style: TextStyle(
                          color: colorOpacity == 0
                              ? ACCENT_COLOR.withOpacity(0.24)
                              : _makeTextLight ? WHITE : ACCENT_COLOR,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Color get _applyColorOpacity => colorOpacity == 0
      ? WHITE
      : color.withOpacity(
          colorOpacity,
        );

  bool get _makeTextLight =>
      colorOpacity != 0 && _applyColorOpacity.computeLuminance() < 0.6;
}
