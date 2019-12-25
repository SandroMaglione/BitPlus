import 'package:built_collection/built_collection.dart';
import 'package:super_enum/super_enum.dart';

part 'login_event.g.dart';

@superEnum
enum _LoginEvent {
  @Data(fields: [
    DataField('email', String),
    DataField('password', String),
  ])
  LoginSignInCredentials,

  @Data(fields: [
    DataField('areas', BuiltList),
  ])
  LoginSignUpGoogle,

  @object
  LoginSignInGoogle,

  @Data(fields: [
    DataField('email', String),
    DataField('password', String),
    DataField('areas', BuiltList),
  ])
  LoginSignUpCredentials,
}
