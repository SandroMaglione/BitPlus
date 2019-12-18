import 'dart:convert';

import 'package:bitplus/app/data/models/habit.dart';
import 'package:bitplus/core/serializers/serializers.dart';
import 'package:built_collection/built_collection.dart';
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';

part 'life_area.g.dart';

abstract class LifeArea implements Built<LifeArea, LifeAreaBuilder> {
  // Fields
  String get lifeAreaID;
  String get name;
  String get icon; // TODO: Change String to Icon (somehow)
  int get experience;
  BuiltList<Habit> get habits;

  LifeArea._();

  factory LifeArea([void Function(LifeAreaBuilder) updates]) = _$LifeArea;

  String toJson() {
    return json.encode(serializers.serializeWith(LifeArea.serializer, this));
  }

  static LifeArea fromJson(String jsonString) {
    return serializers.deserializeWith(
        LifeArea.serializer, json.decode(jsonString));
  }

  static Serializer<LifeArea> get serializer => _$lifeAreaSerializer;
}
