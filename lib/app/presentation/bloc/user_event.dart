import 'package:super_enum/super_enum.dart';

part 'user_event.g.dart';

@superEnum
enum _UserEvent {
  @object
  GetLocalUserEvent,
  @Data(fields: [
    DataField('email', String),
    DataField('password', String),
  ])
  SignInUserEvent,
  @Data(fields: [
    DataField('email', String),
    DataField('password', String),
    DataField('areas', List),
  ])
  SignUpUserEvent,
  @object
  SignOutUserEvent,
}
