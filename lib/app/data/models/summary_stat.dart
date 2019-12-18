import 'dart:convert';

import 'package:bitplus/app/data/models/summary.dart';
import 'package:bitplus/core/serializers/serializers.dart';
import 'package:built_collection/built_collection.dart';
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';

part 'summary_stat.g.dart';

abstract class SummaryStat implements Built<SummaryStat, SummaryStatBuilder> {
  // Fields
  BuiltList<Summary> get summaries;
  DateTime get startDate;
  DateTime get endDate;

  SummaryStat._();

  factory SummaryStat([void Function(SummaryStatBuilder) updates]) =
      _$SummaryStat;

  String toJson() {
    return json.encode(serializers.serializeWith(SummaryStat.serializer, this));
  }

  static SummaryStat fromJson(String jsonString) {
    return serializers.deserializeWith(
        SummaryStat.serializer, json.decode(jsonString));
  }

  static Serializer<SummaryStat> get serializer => _$summaryStatSerializer;
}
