import 'dart:convert';

import 'package:bitplus/app/data/models/social_user.dart';
import 'package:bitplus/core/serializers/serializers.dart';
import 'package:built_collection/built_collection.dart';
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';

part 'social_user_stat.g.dart';

abstract class SocialUserStat
    implements Built<SocialUserStat, SocialUserStatBuilder> {
  // Fields
  BuiltList<SocialUser> get socialUsers;
  DateTime get startDate;
  DateTime get endDate;

  SocialUserStat._();

  factory SocialUserStat([void Function(SocialUserStatBuilder) updates]) =
      _$SocialUserStat;

  String toJson() {
    return json
        .encode(serializers.serializeWith(SocialUserStat.serializer, this));
  }

  static SocialUserStat fromJson(String jsonString) {
    return serializers.deserializeWith(
        SocialUserStat.serializer, json.decode(jsonString));
  }

  static Serializer<SocialUserStat> get serializer =>
      _$socialUserStatSerializer;
}
