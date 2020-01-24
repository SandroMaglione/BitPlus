import 'package:bitplus/app/data/models/api/habit_api.dart';
import 'package:bitplus/app/data/models/history_habit.dart';
import 'package:built_collection/built_collection.dart';
import 'package:dartx/dartx.dart';

abstract class AreaValueAlgorithm {
  BuiltList<int> buildHistory(
    int areaIndex,
    BuiltList<HabitApi> habitList,
  );

  int buildCountChecksPositive(
    int areaIndex,
    BuiltList<HabitApi> habitList,
  );

  int buildCountChecksNegative(
    int areaIndex,
    BuiltList<HabitApi> habitList,
  );

  double buildValue(
    int areaIndex,
    int userWeight,
    BuiltList<HabitApi> habitList,
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
    BuiltList<HabitApi> habitList,
  );
}

class ValueAlgorithmV1 implements AreaValueAlgorithm {
  final int dateRange;

  const ValueAlgorithmV1(
    this.dateRange,
  );

  @override
  int buildCountChecksNegative(
    int areaIndex,
    BuiltList<HabitApi> habitList,
  ) =>
      habitList
          .where((habit) => habit.areas[areaIndex] < 0)
          .map(
            (habit) => habit.countChecks,
          )
          .sum();

  @override
  int buildCountChecksPositive(
    int areaIndex,
    BuiltList<HabitApi> habitList,
  ) =>
      habitList
          .where((habit) => habit.areas[areaIndex] > 0)
          .map(
            (habit) => habit.countChecks,
          )
          .sum();

  @override
  BuiltList<int> buildHistory(
    int areaIndex,
    BuiltList<HabitApi> habitList,
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
  double buildValue(
    int areaIndex,
    int userWeight,
    BuiltList<HabitApi> habitList,
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
    BuiltList<HabitApi> habitList,
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
                  (historyCheck) => HistoryHabit(
                    (h) => h
                      ..habit = habit.toBuilder()
                      ..historyCheck = historyCheck.toBuilder(),
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
