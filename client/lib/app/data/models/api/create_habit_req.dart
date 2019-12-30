library create_habit_req;

import 'dart:convert';

import 'package:bitplus/core/serializers/serializers.dart';
import 'package:built_collection/built_collection.dart';
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';

part 'create_habit_req.g.dart';

abstract class CreateHabitReq
    implements Built<CreateHabitReq, CreateHabitReqBuilder> {
  CreateHabitReq._();

  factory CreateHabitReq([updates(CreateHabitReqBuilder b)]) = _$CreateHabitReq;

  @BuiltValueField(wireName: 'uid')
  String get uid;
  @BuiltValueField(wireName: 'color')
  int get color;
  @BuiltValueField(wireName: 'name')
  String get name;
  @BuiltValueField(wireName: 'areas')
  BuiltList<int> get areas;

  String toJson() {
    return json.encode(
      serializers.serializeWith(
        CreateHabitReq.serializer,
        this,
      ),
    );
  }

  static CreateHabitReq fromJson(String jsonString) {
    return serializers.deserializeWith(
      CreateHabitReq.serializer,
      json.decode(
        jsonString,
      ),
    );
  }

  static Serializer<CreateHabitReq> get serializer =>
      _$createHabitReqSerializer;
}
