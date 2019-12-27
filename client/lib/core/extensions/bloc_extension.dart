import 'package:bitplus/app/data/models/user.dart';
import 'package:bitplus/app/presentation/bloc/bloc.dart';
import 'package:bloc/bloc.dart';

extension GetUser<A, S, T> on Bloc<S, T> {
  /// Returns [uid] from the [AuthBloc]
  /// 
  /// Interrupt the event and yield and error state if uid missing because
  /// no [Authenticated] available
  Stream<S> checkUserLogged<A, S, T>(
    A authState,
    Stream<S> Function(T event, String uid) fun,
    T event,
    S failure,
  ) async* {
    if (authState is Authenticated) {
      yield* fun(
        event,
        authState.user.uid,
      );
    } else {
      yield failure;
    }
  }

  /// Returns full [User] model from the [AuthBloc]
  /// 
  /// Interrupt the event and yield and error state if uid missing because
  /// no [Authenticated] available
  Stream<S> checkFullUserLogged<A, S, T>(
    A authState,
    Stream<S> Function(T event, User user) fun,
    T event,
    S failure,
  ) async* {
    if (authState is Authenticated) {
      yield* fun(
        event,
        authState.user,
      );
    } else {
      yield failure;
    }
  }
}
