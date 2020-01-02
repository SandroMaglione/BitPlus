import 'package:bitplus/app/data/models/user.dart';
import 'package:built_collection/built_collection.dart';
import 'package:super_enum/super_enum.dart';

part 'auth_event.g.dart';

@superEnum
enum _AuthEvent {
  @object
  AuthOnStartup,
  @object
  AuthSignIn,
  @object
  AuthSignOut,
  @Data(fields: [
    DataField('user', User),
  ])
  AuthSignInFromForm,
  @Data(fields: [
    DataField('areas', BuiltList),
  ])
  AuthUpdateAreas,
}
