import 'dart:async';
import 'package:bitplus/core/enums/login_status_page.dart';
import 'package:bloc/bloc.dart';
import '../bloc.dart';

/// Switch between views in the login flow
/// 1. Insert areas
/// 2. Sign in or Sign up
class LoginStatusBloc extends Bloc<LoginStatusEvent, LoginStatusPage> {
  @override
  LoginStatusPage get initialState => LoginStatusPage.InitAreasView;

  @override
  Stream<LoginStatusPage> mapEventToState(
    LoginStatusEvent event,
  ) async* {
    yield* event.when(
      loginStatusMoveToAreasView: (e) => _mapLoginStatusMoveToAreasView(),
      loginStatusMoveToFormView: (e) => _mapLoginStatusMoveToFormView(),
    );
  }

  Stream<LoginStatusPage> _mapLoginStatusMoveToAreasView() async* {
    yield LoginStatusPage.InitAreasView;
  }

  Stream<LoginStatusPage> _mapLoginStatusMoveToFormView() async* {
    yield LoginStatusPage.FormView;
  }
}
