// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'login_state.dart';

// **************************************************************************
// SuperEnumGenerator
// **************************************************************************

@immutable
abstract class LoginState extends Equatable {
  const LoginState(this._type);

  factory LoginState.loginInProgress() = LoginInProgress;

  factory LoginState.loginSubmitting() = LoginSubmitting;

  factory LoginState.loginSuccess({@required User user}) = LoginSuccess;

  factory LoginState.loginFailure({@required String message}) = LoginFailure;

  final _LoginState _type;

//ignore: missing_return
  R when<R>(
      {@required R Function(LoginInProgress) loginInProgress,
      @required R Function(LoginSubmitting) loginSubmitting,
      @required R Function(LoginSuccess) loginSuccess,
      @required R Function(LoginFailure) loginFailure}) {
    switch (this._type) {
      case _LoginState.LoginInProgress:
        return loginInProgress(this as LoginInProgress);
      case _LoginState.LoginSubmitting:
        return loginSubmitting(this as LoginSubmitting);
      case _LoginState.LoginSuccess:
        return loginSuccess(this as LoginSuccess);
      case _LoginState.LoginFailure:
        return loginFailure(this as LoginFailure);
    }
  }

  @override
  List get props => null;
}

@immutable
class LoginInProgress extends LoginState {
  const LoginInProgress._() : super(_LoginState.LoginInProgress);

  factory LoginInProgress() {
    _instance ??= LoginInProgress._();
    return _instance;
  }

  static LoginInProgress _instance;
}

@immutable
class LoginSubmitting extends LoginState {
  const LoginSubmitting._() : super(_LoginState.LoginSubmitting);

  factory LoginSubmitting() {
    _instance ??= LoginSubmitting._();
    return _instance;
  }

  static LoginSubmitting _instance;
}

@immutable
class LoginSuccess extends LoginState {
  const LoginSuccess({@required this.user}) : super(_LoginState.LoginSuccess);

  final User user;

  @override
  String toString() => 'LoginSuccess(user:${this.user})';
  @override
  List get props => [user];
}

@immutable
class LoginFailure extends LoginState {
  const LoginFailure({@required this.message})
      : super(_LoginState.LoginFailure);

  final String message;

  @override
  String toString() => 'LoginFailure(message:${this.message})';
  @override
  List get props => [message];
}
