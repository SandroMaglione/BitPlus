import 'dart:async';
import 'package:bitplus/app/data/models/user.dart';
import 'package:bitplus/core/error/failures.dart';
import 'package:bitplus/core/usecase/usecase.dart';
import 'package:built_collection/built_collection.dart';
import 'package:meta/meta.dart';
import 'package:bitplus/app/domain/usecases/profile/get_user.dart';
import 'package:bitplus/app/domain/usecases/profile/is_signed_in_user.dart';
import 'package:bitplus/app/domain/usecases/profile/sign_out.dart';
import 'package:bloc/bloc.dart';
import './bloc.dart';

/// Keeps reference of current user status
/// - Authenticated
/// - Uninitialized (first access)
/// - Unauthenticated (logged out or failed sign in)
class AuthBloc extends Bloc<AuthEvent, AuthState> {
  final SignOut signOut;
  final GetUser getUser;
  final IsSignedInUser isSignedInUser;

  AuthBloc({
    @required this.getUser,
    @required this.signOut,
    @required this.isSignedInUser,
  });

  @override
  AuthState get initialState => AuthState.authUninitialized();

  @override
  Stream<AuthState> mapEventToState(
    AuthEvent event,
  ) async* {
    yield* event.when(
      authOnStartup: (e) => _mapAuthOnStartup(e),
      authSignIn: (e) => _mapAuthSignIn(e),
      authSignOut: (e) => _mapAuthSignOut(e),
      authSignInFromForm: (e) => _mapAuthSignInFromForm(e.user),
      authUpdateAreas: (e) => _mapAuthUpdateAreas(e.areas),
    );
  }

  Stream<AuthState> _mapAuthUpdateAreas(BuiltList<int> areas) async* {
    yield AuthState.authenticated(
      user: user.rebuild(
        (u) => u..areas = areas.toBuilder(),
      ),
    );
  }

  Stream<AuthState> _mapAuthSignInFromForm(User user) async* {
    yield AuthState.authenticated(
      user: user,
    );
  }

  Stream<AuthState> _mapAuthOnStartup(AuthOnStartup event) async* {
    final failOrIn = await isSignedInUser(NoParams());

    yield* failOrIn.fold(
      (failure) async* {
        yield AuthState.authUnauthenticated();
      },
      (_) async* {
        yield* _getUserSignIn();
      },
    );
  }

  Stream<AuthState> _mapAuthSignIn(AuthSignIn event) async* {
    yield* _getUserSignIn();
  }

  Stream<AuthState> _mapAuthSignOut(AuthSignOut event) async* {
    yield AuthState.authUnauthenticated();
    signOut(NoParams());
  }

  Stream<AuthState> _getUserSignIn() async* {
    final failOrUser = await getUser(NoParams());

    yield* failOrUser.fold(
      (failure) async* {
        yield AuthState.authUnauthenticated();
      },
      (user) async* {
        if (user == null) {
          yield AuthState.authUnauthenticated();
        } else {
          yield AuthState.authenticated(
            user: user,
          );
        }
      },
    );
  }

  User get user {
    if (state is Authenticated) {
      return (state as Authenticated).user;
    } else {
      throw NoAuthUserFailure(
        message: 'No user logged in',
      );
    }
  }
}
