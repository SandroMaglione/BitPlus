import 'package:bitplus/app/data/models/life_area.dart';
import 'package:bitplus/app/presentation/widgets/area_progress_indicator.dart';
import 'package:bitplus/core/router/router.gr.dart';
import 'package:bitplus/core/theme/colors.dart';
import 'package:flutter/material.dart';

class AreaTile extends StatelessWidget {
  final LifeArea area;
  final double percentageActivity;
  final double percentageArea;

  const AreaTile({
    @required this.area,
    @required this.percentageActivity,
    @required this.percentageArea,
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
                name: area.name,
                color: area.color,
              ),
            );
          },
          child: Padding(
            padding: const EdgeInsets.symmetric(
              vertical: 4.0,
              horizontal: 20.0,
            ),
            child: Row(
              children: <Widget>[
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
                VerticalDivider(
                  width: 4.0,
                  color: SCAFFOLD_COLOR,
                ),
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 16.0,
                      vertical: 12.0,
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Padding(
                          padding: const EdgeInsets.symmetric(
                            vertical: 4.0,
                          ),
                          child: Text(
                            area.name,
                            style: TextStyle(
                              fontSize: 16.0,
                            ),
                          ),
                        ),
                        AreaProgressIndicator(
                          value: percentageArea,
                          color: _colorAlert.withOpacity(0.84),
                        ),
                        AreaProgressIndicator(
                          value: percentageActivity,
                          color: SCAFFOLD_COLOR,
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(
                            vertical: 4.0,
                          ),
                          child: Text(
                            '${area.countChecks} activities the last 30 days',
                            style: TextStyle(
                              fontSize: 12.0,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  IconData get _iconAlert => percentageActivity > .75 && percentageArea < .25
      ? Icons.sentiment_very_dissatisfied
      : percentageActivity > .5 && percentageArea < .25
          ? Icons.sentiment_dissatisfied
          : percentageActivity > .5 && percentageArea < .5
              ? Icons.sentiment_neutral
              : percentageActivity > .25 && percentageArea < .5
                  ? Icons.sentiment_satisfied
                  : Icons.sentiment_very_satisfied;

  Color get _colorAlert => percentageActivity > .75 && percentageArea < .25
      ? Colors.black87
      : percentageActivity > .5 && percentageArea < .25
          ? Colors.redAccent
          : percentageActivity > .5 && percentageArea < .5
              ? Colors.orangeAccent
              : percentageActivity > .25 && percentageArea < .5
                  ? Colors.lightGreenAccent
                  : Colors.greenAccent;
}
