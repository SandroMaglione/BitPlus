import 'dart:convert';

import 'package:bitplus/core/serializers/serializers.dart';
import 'package:built_collection/built_collection.dart';
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';

part 'creation_habit.g.dart';

abstract class CreationHabit implements Built<CreationHabit, CreationHabitBuilder> {
  // Fields
  String get name;
  int get color;
  BuiltList<int> get lifeAreas;

  CreationHabit._();

  factory CreationHabit([void Function(CreationHabitBuilder) updates]) = _$CreationHabit;

  String toJsonString() {
    return json.encode(serializers.serializeWith(CreationHabit.serializer, this));
  }

  static CreationHabit fromJson(Map<String, dynamic> jsonString) {
    return serializers.deserializeWith(
      CreationHabit.serializer,
      jsonString,
    );
  }

  Map<String, dynamic> toJsonMap() {
    return json.decode(
      this.toJsonString(),
    );
  }

  static Serializer<CreationHabit> get serializer => _$creationHabitSerializer;
}
