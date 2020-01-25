library history_day_check;

import 'dart:convert';

import 'package:bitplus/core/serializers/serializers.dart';
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';

part 'history_day_check.g.dart';

/// Single day habit checked info
abstract class HistoryDayCheck
    implements Built<HistoryDayCheck, HistoryDayCheckBuilder> {
  factory HistoryDayCheck([Function(HistoryDayCheckBuilder b) updates]) =
      _$HistoryDayCheck;

  HistoryDayCheck._();

  DateTime get day;
  bool get isChecked;

  String toJson() {
    return json.encode(
      serializers.serializeWith(
        HistoryDayCheck.serializer,
        this,
      ),
    );
  }

  static HistoryDayCheck fromJson(String jsonString) {
    return serializers.deserializeWith(
      HistoryDayCheck.serializer,
      json.decode(
        jsonString,
      ),
    );
  }

  static Serializer<HistoryDayCheck> get serializer =>
      _$historyDayCheckSerializer;
}
