// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'auth_state.dart';

// **************************************************************************
// SuperEnumGenerator
// **************************************************************************

@immutable
abstract class AuthState extends Equatable {
  const AuthState(this._type);

  factory AuthState.authUninitialized() = AuthUninitialized;

  factory AuthState.authenticated({@required User user}) = Authenticated;

  factory AuthState.authUnauthenticated() = AuthUnauthenticated;

  final _AuthState _type;

//ignore: missing_return
  R when<R>(
      {@required R Function(AuthUninitialized) authUninitialized,
      @required R Function(Authenticated) authenticated,
      @required R Function(AuthUnauthenticated) authUnauthenticated}) {
    switch (this._type) {
      case _AuthState.AuthUninitialized:
        return authUninitialized(this as AuthUninitialized);
      case _AuthState.Authenticated:
        return authenticated(this as Authenticated);
      case _AuthState.AuthUnauthenticated:
        return authUnauthenticated(this as AuthUnauthenticated);
    }
  }

  @override
  List get props => null;
}

@immutable
class AuthUninitialized extends AuthState {
  const AuthUninitialized._() : super(_AuthState.AuthUninitialized);

  factory AuthUninitialized() {
    _instance ??= AuthUninitialized._();
    return _instance;
  }

  static AuthUninitialized _instance;
}

@immutable
class Authenticated extends AuthState {
  const Authenticated({@required this.user}) : super(_AuthState.Authenticated);

  final User user;

  @override
  String toString() => 'Authenticated(user:${this.user})';
  @override
  List get props => [user];
}

@immutable
class AuthUnauthenticated extends AuthState {
  const AuthUnauthenticated._() : super(_AuthState.AuthUnauthenticated);

  factory AuthUnauthenticated() {
    _instance ??= AuthUnauthenticated._();
    return _instance;
  }

  static AuthUnauthenticated _instance;
}
