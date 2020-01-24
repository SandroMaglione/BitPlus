library life_area;

import 'dart:convert';

import 'package:bitplus/app/data/models/history_habit.dart';
import 'package:bitplus/app/data/models/life_area_setting.dart';
import 'package:bitplus/core/serializers/serializers.dart';
import 'package:built_collection/built_collection.dart';
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';

part 'life_area.g.dart';

abstract class LifeArea implements Built<LifeArea, LifeAreaBuilder> {
  factory LifeArea([Function(LifeAreaBuilder b) updates]) = _$LifeArea;

  LifeArea._();

  @BuiltValueField(wireName: 'name')
  String get name;
  @BuiltValueField(wireName: 'value')
  double get value;
  @BuiltValueField(wireName: 'userWeight')
  int get userWeight;
  @BuiltValueField(wireName: 'color')
  int get color;
  @BuiltValueField(wireName: 'countChecksPositive')
  int get countChecksPositive;
  @BuiltValueField(wireName: 'countChecksNegative')
  int get countChecksNegative;
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

  static LifeArea fromSetting(LifeAreaSetting lifeAreaSetting) => LifeArea(
        (l) => l
          ..name = lifeAreaSetting.name
          ..color = lifeAreaSetting.color
          ..icon = lifeAreaSetting.icon
          ..countChecksPositive = 0
          ..countChecksNegative = 0
          ..history = ListBuilder<int>()
          ..percentageActivity = 0.0
          ..percentageArea = 0.0
          ..value = 0
          ..userWeight = 0
          ..habitChecks = ListBuilder<HistoryHabit>(),
      );

  static Serializer<LifeArea> get serializer => _$lifeAreaSerializer;
}
