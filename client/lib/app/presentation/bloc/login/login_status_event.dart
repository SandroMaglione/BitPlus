import 'package:super_enum/super_enum.dart';

part 'login_status_event.g.dart';

@superEnum
enum _LoginStatusEvent {
  @object
  LoginStatusMoveToAreasView,
  @object
  LoginStatusMoveToFormView,
}
