import 'dart:convert';

import 'package:bitplus/core/serializers/serializers.dart';
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';

part 'user.g.dart';

abstract class User implements Built<User, UserBuilder> {
  // Fields
  String get userID;
  int get experience;
  int get level;

  User._();

  factory User([void Function(UserBuilder) updates]) = _$User;

  String toJsonString() {
    return json.encode(serializers.serializeWith(User.serializer, this));
  }

  static User fromJson(String jsonString) {
    return serializers.deserializeWith(
      User.serializer,
      json.decode(jsonString),
    );
  }

  Map<String, dynamic> toJsonMap() {
    return json.decode(
      this.toJsonString(),
    );
  }

  static Serializer<User> get serializer => _$userSerializer;
}
