library user;

import 'dart:convert';

import 'package:bitplus/core/serializers/serializers.dart';
import 'package:built_collection/built_collection.dart';
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';

part 'user.g.dart';

/// User account info
/// 
/// User id, email, and areas weight
abstract class User implements Built<User, UserBuilder> {
  factory User([Function(UserBuilder b) updates]) = _$User;

  User._();

  String get uid;
  String get email;
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
