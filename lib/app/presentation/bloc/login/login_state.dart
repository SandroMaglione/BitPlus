import 'package:bitplus/app/data/models/user.dart';
import 'package:super_enum/super_enum.dart';

part 'login_state.g.dart';

@superEnum
enum _LoginState {
  @object
  LoginInProgress,
  @object
  LoginSubmitting,
  @Data(fields: [
    DataField('user', User),
  ])
  LoginSuccess,
  @Data(fields: [
    DataField('message', String),
  ])
  LoginFailure,
}
