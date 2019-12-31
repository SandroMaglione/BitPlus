library life_area_setting;

import 'dart:convert';

import 'package:bitplus/core/serializers/serializers.dart';
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';

part 'life_area_setting.g.dart';

abstract class LifeAreaSetting implements Built<LifeAreaSetting, LifeAreaSettingBuilder> {
  LifeAreaSetting._();

  factory LifeAreaSetting([updates(LifeAreaSettingBuilder b)]) = _$LifeAreaSetting;

  @BuiltValueField(wireName: 'name')
  String get name;
  @BuiltValueField(wireName: 'color')
  int get color;
  @BuiltValueField(wireName: 'icon')
  String get icon;

  String toJson() {
    return json.encode(
      serializers.serializeWith(
        LifeAreaSetting.serializer,
        this,
      ),
    );
  }

  static LifeAreaSetting fromJson(String jsonString) {
    return serializers.deserializeWith(
      LifeAreaSetting.serializer,
      json.decode(
        jsonString,
      ),
    );
  }

  static Serializer<LifeAreaSetting> get serializer => _$lifeAreaSettingSerializer;
}
