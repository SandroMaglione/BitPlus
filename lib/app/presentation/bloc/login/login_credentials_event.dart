import 'package:super_enum/super_enum.dart';

part 'login_credentials_event.g.dart';

@superEnum
enum _LoginCredentialsEvent {
  @Data(fields: [
    DataField('email', String),
  ])
  LoginCredentialsChangeEmail,

  @Data(fields: [
    DataField('password', String),
  ])
  LoginCredentialsChangePassword,
}
