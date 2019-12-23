import 'dart:async';
import 'package:bitplus/app/data/models/api/habit_api.dart';
import 'package:bitplus/core/error/failures.dart';
import 'package:built_collection/built_collection.dart';
import 'package:meta/meta.dart';
import 'package:bitplus/app/domain/usecases/habit/get_habit_list.dart' as ghl;
import 'package:bitplus/app/domain/usecases/habit/check_habit.dart' as cch;
import 'package:bitplus/app/domain/usecases/habit/uncheck_habit.dart' as unch;
import 'package:bitplus/app/domain/usecases/habit/create_habit.dart' as ch;
import 'package:bloc/bloc.dart';
import './bloc.dart';

class HabitBloc extends Bloc<HabitEvent, HabitState> {
  final UserBloc userBloc;
  final ch.CreateHabit createHabit;
  final cch.CheckHabit checkHabit;
  final unch.UncheckHabit uncheckHabit;
  final ghl.GetHabitList getHabitList;

  HabitBloc({
    @required this.userBloc,
    @required this.getHabitList,
    @required this.checkHabit,
    @required this.uncheckHabit,
    @required this.createHabit,
  });

  @override
  HabitState get initialState => HabitState.initialHabitState();

  @override
  Stream<HabitState> mapEventToState(
    HabitEvent event,
  ) async* {
    yield* event.when(
      getHabitListHabitEvent: (e) => _checkUserLogged(
        _mapGetHabitListHabitEvent,
        e,
      ),
      createHabitEvent: (e) => _checkUserLogged(
        _mapCreateHabitEvent,
        e,
      ),
      checkHabitEvent: (e) => _checkUserLogged(
        _mapCheckHabitEvent,
        e,
      ),
      uncheckHabitEvent: (e) => _checkUserLogged(
        _mapUncheckHabitEvent,
        e,
      ),
    );
  }

  Stream<HabitState> _mapCheckHabitEvent(
    CheckHabitEvent event,
    String uid,
  ) async* {
    var currentList = BuiltList<HabitApi>();
    if (state is LoadedHabitState) {
      currentList = (state as LoadedHabitState).habits;
    }

    yield HabitState.loadingHabitState();

    final failOrHabit = await uncheckHabit(
      unch.Params(
        uid: uid,
        habitID: event.habitID,
      ),
    );

    yield* failOrHabit.fold(
      (Failure failure) async* {
        yield HabitState.errorHabitState(
          message: 'Error while getting the habit, try again later',
        );
      },
      (_) async* {
        yield HabitState.loadedHabitState(
          habits: BuiltList<HabitApi>(
            currentList.map(
              (habit) => habit.habitID == event.habitID
                  ? habit.rebuild((h) => h..checked = true)
                  : habit,
            ),
          ),
        );
      },
    );
  }

  Stream<HabitState> _mapUncheckHabitEvent(
    UncheckHabitEvent event,
    String uid,
  ) async* {
    var currentList = BuiltList<HabitApi>();
    if (state is LoadedHabitState) {
      currentList = (state as LoadedHabitState).habits;
    }

    yield HabitState.loadingHabitState();

    final failOrHabit = await checkHabit(
      cch.Params(
        uid: uid,
        habitID: event.habitID,
      ),
    );

    yield* failOrHabit.fold(
      (Failure failure) async* {
        yield HabitState.errorHabitState(
            message: 'Error while getting the habit, try again later');
      },
      (_) async* {
        yield HabitState.loadedHabitState(
          habits: BuiltList<HabitApi>(
            currentList.map(
              (habit) => habit.habitID == event.habitID
                  ? habit.rebuild((h) => h..checked = false)
                  : habit,
            ),
          ),
        );
      },
    );
  }

  Stream<HabitState> _mapCreateHabitEvent(
    CreateHabitEvent event,
    String uid,
  ) async* {
    var currentList = BuiltList<HabitApi>();
    if (state is LoadedHabitState) {
      currentList = (state as LoadedHabitState).habits;
    }

    yield HabitState.loadingHabitState();

    final failOrHabit = await createHabit(
      ch.Params(
        uid: uid,
        name: event.name,
        experience: event.value,
        isPositive: event.isPositive,
        lifeAreaIds: event.areas,
      ),
    );

    yield* failOrHabit.fold(
      (Failure failure) async* {
        yield HabitState.errorHabitState(
            message: 'Error while getting the habit, try again later');
      },
      (HabitApi habit) async* {
        yield HabitState.loadedHabitState(
          habits: BuiltList<HabitApi>(
            [
              ...currentList,
              habit,
            ],
          ),
        );
      },
    );
  }

  Stream<HabitState> _mapGetHabitListHabitEvent(
    GetHabitListHabitEvent event,
    String uid,
  ) async* {
    yield HabitState.loadingHabitState();
    final failOrHabitList = await getHabitList(
      ghl.Params(
        uid: uid,
      ),
    );

    yield* failOrHabitList.fold(
      (Failure failure) async* {
        yield HabitState.errorHabitState(
            message: 'Error while getting the habit, try again later');
      },
      (BuiltList<HabitApi> habitList) async* {
        if (habitList.isNotEmpty) {
          yield HabitState.loadedHabitState(
            habits: habitList,
          );
        } else {
          yield HabitState.emptyHabitState();
        }
      },
    );
  }

  /// Interrupt the event and yield and error state if uid missing because
  /// no [LoggedUserState] available
  Stream<HabitState> _checkUserLogged<T>(
    Stream<HabitState> Function(T event, String uid) fun,
    T event,
  ) async* {
    if (userBloc.state is LoggedUserState) {
      yield* fun(
        event,
        (userBloc.state as LoggedUserState).user.userID,
      );
    } else {
      yield HabitState.errorHabitState(
        message: 'Unexpected state, user not logged',
      );
    }
  }
}
