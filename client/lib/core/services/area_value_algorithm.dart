import 'package:bitplus/app/data/models/habit.dart';
import 'package:bitplus/app/data/models/history_habit.dart';
import 'package:built_collection/built_collection.dart';
import 'package:dartx/dartx.dart';

abstract class AreaValueAlgorithm {
  BuiltList<int> getDailyChecksCount(
    int areaIndex,
    BuiltList<Habit> habitList,
  );

  int getCountChecksPositive(
    int areaIndex,
    BuiltList<Habit> habitList,
  );

  int getCountChecksNegative(
    int areaIndex,
    BuiltList<Habit> habitList,
  );

  double getUserValue(
    int areaIndex,
    int userWeight,
    BuiltList<Habit> habitList,
  );

  double buildAreaPercentage(
    int areaIndex,
  );

  double buildActivityPercentage(
    int areaIndex,
    BuiltList<int> userAreas,
  );

  BuiltList<HistoryHabit> buildHabitActivity(
    int areaIndex,
    BuiltList<Habit> habitList,
  );
}

class ValueAlgorithmV1 implements AreaValueAlgorithm {
  final int dateRange;

  const ValueAlgorithmV1(
    this.dateRange,
  );

  @override
  int getCountChecksNegative(
    int areaIndex,
    BuiltList<Habit> habitList,
  ) =>
      habitList
          .where((habit) => habit.areas[areaIndex] < 0)
          .map(
            (habit) => habit.countChecks,
          )
          .sum();

  @override
  int getCountChecksPositive(
    int areaIndex,
    BuiltList<Habit> habitList,
  ) =>
      habitList
          .where((habit) => habit.areas[areaIndex] > 0)
          .map(
            (habit) => habit.countChecks,
          )
          .sum();

  @override
  BuiltList<int> getDailyChecksCount(
    int areaIndex,
    BuiltList<Habit> habitList,
  ) =>
      BuiltList<int>(
        List<int>.filled(dateRange, 0)
            .mapIndexed(
              (dayIndex, count) => habitList
                  .map(
                    (habit) => habit.history[dayIndex].isChecked &&
                            habit.areas[areaIndex] > 0 // Only positive habits
                        ? 1
                        : 0,
                  )
                  .sum(),
            )
            .toList(),
      );

  @override
  double getUserValue(
    int areaIndex,
    int userWeight,
    BuiltList<Habit> habitList,
  ) =>
      habitList
          .map(
            (habit) =>
                habit.countChecks *
                (habit.areas[areaIndex] * (userWeight + 1) / 4),
          )
          .sum() /
      (userWeight + 1);

  @override
  BuiltList<HistoryHabit> buildHabitActivity(
    int areaIndex,
    BuiltList<Habit> habitList,
  ) =>
      habitList
          .where(
            (habit) => habit.areas[areaIndex] != 0,
          )
          .map(
            (habit) => habit.history
                .where(
                  (check) => check.isChecked,
                )
                .map(
                  (historyDayCheck) => HistoryHabit(
                    (h) => h
                      ..habit = habit.toBuilder()
                      ..historyDayCheck = historyDayCheck.toBuilder(),
                  ),
                )
                .toBuiltList(),
          )
          .toBuiltList()
          .expand(
            (subList) => subList,
          )
          .toBuiltList();

  @override
  double buildActivityPercentage(int areaIndex, BuiltList<int> userAreas) {
    // TODO: implement buildActivityPercentage
    return null;
  }

  @override
  double buildAreaPercentage(int areaIndex) {
    // TODO: implement buildAreaPercentage
    return null;
  }
}
