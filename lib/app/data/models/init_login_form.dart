import 'dart:convert';

import 'package:bitplus/core/serializers/serializers.dart';
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';

part 'init_login_form.g.dart';

abstract class InitLoginForm
    implements Built<InitLoginForm, InitLoginFormBuilder> {
  bool get isEmailValid;
  bool get isPasswordValid;

  bool get isFormValid => isPasswordValid && isEmailValid;

  InitLoginForm._();

  factory InitLoginForm([void Function(InitLoginFormBuilder) updates]) =
      _$InitLoginForm;

  String toJson() {
    return json
        .encode(serializers.serializeWith(InitLoginForm.serializer, this));
  }

  static InitLoginForm fromJson(String jsonString) {
    return serializers.deserializeWith(
        InitLoginForm.serializer, json.decode(jsonString));
  }

  static Serializer<InitLoginForm> get serializer => _$initLoginFormSerializer;
}
