import 'dart:async';
import 'package:bitplus/app/data/models/user.dart';
import 'package:bitplus/app/domain/usecases/profile/sign_in_google.dart';
import 'package:bitplus/app/domain/usecases/profile/sign_in_credentials.dart'
    as sic;
import 'package:bitplus/app/domain/usecases/profile/sign_up_credentials.dart'
    as suc;
import 'package:bitplus/app/domain/usecases/profile/sign_up_google.dart' as sug;
import 'package:bitplus/core/usecase/usecase.dart';
import 'package:meta/meta.dart';
import 'package:bloc/bloc.dart';
import 'package:built_collection/built_collection.dart';
import '../bloc.dart';

/// Perform login after user added all required inputs and clicks on sign in / sign up
class LoginBloc extends Bloc<LoginEvent, LoginState> {
  final AuthBloc authBloc;
  final SignInGoogle signInGoogle;
  final sic.SignInCredentials signInCredentials;
  final suc.SignUpCredentials signUpCredentials;
  final sug.SignUpGoogle signUpGoogle;

  LoginBloc({
    @required this.signInCredentials,
    @required this.signInGoogle,
    @required this.signUpCredentials,
    @required this.signUpGoogle,
    @required this.authBloc,
  });

  @override
  LoginState get initialState => LoginState.loginInProgress();

  @override
  Stream<LoginState> mapEventToState(
    LoginEvent event,
  ) async* {
    yield* event.when(
      loginSignInCredentials: (e) => _mapLoginSignInCredentials(
        e.email,
        e.password,
      ),
      loginSignInGoogle: (e) => _mapLoginSignInGoogle(),
      loginSignUpGoogle: (e) => _mapLoginSignUpGoogle(e.areas),
      loginSignUpCredentials: (e) => _mapLoginSignUpCredentials(
        e.email,
        e.password,
        e.areas,
      ),
    );
  }

  Stream<LoginState> _mapLoginSignInCredentials(
      String email, String password) async* {
    yield LoginState.loginSubmitting();
    final failOrUser = await signInCredentials(
      sic.Params(
        email: email,
        password: password,
      ),
    );

    yield* failOrUser.fold(
      (failure) async* {
        yield LoginState.loginFailure(message: 'Impossible to sign in');
      },
      (user) async* {
        yield* _signInSuccess(user);
      },
    );
  }

  Stream<LoginState> _mapLoginSignUpGoogle(BuiltList<int> areas) async* {
    yield LoginState.loginSubmitting();
    final failOrUser = await signUpGoogle(
      sug.Params(
        areas: areas,
      ),
    );

    yield* failOrUser.fold(
      (failure) async* {
        yield LoginState.loginFailure(message: 'Impossible to sign in');
      },
      (user) async* {
        yield* _signInSuccess(user);
      },
    );
  }

  Stream<LoginState> _mapLoginSignInGoogle() async* {
    yield LoginState.loginSubmitting();
    final failOrUser = await signInGoogle(NoParams());

    yield* failOrUser.fold(
      (failure) async* {
        yield LoginState.loginFailure(message: 'Impossible to sign in');
      },
      (user) async* {
        yield* _signInSuccess(user);
      },
    );
  }

  Stream<LoginState> _mapLoginSignUpCredentials(
    String email,
    String password,
    BuiltList<int> areas,
  ) async* {
    yield LoginState.loginSubmitting();
    final failOrUser = await signUpCredentials(
      suc.Params(
        email: email,
        password: password,
        areas: areas,
      ),
    );

    yield* failOrUser.fold(
      (failure) async* {
        yield LoginState.loginFailure(message: 'Impossible to sign in');
      },
      (user) async* {
        yield* _signInSuccess(user);
      },
    );
  }

  Stream<LoginState> _signInSuccess(User user) async* {
    yield LoginState.loginSuccess(
      user: user,
    );

    authBloc.add(
      AuthEvent.authSignInFromForm(
        user: user,
      ),
    );
  }
}
