// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'login_credentials_event.dart';

// **************************************************************************
// SuperEnumGenerator
// **************************************************************************

@immutable
abstract class LoginCredentialsEvent extends Equatable {
  const LoginCredentialsEvent(this._type);

  factory LoginCredentialsEvent.loginCredentialsChangeEmail(
      {@required String email}) = LoginCredentialsChangeEmail;

  factory LoginCredentialsEvent.loginCredentialsChangePassword(
      {@required String password}) = LoginCredentialsChangePassword;

  final _LoginCredentialsEvent _type;

//ignore: missing_return
  R when<R>(
      {@required
          R Function(LoginCredentialsChangeEmail) loginCredentialsChangeEmail,
      @required
          R Function(LoginCredentialsChangePassword)
              loginCredentialsChangePassword}) {
    switch (this._type) {
      case _LoginCredentialsEvent.LoginCredentialsChangeEmail:
        return loginCredentialsChangeEmail(this as LoginCredentialsChangeEmail);
      case _LoginCredentialsEvent.LoginCredentialsChangePassword:
        return loginCredentialsChangePassword(
            this as LoginCredentialsChangePassword);
    }
  }

  @override
  List get props => null;
}

@immutable
class LoginCredentialsChangeEmail extends LoginCredentialsEvent {
  const LoginCredentialsChangeEmail({@required this.email})
      : super(_LoginCredentialsEvent.LoginCredentialsChangeEmail);

  final String email;

  @override
  String toString() => 'LoginCredentialsChangeEmail(email:${this.email})';
  @override
  List get props => [email];
}

@immutable
class LoginCredentialsChangePassword extends LoginCredentialsEvent {
  const LoginCredentialsChangePassword({@required this.password})
      : super(_LoginCredentialsEvent.LoginCredentialsChangePassword);

  final String password;

  @override
  String toString() =>
      'LoginCredentialsChangePassword(password:${this.password})';
  @override
  List get props => [password];
}
