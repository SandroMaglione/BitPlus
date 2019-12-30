library habit_api;

import 'dart:convert';

import 'package:bitplus/core/serializers/serializers.dart';
import 'package:built_collection/built_collection.dart';
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';

part 'habit_api.g.dart';

/// Model created from Firestore api of an habit to check/uncheck
///
/// `
/// {
///     "habitID": "CebuGYIOqoz2xetmbUGx",
///     "checked": false,
///     "isPositive": true,
///     "color": 4280490306,
///     "value": 13,
///     "areas": [
///         3,
///         3,
///         0,
///         0,
///         3,
///         0,
///         0,
///         0,
///         0,
///         0,
///         0,
///         0
///     ],
///     "name": "Call it a day",
///     "history": [
///         false,
///         true,
///         true,
///         false,
///         false,
///         false,
///         false,
///         false
///     ],
///     "streak": 2,
///     "countChecks": 2
/// }
/// `
abstract class HabitApi implements Built<HabitApi, HabitApiBuilder> {
  HabitApi._();

  factory HabitApi([updates(HabitApiBuilder b)]) = _$HabitApi;

  @BuiltValueField(wireName: 'habitID')
  String get habitID;
  @BuiltValueField(wireName: 'checked')
  bool get checked;
  @BuiltValueField(wireName: 'color')
  int get color;
  @BuiltValueField(wireName: 'areas')
  BuiltList<int> get areas;
  @BuiltValueField(wireName: 'name')
  String get name;
  @BuiltValueField(wireName: 'history')
  BuiltList<bool> get history;
  @BuiltValueField(wireName: 'streak')
  int get streak;
  @BuiltValueField(wireName: 'countChecks')
  int get countChecks;

  String toJson() {
    return json.encode(serializers.serializeWith(HabitApi.serializer, this));
  }

  static HabitApi fromJson(String jsonString) {
    return serializers.deserializeWith(
      HabitApi.serializer,
      json.decode(
        jsonString,
      ),
    );
  }

  static Serializer<HabitApi> get serializer => _$habitApiSerializer;
}
