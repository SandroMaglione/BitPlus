import 'package:bitplus/app/data/models/history_habit.dart';
import 'package:bitplus/core/theme/colors.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class HistoryHabitTile extends StatelessWidget {
  final HistoryHabit historyHabit;
  final int areaIndex;

  const HistoryHabitTile({
    Key key,
    @required this.historyHabit,
    @required this.areaIndex,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.symmetric(
          horizontal: 8.0,
          vertical: 4.0,
        ),
        child: ListTile(
          title: Text(
            historyHabit.habit.name,
            style: TextStyle(
              fontWeight: FontWeight.w700,
              color: Color(historyHabit.habit.color),
            ),
          ),
          subtitle: Text(
            '${DateFormat('d MMM y').format(historyHabit.historyCheck.day)}',
          ),
          trailing: CircleAvatar(
            backgroundColor: historyHabit.habit.areas[areaIndex] > 0
                ? Colors.blueAccent.withOpacity(0.84)
                : Colors.redAccent.withOpacity(0.84),
            child: Text(
              historyHabit.habit.areas[areaIndex] > 0
                  ? '+${historyHabit.habit.areas[areaIndex]}'
                  : '${historyHabit.habit.areas[areaIndex]}',
              style: TextStyle(
                color: SCAFFOLD_COLOR,
                fontWeight: FontWeight.w700,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
