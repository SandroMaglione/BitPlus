import 'package:bitplus/app/presentation/bloc/bloc.dart';
import 'package:bloc/bloc.dart';

extension GetUid<A, S, T> on Bloc<S, T> {
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
}
