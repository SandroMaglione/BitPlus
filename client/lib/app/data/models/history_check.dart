library history_check;

import 'dart:convert';

import 'package:bitplus/core/serializers/serializers.dart';
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';

part 'history_check.g.dart';

abstract class HistoryCheck implements Built<HistoryCheck, HistoryCheckBuilder> {
  HistoryCheck._();

  factory HistoryCheck([updates(HistoryCheckBuilder b)]) = _$HistoryCheck;

  @BuiltValueField(wireName: 'day')
  DateTime get day;
  @BuiltValueField(wireName: 'isChecked')
  bool get isChecked;

  String toJson() {
    return json.encode(
      serializers.serializeWith(
        HistoryCheck.serializer,
        this,
      ),
    );
  }

  static HistoryCheck fromJson(String jsonString) {
    return serializers.deserializeWith(
      HistoryCheck.serializer,
      json.decode(
        jsonString,
      ),
    );
  }

  static Serializer<HistoryCheck> get serializer => _$historyCheckSerializer;
}
