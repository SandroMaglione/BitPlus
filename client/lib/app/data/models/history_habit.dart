library history_habit;

import 'dart:convert';

import 'package:bitplus/app/data/models/history_day_check.dart';
import 'package:bitplus/core/serializers/serializers.dart';
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';

import 'habit.dart';

part 'history_habit.g.dart';

/// Data about the check status of each [Habit] for each day through 
/// the [HistoryDayCheck]
/// 
/// Used to display the habit stats for each of the previous X days
abstract class HistoryHabit
    implements Built<HistoryHabit, HistoryHabitBuilder> {
  factory HistoryHabit([Function(HistoryHabitBuilder b) updates]) =
      _$HistoryHabit;

  HistoryHabit._();

  Habit get habit;
  HistoryDayCheck get historyDayCheck;

  String toJson() {
    return json.encode(
      serializers.serializeWith(
        HistoryHabit.serializer,
        this,
      ),
    );
  }

  static HistoryHabit fromJson(String jsonString) {
    return serializers.deserializeWith(
      HistoryHabit.serializer,
      json.decode(
        jsonString,
      ),
    );
  }

  static Serializer<HistoryHabit> get serializer => _$historyHabitSerializer;
}
