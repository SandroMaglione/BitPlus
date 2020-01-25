import 'package:bitplus/app/data/models/habit.dart';
import 'package:bitplus/app/data/models/history_day_check.dart';
import 'package:bitplus/core/services/area_value_algorithm.dart';
import 'package:built_collection/built_collection.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  AreaValueAlgorithm areaValueAlgorithm;

  const tDateRange = 3;
  final tHabitList = BuiltList<Habit>([
    Habit(
      (h) => h
        ..habitID = '1'
        ..checked = true
        ..countChecks = 10
        ..color = 000
        ..name = 'h1'
        ..streak = 0
        ..areas = ListBuilder<int>([1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1])
        ..history = ListBuilder<HistoryDayCheck>([
          HistoryDayCheck((h) => h
            ..day = DateTime(2020, 1, 1)
            ..isChecked = true),
          HistoryDayCheck((h) => h
            ..day = DateTime(2020, 1, 2)
            ..isChecked = false),
          HistoryDayCheck((h) => h
            ..day = DateTime(2020, 1, 3)
            ..isChecked = true),
        ]),
    ),
    Habit(
      (h) => h
        ..habitID = '2'
        ..checked = false
        ..countChecks = 10
        ..color = 000
        ..name = 'h2'
        ..streak = 0
        ..areas = ListBuilder<int>([1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1])
        ..history = ListBuilder<HistoryDayCheck>([
          HistoryDayCheck((h) => h
            ..day = DateTime(2020, 1, 1)
            ..isChecked = false),
          HistoryDayCheck((h) => h
            ..day = DateTime(2020, 1, 2)
            ..isChecked = true),
          HistoryDayCheck((h) => h
            ..day = DateTime(2020, 1, 3)
            ..isChecked = true),
        ]),
    ),
    Habit(
      (h) => h
        ..habitID = '3'
        ..checked = true
        ..countChecks = 10
        ..color = 000
        ..name = 'h3'
        ..streak = 0
        ..areas = ListBuilder<int>([1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1])
        ..history = ListBuilder<HistoryDayCheck>([
          HistoryDayCheck((h) => h
            ..day = DateTime(2020, 1, 1)
            ..isChecked = false),
          HistoryDayCheck((h) => h
            ..day = DateTime(2020, 1, 2)
            ..isChecked = false),
          HistoryDayCheck((h) => h
            ..day = DateTime(2020, 1, 3)
            ..isChecked = false),
        ]),
    ),
  ]);

  setUp(() {
    areaValueAlgorithm = const ValueAlgorithmV1(tDateRange);
  });

  group('getCountChecksPositive', () {
    test('should count correct number of positive checks', () async {
      final result = areaValueAlgorithm.getCountChecksPositive(1, tHabitList);
      expect(result, 4);
    });
  });

  group('getCountChecksNegative', () {
    test('should count correct number of positive checks', () async {
      final result = areaValueAlgorithm.getCountChecksNegative(1, tHabitList);
      expect(result, 4);
    });
  });

  group('getUserValue', () {
    test('should count correct number of positive checks', () async {
      final result = areaValueAlgorithm.getUserValue(1, 1, tHabitList);
      expect(result, 4);
    });
  });

  group('getDailyChecksCount', () {
    test('should count correct number of positive checks', () async {
      final result = areaValueAlgorithm.getDailyChecksCount(1, tHabitList);
      expect(result, 4);
    });
  });

  group('buildHabitActivity', () {
    test('should count correct number of positive checks', () async {
      final result = areaValueAlgorithm.buildHabitActivity(1, tHabitList);
      expect(result, 4);
    });
  });
}
