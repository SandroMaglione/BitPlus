library update_habit_req;

import 'dart:convert';

import 'package:bitplus/core/serializers/serializers.dart';
import 'package:built_collection/built_collection.dart';
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';

part 'update_habit_req.g.dart';

/// Send user and habit id to update habit with new parameters
abstract class UpdateHabitReq
    implements Built<UpdateHabitReq, UpdateHabitReqBuilder> {
  factory UpdateHabitReq([Function(UpdateHabitReqBuilder b) updates]) =
      _$UpdateHabitReq;

  UpdateHabitReq._();

  String get uid;
  String get habitID;
  int get color;
  String get name;
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
