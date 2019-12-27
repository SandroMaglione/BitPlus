library life_area;

import 'dart:convert';

import 'package:bitplus/core/serializers/serializers.dart';
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';

part 'life_area.g.dart';

abstract class LifeArea implements Built<LifeArea, LifeAreaBuilder> {
  LifeArea._();

  factory LifeArea([updates(LifeAreaBuilder b)]) = _$LifeArea;

  @BuiltValueField(wireName: 'name')
  String get name;
  @BuiltValueField(wireName: 'value')
  double get value;
  @BuiltValueField(wireName: 'icon')
  String get icon;
  String toJson() {
    return json.encode(
      serializers.serializeWith(
        LifeArea.serializer,
        this,
      ),
    );
  }

  static LifeArea fromJson(String jsonString) {
    return serializers.deserializeWith(
      LifeArea.serializer,
      json.decode(
        jsonString,
      ),
    );
  }

  static Serializer<LifeArea> get serializer => _$lifeAreaSerializer;
}
