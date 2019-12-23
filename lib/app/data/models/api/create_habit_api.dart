library create_habit_api;

import 'dart:convert';

import 'package:bitplus/core/serializers/serializers.dart';
import 'package:built_collection/built_collection.dart';
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';

part 'create_habit_api.g.dart';

abstract class CreateHabitApi
    implements Built<CreateHabitApi, CreateHabitApiBuilder> {
  CreateHabitApi._();

  factory CreateHabitApi([updates(CreateHabitApiBuilder b)]) = _$CreateHabitApi;

  @BuiltValueField(wireName: 'color')
  int get color;
  @BuiltValueField(wireName: 'name')
  String get name;
  @BuiltValueField(wireName: 'isPositive')
  bool get isPositive;
  @BuiltValueField(wireName: 'value')
  int get value;
  @BuiltValueField(wireName: 'areas')
  BuiltList<int> get areas;
  @BuiltValueField(wireName: 'dateCreated')
  DateTime get dateCreated;

  String toJson() {
    return json.encode(
      serializers.serializeWith(
        CreateHabitApi.serializer,
        this,
      ),
    );
  }

  static CreateHabitApi fromJson(String jsonString) {
    return serializers.deserializeWith(
      CreateHabitApi.serializer,
      json.decode(
        jsonString,
      ),
    );
  }

  static Serializer<CreateHabitApi> get serializer =>
      _$createHabitApiSerializer;
}
