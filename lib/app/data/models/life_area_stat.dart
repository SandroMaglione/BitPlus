import 'dart:convert';

import 'package:bitplus/app/data/models/habit_stat.dart';
import 'package:bitplus/app/data/models/life_area.dart';
import 'package:bitplus/core/serializers/serializers.dart';
import 'package:built_collection/built_collection.dart';
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';

part 'life_area_stat.g.dart';

abstract class LifeAreaStat
    implements Built<LifeAreaStat, LifeAreaStatBuilder> {
  // Fields
  LifeArea get lifeArea;
  DateTime get startDate;
  DateTime get endDate;
  BuiltList<HabitStat> get habitStats;

  LifeAreaStat._();

  factory LifeAreaStat([void Function(LifeAreaStatBuilder) updates]) =
      _$LifeAreaStat;

  String toJson() {
    return json
        .encode(serializers.serializeWith(LifeAreaStat.serializer, this));
  }

  static LifeAreaStat fromJson(String jsonString) {
    return serializers.deserializeWith(
        LifeAreaStat.serializer, json.decode(jsonString));
  }

  static Serializer<LifeAreaStat> get serializer => _$lifeAreaStatSerializer;
}
