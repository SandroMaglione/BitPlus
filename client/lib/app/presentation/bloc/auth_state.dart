import 'package:bitplus/app/data/models/user.dart';
import 'package:super_enum/super_enum.dart';

part 'auth_state.g.dart';

@superEnum
enum _AuthState {
  @object
  AuthUninitialized,

  @Data(fields: [
    DataField('user', User),
  ])
  Authenticated,

  @object
  AuthUnauthenticated,
}
