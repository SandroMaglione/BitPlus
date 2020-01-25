import 'dart:async';
import 'package:bitplus/app/data/models/habit.dart';
import 'package:bitplus/app/domain/usecases/habit/check_habit.dart' as ch;
import 'package:bitplus/app/domain/usecases/habit/uncheck_habit.dart' as uch;
import 'package:bitplus/core/error/failures.dart';
import 'package:dartz/dartz.dart';
import 'package:meta/meta.dart';
import 'package:bloc/bloc.dart';
import 'package:built_collection/built_collection.dart';
import 'package:bitplus/core/extensions/bloc_extension.dart';
import '../bloc.dart';

/// Store the list of habit of the current logged user fetched from the database
///
/// Initially empty
class HabitListBloc extends Bloc<HabitListEvent, BuiltList<Habit>> {
  final AuthBloc authBloc;
  final ch.CheckHabit checkHabit;
  final uch.UncheckHabit uncheckHabit;

  HabitListBloc({
    @required this.authBloc,
    @required this.checkHabit,
    @required this.uncheckHabit,
  });

  @override
  BuiltList<Habit> get initialState => BuiltList<Habit>();

  @override
  Stream<BuiltList<Habit>> mapEventToState(
    HabitListEvent event,
  ) async* {
    yield* event.when(
      habitListFetched: (e) => _mapHabitListFetched(e.habitList),
      habitListAddCreated: (e) => _mapHabitListAddCreated(e.habit),
      habitListAddUpdated: (e) => _mapHabitListAddUpdated(e.habit),
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
    );
  }

  Stream<BuiltList<Habit>> _mapHabitListFetched(
    BuiltList<Habit> habitList,
  ) async* {
    yield habitList;
  }

  Stream<BuiltList<Habit>> _mapHabitListUncheck(
    HabitListUncheck event,
    String uid,
  ) async* {
    yield* _mapCheckToggle(
      false,
      event.habitID,
      () => uncheckHabit(
        uch.Params(
          uid: uid,
          habitID: event.habitID,
        ),
      ),
    );
  }

  Stream<BuiltList<Habit>> _mapHabitListAddCreated(Habit habit) async* {
    yield BuiltList([habit, ...state]);
  }

  Stream<BuiltList<Habit>> _mapHabitListAddUpdated(Habit habit) async* {
    yield BuiltList<Habit>(
      state.map(
        (h) => h.habitID == habit.habitID ? habit : h,
      ),
    );
  }

  Stream<BuiltList<Habit>> _mapHabitListCheck(
    HabitListCheck event,
    String uid,
  ) async* {
    yield* _mapCheckToggle(
      true,
      event.habitID,
      () => checkHabit(
        ch.Params(
          uid: uid,
          habitID: event.habitID,
        ),
      ),
    );
  }

  /// Check/Uncheck habit event
  Stream<BuiltList<Habit>> _mapCheckToggle(
    bool checked,
    String habitID,
    Future<Either<Failure, void>> Function() fun,
  ) async* {
    final stateBackup = state;

    yield BuiltList<Habit>(
      state.map(
        (h) => h.habitID == habitID
            ? h.rebuild(
                (r) => r
                  ..checked = checked
                  ..history[0] = h.history[0].rebuild(
                    (h) => h..isChecked = checked,
                  )
                  ..countChecks =
                      checked ? r.countChecks + 1 : r.countChecks - 1
                  ..streak = checked ? r.streak + 1 : r.streak - 1,
              )
            : h,
      ),
    );

    final failOrHabit = await fun();

    yield* failOrHabit.fold(
      (failure) async* {
        // TODO: Signal error to the user somehow
        yield stateBackup;
      },
      (_) async* {
        // TODO: Success, signal success?
      },
    );
  }
}
