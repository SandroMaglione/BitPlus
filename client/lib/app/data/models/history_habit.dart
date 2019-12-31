library history_habit;

import 'dart:convert';

import 'package:bitplus/app/data/models/api/habit_api.dart';
import 'package:bitplus/app/data/models/history_check.dart';
import 'package:bitplus/core/serializers/serializers.dart';
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';

part 'history_habit.g.dart';

abstract class HistoryHabit implements Built<HistoryHabit, HistoryHabitBuilder> {
  HistoryHabit._();

  factory HistoryHabit([updates(HistoryHabitBuilder b)]) = _$HistoryHabit;

  @BuiltValueField(wireName: 'habit')
  HabitApi get habit;
  @BuiltValueField(wireName: 'historyCheck')
  HistoryCheck get historyCheck;

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
