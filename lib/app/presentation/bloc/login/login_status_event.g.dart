// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'login_status_event.dart';

// **************************************************************************
// SuperEnumGenerator
// **************************************************************************

@immutable
abstract class LoginStatusEvent extends Equatable {
  const LoginStatusEvent(this._type);

  factory LoginStatusEvent.loginStatusMoveToAreasView() =
      LoginStatusMoveToAreasView;

  factory LoginStatusEvent.loginStatusMoveToFormView() =
      LoginStatusMoveToFormView;

  final _LoginStatusEvent _type;

//ignore: missing_return
  R when<R>(
      {@required
          R Function(LoginStatusMoveToAreasView) loginStatusMoveToAreasView,
      @required
          R Function(LoginStatusMoveToFormView) loginStatusMoveToFormView}) {
    switch (this._type) {
      case _LoginStatusEvent.LoginStatusMoveToAreasView:
        return loginStatusMoveToAreasView(this as LoginStatusMoveToAreasView);
      case _LoginStatusEvent.LoginStatusMoveToFormView:
        return loginStatusMoveToFormView(this as LoginStatusMoveToFormView);
    }
  }

  @override
  List get props => null;
}

@immutable
class LoginStatusMoveToAreasView extends LoginStatusEvent {
  const LoginStatusMoveToAreasView._()
      : super(_LoginStatusEvent.LoginStatusMoveToAreasView);

  factory LoginStatusMoveToAreasView() {
    _instance ??= LoginStatusMoveToAreasView._();
    return _instance;
  }

  static LoginStatusMoveToAreasView _instance;
}

@immutable
class LoginStatusMoveToFormView extends LoginStatusEvent {
  const LoginStatusMoveToFormView._()
      : super(_LoginStatusEvent.LoginStatusMoveToFormView);

  factory LoginStatusMoveToFormView() {
    _instance ??= LoginStatusMoveToFormView._();
    return _instance;
  }

  static LoginStatusMoveToFormView _instance;
}
