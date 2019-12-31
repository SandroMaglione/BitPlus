library life_area;

import 'dart:convert';

import 'package:bitplus/app/data/models/history_habit.dart';
import 'package:bitplus/app/data/models/life_area_setting.dart';
import 'package:bitplus/core/serializers/serializers.dart';
import 'package:built_collection/built_collection.dart';
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';

import 'history_check.dart';

part 'life_area.g.dart';

abstract class LifeArea implements Built<LifeArea, LifeAreaBuilder> {
  LifeArea._();

  factory LifeArea([updates(LifeAreaBuilder b)]) = _$LifeArea;

  @BuiltValueField(wireName: 'name')
  String get name;
  @BuiltValueField(wireName: 'value')
  double get value;
  @BuiltValueField(wireName: 'color')
  int get color;
  @BuiltValueField(wireName: 'countChecks')
  int get countChecks;
  @BuiltValueField(wireName: 'history')
  BuiltList<int> get history;
  @BuiltValueField(wireName: 'habitChecks')
  BuiltList<HistoryHabit> get habitChecks;
  @BuiltValueField(wireName: 'percentageArea')
  double get percentageArea;
  @BuiltValueField(wireName: 'percentageActivity')
  double get percentageActivity;
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

  static LifeArea fromSetting(LifeAreaSetting lifeAreaSetting) {
    return LifeArea(
      (l) => l
        ..name = lifeAreaSetting.name
        ..color = lifeAreaSetting.color
        ..icon = lifeAreaSetting.icon
        ..countChecks = 0
        ..history = ListBuilder<int>()
        ..percentageActivity = 0.0
        ..percentageArea = 0.0
        ..value = 0
        ..habitChecks = ListBuilder<HistoryHabit>(),
    );
  }

  static Serializer<LifeArea> get serializer => _$lifeAreaSerializer;
}
