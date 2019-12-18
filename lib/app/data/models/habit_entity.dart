import 'dart:convert';

import 'package:bitplus/core/serializers/serializers.dart';
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';

part 'habit_entity.g.dart';

abstract class HabitEntity implements Built<HabitEntity, HabitEntityBuilder> {
  // Fields
  HabitEntity get habitEntity;
  bool get isChecked;
  DateTime get date;

  HabitEntity._();

  factory HabitEntity([void Function(HabitEntityBuilder) updates]) = _$HabitEntity;

  String toJson() {
    return json.encode(serializers.serializeWith(HabitEntity.serializer, this));
  }

  static HabitEntity fromJson(String jsonString) {
    return serializers.deserializeWith(
        HabitEntity.serializer, json.decode(jsonString));
  }

  static Serializer<HabitEntity> get serializer => _$habitEntitySerializer;
}
