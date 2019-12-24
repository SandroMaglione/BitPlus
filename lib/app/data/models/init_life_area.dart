import 'dart:convert';

import 'package:bitplus/core/serializers/serializers.dart';
import 'package:built_collection/built_collection.dart';
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';

part 'init_life_area.g.dart';

abstract class InitLifeArea
    implements Built<InitLifeArea, InitLifeAreaBuilder> {
  BuiltList<int> get values;
  int get pointsLeft;

  bool get isAreasValid => pointsLeft == 0;

  InitLifeArea._();

  factory InitLifeArea([void Function(InitLifeAreaBuilder) updates]) =
      _$InitLifeArea;

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
