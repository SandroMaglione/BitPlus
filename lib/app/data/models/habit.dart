import 'dart:convert';

import 'package:bitplus/core/serializers/serializers.dart';
import 'package:built_collection/built_collection.dart';
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';

part 'habit.g.dart';

abstract class Habit implements Built<Habit, HabitBuilder> {
  // Fields
  String get habitID;
  String get name;
  bool get isPositive;
  int get value;
  BuiltList<int> get lifeAreas;
  int get color; // TODO: Then convert int to actial Color

  Habit._();

  factory Habit([void Function(HabitBuilder) updates]) = _$Habit;

  String toJson() {
    return json.encode(serializers.serializeWith(Habit.serializer, this));
  }

  static Habit fromJson(String jsonString) {
    return serializers.deserializeWith(
        Habit.serializer, json.decode(jsonString));
  }

  static Serializer<Habit> get serializer => _$habitSerializer;
}
