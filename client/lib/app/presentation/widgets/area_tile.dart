import 'package:bitplus/app/data/models/life_area.dart';
import 'package:bitplus/app/presentation/widgets/area_progress_indicator.dart';
import 'package:bitplus/core/router/router.gr.dart';
import 'package:bitplus/core/theme/colors.dart';
import 'package:flutter/material.dart';

class AreaTile extends StatelessWidget {
  final LifeArea area;

  const AreaTile({
    @required this.area,
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
                          value: area.percentageActivity,
                          color: _colorAlert.withOpacity(0.84),
                        ),
                        AreaProgressIndicator(
                          value: area.percentageArea,
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
