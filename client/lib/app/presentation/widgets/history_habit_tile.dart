import 'package:bitplus/app/data/models/history_habit.dart';
import 'package:bitplus/app/presentation/widgets/streak_indicator.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class HistoryHabitTile extends StatelessWidget {
  final HistoryHabit historyHabit;

  const HistoryHabitTile({
    Key key,
    @required this.historyHabit,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      child: ListTile(
        title: Text(
          historyHabit.habit.name,
        ),
        subtitle: Text(
          '${DateFormat('EEEE, d MMM y').format(historyHabit.historyCheck.day)}',
        ),
        trailing: StreakIndicator(
          color: historyHabit.habit.color,
          streak: historyHabit.habit.countChecks,
        ),
      ),
    );
  }
}
