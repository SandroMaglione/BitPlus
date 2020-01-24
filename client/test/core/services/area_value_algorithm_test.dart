import 'package:bitplus/app/data/models/api/habit_api.dart';
import 'package:bitplus/app/data/models/history_check.dart';
import 'package:bitplus/core/services/area_value_algorithm.dart';
import 'package:built_collection/built_collection.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  AreaValueAlgorithm areaValueAlgorithm;

  const tDateRange = 3;
  final tHabitList = BuiltList<HabitApi>([
    HabitApi(
      (h) => h
        ..habitID = '1'
        ..checked = true
        ..countChecks = 10
        ..color = 000
        ..name = 'h1'
        ..streak = 0
        ..areas = ListBuilder<int>([1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1])
        ..history = ListBuilder<HistoryCheck>([
          HistoryCheck((h) => h
            ..day = DateTime(2020, 1, 1)
            ..isChecked = true),
          HistoryCheck((h) => h
            ..day = DateTime(2020, 1, 2)
            ..isChecked = false),
          HistoryCheck((h) => h
            ..day = DateTime(2020, 1, 3)
            ..isChecked = true),
        ]),
    ),
    HabitApi(
      (h) => h
        ..habitID = '2'
        ..checked = false
        ..countChecks = 10
        ..color = 000
        ..name = 'h2'
        ..streak = 0
        ..areas = ListBuilder<int>([1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1])
        ..history = ListBuilder<HistoryCheck>([
          HistoryCheck((h) => h
            ..day = DateTime(2020, 1, 1)
            ..isChecked = false),
          HistoryCheck((h) => h
            ..day = DateTime(2020, 1, 2)
            ..isChecked = true),
          HistoryCheck((h) => h
            ..day = DateTime(2020, 1, 3)
            ..isChecked = true),
        ]),
    ),
    HabitApi(
      (h) => h
        ..habitID = '3'
        ..checked = true
        ..countChecks = 10
        ..color = 000
        ..name = 'h3'
        ..streak = 0
        ..areas = ListBuilder<int>([1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1])
        ..history = ListBuilder<HistoryCheck>([
          HistoryCheck((h) => h
            ..day = DateTime(2020, 1, 1)
            ..isChecked = false),
          HistoryCheck((h) => h
            ..day = DateTime(2020, 1, 2)
            ..isChecked = false),
          HistoryCheck((h) => h
            ..day = DateTime(2020, 1, 3)
            ..isChecked = false),
        ]),
    ),
  ]);

  setUp(() {
    areaValueAlgorithm = const ValueAlgorithmV1(tDateRange);
  });

  group('buildCountChecksPositive', () {
    test('should count correct number of positive checks', () async {
      final result = areaValueAlgorithm.buildCountChecksPositive(1, tHabitList);
      expect(result, 4);
    });
  });
}
