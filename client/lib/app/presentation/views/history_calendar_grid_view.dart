import 'package:bitplus/app/presentation/bloc/area_overview_bloc.dart';
import 'package:bitplus/app/presentation/widgets/history_calendar_tile.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:bitplus/core/extensions/date_time_extension.dart';

class HistoryCalendarGridView extends StatelessWidget {
  final List<int> history;
  final int color;
  final int areaIndex;

  const HistoryCalendarGridView({
    Key key,
    @required this.history,
    @required this.color,
    @required this.areaIndex,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      padding: const EdgeInsets.all(16.0),
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 6,
        childAspectRatio: 1 / 1,
        crossAxisSpacing: 0,
        mainAxisSpacing: 0,
      ),
      itemBuilder: (context, index) => HistoryCalendarTile(
        countNegative: BlocProvider.of<AreaOverviewBloc>(context)
            .state[areaIndex]
            .habitChecks
            .where(
              (hc) => hc.historyCheck.day.isSameDay(
                DateTime.now().subtract(
                  Duration(
                    days: index,
                  ),
                ),
              ),
            )
            .fold(
              0,
              (prev, habit) =>
                  prev +
                  (habit.historyCheck.isChecked &&
                          habit.habit.areas[areaIndex] < 0
                      ? habit.habit.areas[areaIndex].abs()
                      : 0),
            ),
        countPositive: BlocProvider.of<AreaOverviewBloc>(context)
            .state[areaIndex]
            .habitChecks
            .where(
              (hc) => hc.historyCheck.day.isSameDay(
                DateTime.now().subtract(
                  Duration(days: index),
                ),
              ),
            )
            .fold(
              0,
              (prev, habit) =>
                  prev +
                  (habit.historyCheck.isChecked &&
                          habit.habit.areas[areaIndex] > 0
                      ? habit.habit.areas[areaIndex].abs()
                      : 0),
            ),
        date: DateTime.now().subtract(
          Duration(days: index),
        ),
      ),
      itemCount: history.length,
    );
  }
}
