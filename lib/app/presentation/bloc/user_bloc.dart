import 'dart:async';
import 'package:bitplus/app/data/models/user.dart';
import 'package:bitplus/app/domain/usecases/profile/get_user_profile.dart'
    as gup;
import 'package:bitplus/app/domain/usecases/profile/remove_user_profile.dart'
    as rup;
import 'package:bitplus/app/domain/usecases/profile/save_user_profile.dart'
    as svup;
import 'package:bitplus/app/domain/usecases/profile/sign_in_profile.dart'
    as sip;
import 'package:bitplus/app/domain/usecases/profile/sign_out_profile.dart'
    as sop;
import 'package:bitplus/app/domain/usecases/profile/sign_up_profile.dart'
    as sup;
import 'package:bitplus/core/error/failures.dart';
import 'package:bitplus/core/usecase/usecase.dart';
import 'package:meta/meta.dart';
import 'package:bloc/bloc.dart';
import './bloc.dart';

class UserBloc extends Bloc<UserEvent, UserState> {
  final gup.GetUserProfile getUserProfile;
  final sup.SignUpProfile signUpProfile;
  final svup.SaveUserProfile saveUserProfile;
  final sop.SignOutProfile signOutProfile;
  final sip.SignInProfile signInProfile;
  final rup.RemoveUserProfile removeUserProfile;

  UserBloc({
    @required this.getUserProfile,
    @required this.signUpProfile,
    @required this.saveUserProfile,
    @required this.signOutProfile,
    @required this.signInProfile,
    @required this.removeUserProfile,
  });

  @override
  UserState get initialState => UserState.startUpUserState();

  @override
  Stream<UserState> mapEventToState(
    UserEvent event,
  ) async* {
    yield* event.when(
      getLocalUserEvent: (e) => _mapGetLocalUserEvent(e),
      signInUserEvent: (e) => _mapSignInUserEvent(e),
      signOutUserEvent: (e) => _mapSignOutUserEvent(e),
      signUpUserEvent: (e) => _mapSignUpUserEvent(e),
    );
  }

  Stream<UserState> _mapSignUpUserEvent(SignUpUserEvent event) async* {
    yield UserState.loadingUserState();

    final failOrUser = await signUpProfile(
      sup.Params(
        email: event.email,
        password: event.password,
      ),
    );

    yield* failOrUser.fold(
      (Failure failure) async* {
        yield UserState.emptyUserState(
          status: 'Wrong data, impossible to sign up',
        );
      },
      (User user) async* {
        await saveUserProfile(
          svup.Params(
            user: user,
          ),
        );

        yield UserState.loggedUserState(
          user: user,
        );
      },
    );
  }

  Stream<UserState> _mapGetLocalUserEvent(GetLocalUserEvent event) async* {
    yield UserState.loadingUserState();
    final failOrUser = await getUserProfile(
      NoParams(),
    );

    yield* failOrUser.fold(
      (Failure failure) async* {
        yield UserState.emptyUserState(
          status: 'Missing user local',
        );
      },
      (User user) async* {
        yield UserState.loggedUserState(
          user: user,
        );
      },
    );
  }

  Stream<UserState> _mapSignInUserEvent(SignInUserEvent event) async* {
    yield UserState.loadingUserState();
    final failOrUserID = await signInProfile(
      sip.Params(
        email: event.email,
        password: event.password,
      ),
    );

    yield* failOrUserID.fold(
      (Failure failure) async* {
        yield UserState.emptyUserState(
          status: 'Impossible to sign in, try again',
        );
      },
      (User user) async* {
        await saveUserProfile(
          svup.Params(
            user: user,
          ),
        );

        yield UserState.loggedUserState(
          user: user,
        );
      },
    );
  }

  Stream<UserState> _mapSignOutUserEvent(SignOutUserEvent event) async* {
    yield UserState.loadingUserState();
    final failOrOut = await signOutProfile(
      NoParams(),
    );

    yield* failOrOut.fold(
      (Failure failure) async* {
        yield UserState.errorUserState(
          message: 'Error on sign out, try again',
        );
      },
      (_) async* {
        final failOrRemove = await removeUserProfile(
          NoParams(),
        );
        yield* failOrRemove.fold(
          (Failure failure) async* {
            yield UserState.errorUserState(
              message: 'Error on sign out, try again',
            );
          },
          (_) async* {
            yield UserState.emptyUserState(status: 'Logged out');
          },
        );
      },
    );
  }
}
