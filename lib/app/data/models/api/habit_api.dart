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
///     "habitID": "0EBnmcJB7TLdEkuLIry1",
///     "checked": false,
///     "isPositive": false,
///     "color": 4281612864,
///     "value": 1,
///     "areas": [
///         3,
///         3,
///         3,
///         1,
///         1,
///         1,
///         2,
///         2,
///         2,
///         0,
///         0,
///         0
///     ],
///     "name": "Lessminus"
/// }
/// `
abstract class HabitApi implements Built<HabitApi, HabitApiBuilder> {
  HabitApi._();

  factory HabitApi([updates(HabitApiBuilder b)]) = _$HabitApi;

  @BuiltValueField(wireName: 'habitID')
  String get habitID;
  @BuiltValueField(wireName: 'checked')
  bool get checked;
  @BuiltValueField(wireName: 'isPositive')
  bool get isPositive;
  @BuiltValueField(wireName: 'color')
  int get color;
  @BuiltValueField(wireName: 'value')
  int get value;
  @BuiltValueField(wireName: 'areas')
  BuiltList<int> get areas;
  @BuiltValueField(wireName: 'name')
  String get name;

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
