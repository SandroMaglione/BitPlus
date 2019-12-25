library user;

import 'dart:convert';

import 'package:bitplus/core/serializers/serializers.dart';
import 'package:built_collection/built_collection.dart';
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';

part 'user.g.dart';

/// Model containing the data of a registered user
abstract class User implements Built<User, UserBuilder> {
  User._();

  factory User([updates(UserBuilder b)]) = _$User;

  @BuiltValueField(wireName: 'uid')
  String get uid;
  @BuiltValueField(wireName: 'level')
  int get level;
  @BuiltValueField(wireName: 'experience')
  int get exp;
  @BuiltValueField(wireName: 'email')
  String get email;
  @BuiltValueField(wireName: 'areas')
  BuiltList<int> get areas;

  String toJson() {
    return json.encode(
      serializers.serializeWith(
        User.serializer,
        this,
      ),
    );
  }

  static User fromJson(String jsonString) {
    return serializers.deserializeWith(
      User.serializer,
      json.decode(
        jsonString,
      ),
    );
  }

  static Serializer<User> get serializer => _$userSerializer;
}
