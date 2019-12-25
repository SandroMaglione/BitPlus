library user_account;

import 'dart:convert';

import 'package:bitplus/core/serializers/serializers.dart';
import 'package:built_collection/built_collection.dart';
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';

part 'post_user_account.g.dart';

/// Model posted on sign up to register the user account
abstract class PostUserAccount
    implements Built<PostUserAccount, PostUserAccountBuilder> {
  PostUserAccount._();

  factory PostUserAccount([updates(PostUserAccountBuilder b)]) =
      _$PostUserAccount;

  @BuiltValueField(wireName: 'uid')
  String get uid;
  @BuiltValueField(wireName: 'email')
  String get email;
  @BuiltValueField(wireName: 'areas')
  BuiltList<int> get areas;

  String toJson() {
    return json.encode(
      serializers.serializeWith(
        PostUserAccount.serializer,
        this,
      ),
    );
  }

  static PostUserAccount fromJson(String jsonString) {
    return serializers.deserializeWith(
      PostUserAccount.serializer,
      json.decode(
        jsonString,
      ),
    );
  }

  static Serializer<PostUserAccount> get serializer =>
      _$postUserAccountSerializer;
}
