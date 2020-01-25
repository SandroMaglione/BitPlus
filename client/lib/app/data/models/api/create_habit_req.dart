library create_habit_req;

import 'dart:convert';

import 'package:bitplus/core/serializers/serializers.dart';
import 'package:built_collection/built_collection.dart';
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';

part 'create_habit_req.g.dart';

/// Send user id and new habit parameters to create a new habit
abstract class CreateHabitReq
    implements Built<CreateHabitReq, CreateHabitReqBuilder> {
  factory CreateHabitReq([Function(CreateHabitReqBuilder b) updates]) =
      _$CreateHabitReq;

  CreateHabitReq._();

  String get uid;
  int get color;
  String get name;
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
