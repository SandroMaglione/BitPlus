import 'dart:convert';

import 'package:bitplus/core/serializers/serializers.dart';
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';

part 'summary.g.dart';

abstract class Summary implements Built<Summary, SummaryBuilder> {
  // Fields
  String get text;
  DateTime get date;
  int get dayTag; // TODO: Change DayTag from int to enum or Remote Config

  Summary._();

  factory Summary([void Function(SummaryBuilder) updates]) = _$Summary;

  String toJson() {
    return json.encode(serializers.serializeWith(Summary.serializer, this));
  }

  static Summary fromJson(String jsonString) {
    return serializers.deserializeWith(
        Summary.serializer, json.decode(jsonString));
  }

  static Serializer<Summary> get serializer => _$summarySerializer;
}
