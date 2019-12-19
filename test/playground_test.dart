import 'package:bitplus/app/data/models/habit.dart';
import 'package:built_collection/built_collection.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  test('Converting json', () {
    Habit habit = Habit(
      (h) => h
        ..habitID = '000'
        ..name = 'Olee'
        ..color = 0xFF343A40
        ..isPositive = true
        ..lifeAreas = ListBuilder<int>([1, 2, 3])
        ..value = 10,
    );

    final habitJsonString = habit.toJsonString();
    final habitJsonMap = habit.toJsonMap();

    print(habit);
    print(habitJsonString);
    print(habitJsonMap);
  });
}
