import 'dart:convert';

import 'package:bitplus/core/serializers/serializers.dart';
import 'package:built_collection/built_collection.dart';
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';

part 'sign_up_user.g.dart';

abstract class SignUpUser implements Built<SignUpUser, SignUpUserBuilder> {
  // Fields
  String get email;
  String get password;
  BuiltList<int> get areas;

  SignUpUser._();

  factory SignUpUser([void Function(SignUpUserBuilder) updates]) = _$SignUpUser;

  String toJsonString() {
    return json.encode(serializers.serializeWith(SignUpUser.serializer, this));
  }

  static SignUpUser fromJson(String jsonString) {
    return serializers.deserializeWith(
      SignUpUser.serializer,
      json.decode(jsonString),
    );
  }

  Map<String, dynamic> toJsonMap() {
    return json.decode(
      this.toJsonString(),
    );
  }

  static Serializer<SignUpUser> get serializer => _$signUpUserSerializer;
}
