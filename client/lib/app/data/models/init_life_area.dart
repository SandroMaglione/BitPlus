library init_life_area;

import 'dart:convert';

import 'package:bitplus/core/serializers/serializers.dart';
import 'package:built_collection/built_collection.dart';
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';

part 'init_life_area.g.dart';

/// Manages the assignment of points to each area
abstract class InitLifeArea
    implements Built<InitLifeArea, InitLifeAreaBuilder> {
  factory InitLifeArea([void Function(InitLifeAreaBuilder) updates]) =
      _$InitLifeArea;

  InitLifeArea._();

  int get pointsLeft;
  BuiltList<int> get values;

  bool get isAreasValid => pointsLeft == 0;

  String toJson() {
    return json
        .encode(serializers.serializeWith(InitLifeArea.serializer, this));
  }

  static InitLifeArea fromJson(String jsonString) {
    return serializers.deserializeWith(
        InitLifeArea.serializer, json.decode(jsonString));
  }

  static Serializer<InitLifeArea> get serializer => _$initLifeAreaSerializer;
}
