library life_area_setting;

import 'dart:convert';

import 'package:bitplus/core/serializers/serializers.dart';
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';

part 'life_area_setting.g.dart';

/// Fixed info about each area.
///
/// Area id, name, and color.
abstract class LifeAreaSetting
    implements Built<LifeAreaSetting, LifeAreaSettingBuilder> {
  factory LifeAreaSetting([Function(LifeAreaSettingBuilder b) updates]) =
      _$LifeAreaSetting;

  LifeAreaSetting._();

  /// Unique identifier of the area.
  ///
  /// Used to get the reference of the area from [LIFE_AREAS].
  /// Every area has by default its own id. The orders of the list
  /// may change, but the original [areaID] will remain the same.
  int get areaID;

  /// Name of the area
  String get name;

  /// Color [int] of the area
  int get color;

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

  static Serializer<LifeAreaSetting> get serializer =>
      _$lifeAreaSettingSerializer;
}
