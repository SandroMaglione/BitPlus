// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'auth_event.dart';

// **************************************************************************
// SuperEnumGenerator
// **************************************************************************

@immutable
abstract class AuthEvent extends Equatable {
  const AuthEvent(this._type);

  factory AuthEvent.authOnStartup() = AuthOnStartup;

  factory AuthEvent.authSignIn() = AuthSignIn;

  factory AuthEvent.authSignOut() = AuthSignOut;

  factory AuthEvent.authSignInFromForm({@required User user}) =
      AuthSignInFromForm;

  factory AuthEvent.authUpdateAreas({@required BuiltList<dynamic> areas}) =
      AuthUpdateAreas;

  final _AuthEvent _type;

//ignore: missing_return
  R when<R>(
      {@required R Function(AuthOnStartup) authOnStartup,
      @required R Function(AuthSignIn) authSignIn,
      @required R Function(AuthSignOut) authSignOut,
      @required R Function(AuthSignInFromForm) authSignInFromForm,
      @required R Function(AuthUpdateAreas) authUpdateAreas}) {
    switch (this._type) {
      case _AuthEvent.AuthOnStartup:
        return authOnStartup(this as AuthOnStartup);
      case _AuthEvent.AuthSignIn:
        return authSignIn(this as AuthSignIn);
      case _AuthEvent.AuthSignOut:
        return authSignOut(this as AuthSignOut);
      case _AuthEvent.AuthSignInFromForm:
        return authSignInFromForm(this as AuthSignInFromForm);
      case _AuthEvent.AuthUpdateAreas:
        return authUpdateAreas(this as AuthUpdateAreas);
    }
  }

  @override
  List get props => null;
}

@immutable
class AuthOnStartup extends AuthEvent {
  const AuthOnStartup._() : super(_AuthEvent.AuthOnStartup);

  factory AuthOnStartup() {
    _instance ??= AuthOnStartup._();
    return _instance;
  }

  static AuthOnStartup _instance;
}

@immutable
class AuthSignIn extends AuthEvent {
  const AuthSignIn._() : super(_AuthEvent.AuthSignIn);

  factory AuthSignIn() {
    _instance ??= AuthSignIn._();
    return _instance;
  }

  static AuthSignIn _instance;
}

@immutable
class AuthSignOut extends AuthEvent {
  const AuthSignOut._() : super(_AuthEvent.AuthSignOut);

  factory AuthSignOut() {
    _instance ??= AuthSignOut._();
    return _instance;
  }

  static AuthSignOut _instance;
}

@immutable
class AuthSignInFromForm extends AuthEvent {
  const AuthSignInFromForm({@required this.user})
      : super(_AuthEvent.AuthSignInFromForm);

  final User user;

  @override
  String toString() => 'AuthSignInFromForm(user:${this.user})';
  @override
  List get props => [user];
}

@immutable
class AuthUpdateAreas extends AuthEvent {
  const AuthUpdateAreas({@required this.areas})
      : super(_AuthEvent.AuthUpdateAreas);

  final BuiltList<dynamic> areas;

  @override
  String toString() => 'AuthUpdateAreas(areas:${this.areas})';
  @override
  List get props => [areas];
}
