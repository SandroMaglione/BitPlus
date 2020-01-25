library creation_habit;

import 'dart:convert';

import 'package:bitplus/core/serializers/serializers.dart';
import 'package:built_collection/built_collection.dart';
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';

part 'creation_habit.g.dart';

/// Data provided by the user when creating a new habit.
/// 
/// Name, color, and life areas weight
abstract class CreationHabit
    implements Built<CreationHabit, CreationHabitBuilder> {
  factory CreationHabit([void Function(CreationHabitBuilder) updates]) =
      _$CreationHabit;

  CreationHabit._();

  String get name;
  int get color;
  BuiltList<int> get lifeAreas;

  String toJsonString() {
    return json
        .encode(serializers.serializeWith(CreationHabit.serializer, this));
  }

  static CreationHabit fromJson(Map<String, dynamic> jsonString) {
    return serializers.deserializeWith(
      CreationHabit.serializer,
      jsonString,
    );
  }

  Map<String, dynamic> toJsonMap() {
    return json.decode(
      toJsonString(),
    ) as Map<String, dynamic>;
  }

  static Serializer<CreationHabit> get serializer => _$creationHabitSerializer;
}
