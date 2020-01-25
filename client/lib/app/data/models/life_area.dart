library life_area;

import 'dart:convert';

import 'package:bitplus/app/data/models/habit.dart';
import 'package:bitplus/app/data/models/history_habit.dart';
import 'package:bitplus/app/data/models/life_area_setting.dart';
import 'package:bitplus/core/serializers/serializers.dart';
import 'package:built_collection/built_collection.dart';
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';

part 'life_area.g.dart';

/// All the data about each area
abstract class LifeArea implements Built<LifeArea, LifeAreaBuilder> {
  factory LifeArea([Function(LifeAreaBuilder b) updates]) = _$LifeArea;

  LifeArea._();

  /// AreaID, name, and color of the area
  LifeAreaSetting get areaSettings;

  /// User weight
  double get value;

  /// User weight/importance
  int get userWeight;

  /// Number of positive check in the last X days
  int get countChecksPositive;

  /// Number of negative check in the last X days
  int get countChecksNegative;

  /// Relative percentage user weight of the area
  double get percentageArea;

  /// Relative percentage of activity/checks in last X days
  double get percentageActivity;

  /// Count checks for each of the last X days
  BuiltList<int> get history;

  /// Reference to the [Habit] and its check history
  BuiltList<HistoryHabit> get historyHabit;

  int get areaID => areaSettings.areaID;
  String get name => areaSettings.name;
  int get color => areaSettings.color;

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
          ..areaSettings = lifeAreaSetting.toBuilder()
          ..value = 0
          ..userWeight = 0
          ..countChecksPositive = 0
          ..countChecksNegative = 0
          ..percentageActivity = 0.0
          ..percentageArea = 0.0
          ..history = ListBuilder<int>()
          ..historyHabit = ListBuilder<HistoryHabit>(),
      );

  static Serializer<LifeArea> get serializer => _$lifeAreaSerializer;
}
