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

  String toJsonString() {
    return json.encode(serializers.serializeWith(Habit.serializer, this));
  }

  static Habit fromJson(Map<String, dynamic> jsonString) {
    return serializers.deserializeWith(
      Habit.serializer,
      jsonString,
    );
  }

  Map<String, dynamic> toJsonMap() {
    return json.decode(
      this.toJsonString(),
    );
  }

  static Serializer<Habit> get serializer => _$habitSerializer;
}
