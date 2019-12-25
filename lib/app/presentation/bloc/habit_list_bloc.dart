import 'dart:async';
import 'package:meta/meta.dart';
import 'package:bitplus/app/data/models/api/habit_api.dart';
import 'package:bloc/bloc.dart';
import 'package:built_collection/built_collection.dart';
import 'package:bitplus/core/extensions/bloc_extension.dart';
import './bloc.dart';

/// Store the list of habit of the current logged user fetched from the database
///
/// Initially empty
class HabitListBloc extends Bloc<HabitListEvent, BuiltList<HabitApi>> {
  final AuthBloc authBloc;

  HabitListBloc({
    @required this.authBloc,
  });

  @override
  BuiltList<HabitApi> get initialState => BuiltList<HabitApi>();

  @override
  Stream<BuiltList<HabitApi>> mapEventToState(
    HabitListEvent event,
  ) async* {
    yield* event.when(
      habitListFetched: (e) => _mapHabitListFetched(e.habitList),
      habitListCheck: (e) => checkUserLogged(
        authBloc.state,
        _mapHabitListCheck,
        e,
        state,
      ),
      habitListUncheck: (e) => checkUserLogged(
        authBloc.state,
        _mapHabitListUncheck,
        e,
        state,
      ),
      habitListAddCreated: (e) => _mapHabitListAddCreated(
        e.habit,
      ),
    );
  }

  Stream<BuiltList<HabitApi>> _mapHabitListFetched(
    BuiltList<HabitApi> habitList,
  ) async* {
    yield habitList;
  }

  Stream<BuiltList<HabitApi>> _mapHabitListUncheck(
    HabitListUncheck event,
    String uid,
  ) async* {}

  Stream<BuiltList<HabitApi>> _mapHabitListCheck(
    HabitListCheck event,
    String uid,
  ) async* {}

  Stream<BuiltList<HabitApi>> _mapHabitListAddCreated(HabitApi habit) async* {
    yield BuiltList(
      [
        habit,
        ...state,
      ],
    );
  }
}
