library login_status_info;

import 'dart:convert';

import 'package:bitplus/core/serializers/serializers.dart';
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';

part 'login_status_info.g.dart';

abstract class LoginStatusInfo
    implements Built<LoginStatusInfo, LoginStatusInfoBuilder> {
  LoginStatusInfo._();

  factory LoginStatusInfo([updates(LoginStatusInfoBuilder b)]) =
      _$LoginStatusInfo;

  bool get isAreasCompleted;
  bool get isAreasValid;
  bool get isEmailValid;
  bool get isPasswordValid;

  bool get isValid => isAreasValid && isPasswordValid && isEmailValid;

  String toJson() {
    return json.encode(
      serializers.serializeWith(
        LoginStatusInfo.serializer,
        this,
      ),
    );
  }

  static LoginStatusInfo fromJson(String jsonString) {
    return serializers.deserializeWith(
      LoginStatusInfo.serializer,
      json.decode(
        jsonString,
      ),
    );
  }

  static Serializer<LoginStatusInfo> get serializer =>
      _$loginStatusInfoSerializer;
}
