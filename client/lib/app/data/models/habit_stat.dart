import 'dart:convert';

import 'package:bitplus/app/data/models/habit.dart';
import 'package:bitplus/app/data/models/habit_entity.dart';
import 'package:bitplus/core/serializers/serializers.dart';
import 'package:built_collection/built_collection.dart';
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';

part 'habit_stat.g.dart';

abstract class HabitStat implements Built<HabitStat, HabitStatBuilder> {
  // Fields
  Habit get habit;
  BuiltList<HabitEntity> get habitEntities;
  DateTime get startDate;
  DateTime get endDate;

  HabitStat._();

  factory HabitStat([void Function(HabitStatBuilder) updates]) = _$HabitStat;

  String toJson() {
    return json.encode(serializers.serializeWith(HabitStat.serializer, this));
  }

  static HabitStat fromJson(String jsonString) {
    return serializers.deserializeWith(
        HabitStat.serializer, json.decode(jsonString));
  }

  static Serializer<HabitStat> get serializer => _$habitStatSerializer;
}
