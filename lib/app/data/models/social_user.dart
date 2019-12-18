import 'dart:convert';

import 'package:bitplus/app/data/models/life_area_stat.dart';
import 'package:bitplus/app/data/models/user.dart';
import 'package:bitplus/core/serializers/serializers.dart';
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';

part 'social_user.g.dart';

abstract class SocialUser implements Built<SocialUser, SocialUserBuilder> {
  // Fields
  User get user;
  String get username;
  LifeAreaStat get lifeAreaStat;

  SocialUser._();

  factory SocialUser([void Function(SocialUserBuilder) updates]) = _$SocialUser;

  String toJson() {
    return json.encode(serializers.serializeWith(SocialUser.serializer, this));
  }

  static SocialUser fromJson(String jsonString) {
    return serializers.deserializeWith(
        SocialUser.serializer, json.decode(jsonString));
  }

  static Serializer<SocialUser> get serializer => _$socialUserSerializer;
}
