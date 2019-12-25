library update_habit_req;

import 'dart:convert';

import 'package:bitplus/core/serializers/serializers.dart';
import 'package:built_collection/built_collection.dart';
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';

part 'update_habit_req.g.dart';

abstract class UpdateHabitReq
    implements Built<UpdateHabitReq, UpdateHabitReqBuilder> {
  UpdateHabitReq._();

  factory UpdateHabitReq([updates(UpdateHabitReqBuilder b)]) = _$UpdateHabitReq;

  @BuiltValueField(wireName: 'uid')
  String get uid;
  @BuiltValueField(wireName: 'habitID')
  String get habitID;
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

  String toJson() {
    return json.encode(
      serializers.serializeWith(
        UpdateHabitReq.serializer,
        this,
      ),
    );
  }

  static UpdateHabitReq fromJson(String jsonString) {
    return serializers.deserializeWith(
      UpdateHabitReq.serializer,
      json.decode(
        jsonString,
      ),
    );
  }

  static Serializer<UpdateHabitReq> get serializer =>
      _$updateHabitReqSerializer;
}
