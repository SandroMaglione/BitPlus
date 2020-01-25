library habit;

import 'dart:convert';

import 'package:bitplus/app/data/models/history_day_check.dart';
import 'package:bitplus/core/serializers/serializers.dart';
import 'package:built_collection/built_collection.dart';
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';

part 'habit.g.dart';

/// Single habit info and history
///
/// ```dart
/// {
///     "habitID": "CebuGYIOqoz2xetmbUGx",
///     "name": "Call it a day",
///     "checked": false,
///     "color": 4280490306,
///     "streak": 2,
///     "countChecks": 2
///     "areas": [
///         3,
///         3,
///         0,
///         0,
///         3,
///         0,
///         0,
///         0,
///         0,
///         0,
///         0,
///         0
///     ],
///     "history": [
///         {
///           "day": "01-01-2020",
///           "isChecked": true
///         }
///     ],
/// }
/// ```
abstract class Habit implements Built<Habit, HabitBuilder> {
  factory Habit([Function(HabitBuilder b) updates]) = _$Habit;

  Habit._();

  /// Reference [String] habit id
  String get habitID;

  /// Name of the habit
  String get name;

  /// True if today the habit has been checked
  bool get checked;

  /// Color [int] of the habit
  int get color;

  /// How many consecutive days has been checked
  int get streak;

  /// How many checks in the last X days
  int get countChecks;

  /// How much weight for each area
  BuiltList<int> get areas;

  /// List of [HistoryDayCheck] for the previous X days.
  /// It contains a reference to the [DateTime] and a
  /// [bool], `true` if the habit was checked that day
  BuiltList<HistoryDayCheck> get history;

  String toJson() {
    return json.encode(serializers.serializeWith(Habit.serializer, this));
  }

  static Habit fromJson(String jsonString) {
    return serializers.deserializeWith(
      Habit.serializer,
      json.decode(
        jsonString,
      ),
    );
  }

  static Serializer<Habit> get serializer => _$habitSerializer;
}
