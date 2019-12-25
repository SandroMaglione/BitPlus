import 'dart:async';
import 'package:meta/meta.dart';
import 'package:bitplus/app/data/models/init_login_form.dart';
import 'package:bitplus/core/utils/login_validator.dart';
import 'package:bloc/bloc.dart';
import '../bloc.dart';

/// Manage email and password during the registration process, and activates button clicks
/// if parameters are valid
class LoginCredentialsBloc extends Bloc<LoginCredentialsEvent, InitLoginForm> {
  final LoginValidator loginValidator;

  LoginCredentialsBloc({
    @required this.loginValidator,
  });

  @override
  InitLoginForm get initialState => InitLoginForm(
        (i) => i
          ..isEmailValid = false
          ..isPasswordValid = false,
      );

  @override
  Stream<InitLoginForm> mapEventToState(
    LoginCredentialsEvent event,
  ) async* {
    yield* event.when(
      loginCredentialsChangeEmail: (e) =>
          _mapLoginCredentialsChangeEmail(e.email),
      loginCredentialsChangePassword: (e) =>
          _mapLoginCredentialsChangePassword(e.password),
    );
  }

  Stream<InitLoginForm> _mapLoginCredentialsChangePassword(
    String password,
  ) async* {
    yield state.rebuild(
      (s) => s..isPasswordValid = loginValidator.isValidPassword(password),
    );
  }

  Stream<InitLoginForm> _mapLoginCredentialsChangeEmail(String email) async* {
    yield state.rebuild(
      (s) => s..isEmailValid = loginValidator.isValidEmail(email),
    );
  }
}
