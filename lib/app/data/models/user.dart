import 'dart:convert';

import 'package:bitplus/core/error/exceptions.dart';
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

  // ATTENTION: dynamic i.e. Map<String, dynamic> or String
  static User fromJson(dynamic jsonString) {
    if (jsonString is Map<String, dynamic> || jsonString is String) {
      return serializers.deserializeWith(
        User.serializer,
        jsonString,
      );
    } else {
      throw JsonConvertFormatException();
    }
  }

  Map<String, dynamic> toJsonMap() {
    return json.decode(
      this.toJsonString(),
    );
  }

  static Serializer<User> get serializer => _$userSerializer;
}
