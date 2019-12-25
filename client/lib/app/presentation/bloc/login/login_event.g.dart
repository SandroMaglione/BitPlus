// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'login_event.dart';

// **************************************************************************
// SuperEnumGenerator
// **************************************************************************

@immutable
abstract class LoginEvent extends Equatable {
  const LoginEvent(this._type);

  factory LoginEvent.loginSignInCredentials(
      {@required String email,
      @required String password}) = LoginSignInCredentials;

  factory LoginEvent.loginSignUpGoogle({@required BuiltList<dynamic> areas}) =
      LoginSignUpGoogle;

  factory LoginEvent.loginSignInGoogle() = LoginSignInGoogle;

  factory LoginEvent.loginSignUpCredentials(
      {@required String email,
      @required String password,
      @required BuiltList<dynamic> areas}) = LoginSignUpCredentials;

  final _LoginEvent _type;

//ignore: missing_return
  R when<R>(
      {@required R Function(LoginSignInCredentials) loginSignInCredentials,
      @required R Function(LoginSignUpGoogle) loginSignUpGoogle,
      @required R Function(LoginSignInGoogle) loginSignInGoogle,
      @required R Function(LoginSignUpCredentials) loginSignUpCredentials}) {
    switch (this._type) {
      case _LoginEvent.LoginSignInCredentials:
        return loginSignInCredentials(this as LoginSignInCredentials);
      case _LoginEvent.LoginSignUpGoogle:
        return loginSignUpGoogle(this as LoginSignUpGoogle);
      case _LoginEvent.LoginSignInGoogle:
        return loginSignInGoogle(this as LoginSignInGoogle);
      case _LoginEvent.LoginSignUpCredentials:
        return loginSignUpCredentials(this as LoginSignUpCredentials);
    }
  }

  @override
  List get props => null;
}

@immutable
class LoginSignInCredentials extends LoginEvent {
  const LoginSignInCredentials({@required this.email, @required this.password})
      : super(_LoginEvent.LoginSignInCredentials);

  final String email;

  final String password;

  @override
  String toString() =>
      'LoginSignInCredentials(email:${this.email},password:${this.password})';
  @override
  List get props => [email, password];
}

@immutable
class LoginSignUpGoogle extends LoginEvent {
  const LoginSignUpGoogle({@required this.areas})
      : super(_LoginEvent.LoginSignUpGoogle);

  final BuiltList<dynamic> areas;

  @override
  String toString() => 'LoginSignUpGoogle(areas:${this.areas})';
  @override
  List get props => [areas];
}

@immutable
class LoginSignInGoogle extends LoginEvent {
  const LoginSignInGoogle._() : super(_LoginEvent.LoginSignInGoogle);

  factory LoginSignInGoogle() {
    _instance ??= LoginSignInGoogle._();
    return _instance;
  }

  static LoginSignInGoogle _instance;
}

@immutable
class LoginSignUpCredentials extends LoginEvent {
  const LoginSignUpCredentials(
      {@required this.email, @required this.password, @required this.areas})
      : super(_LoginEvent.LoginSignUpCredentials);

  final String email;

  final String password;

  final BuiltList<dynamic> areas;

  @override
  String toString() =>
      'LoginSignUpCredentials(email:${this.email},password:${this.password},areas:${this.areas})';
  @override
  List get props => [email, password, areas];
}
