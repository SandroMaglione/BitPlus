import 'dart:async';
import 'package:bitplus/app/data/models/api/habit_api.dart';
import 'package:bitplus/app/data/models/habit.dart';
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
      getHabitListHabitEvent: (e) => _mapGetHabitListHabitEvent(e),
      createHabitEvent: (e) => _mapCreateHabitEvent(e),
      checkHabitEvent: (e) => _mapCheckHabitEvent(e),
      uncheckHabitEvent: (e) => _mapUncheckHabitEvent(e),
    );
  }

  Stream<HabitState> _mapCheckHabitEvent(CheckHabitEvent event) async* {
    var currentList = BuiltList<HabitApi>();
    if (state is LoadedHabitState) {
      currentList = (state as LoadedHabitState).habits;
    }

    yield HabitState.loadingHabitState();

    if (userBloc.state is LoggedUserState) {
      final failOrHabit = await uncheckHabit(
        unch.Params(
          uid: (userBloc.state as LoggedUserState).user.userID,
          habitID: event.habitID,
        ),
      );

      yield* failOrHabit.fold(
        (Failure failure) async* {
          yield HabitState.errorHabitState(
              message: 'Error while getting the habit, try again later');
        },
        (Habit habit) async* {
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
    } else {
      yield HabitState.errorHabitState(
        message: 'Unexpected state, user not logged',
      );
    }
  }

  Stream<HabitState> _mapUncheckHabitEvent(UncheckHabitEvent event) async* {
    var currentList = BuiltList<Habit>();
    if (state is LoadedHabitState) {
      currentList = (state as LoadedHabitState).habits;
    }

    yield HabitState.loadingHabitState();

    if (userBloc.state is LoggedUserState) {
      final failOrHabit = await checkHabit(
        cch.Params(
          uid: (userBloc.state as LoggedUserState).user.userID,
          habitID: event.habitID,
        ),
      );

      yield* failOrHabit.fold(
        (Failure failure) async* {
          yield HabitState.errorHabitState(
              message: 'Error while getting the habit, try again later');
        },
        (Habit habit) async* {
          yield HabitState.loadedHabitState(
            habits: BuiltList<Habit>(
              [
                ...currentList,
                habit,
              ],
            ),
          );
        },
      );
    } else {
      yield HabitState.errorHabitState(
        message: 'Unexpected state, user not logged',
      );
    }
  }

  Stream<HabitState> _mapCreateHabitEvent(CreateHabitEvent event) async* {
    var currentList = BuiltList<HabitApi>();
    if (state is LoadedHabitState) {
      currentList = (state as LoadedHabitState).habits;
    }

    yield HabitState.loadingHabitState();

    if (userBloc.state is LoggedUserState) {
      final failOrHabit = await createHabit(
        ch.Params(
          uid: (userBloc.state as LoggedUserState).user.userID,
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
    } else {
      yield HabitState.errorHabitState(
        message: 'Unexpected state, user not logged',
      );
    }
  }

  Stream<HabitState> _mapGetHabitListHabitEvent(
      GetHabitListHabitEvent event) async* {
    yield HabitState.loadingHabitState();
    if (userBloc.state is LoggedUserState) {
      final failOrHabitList = await getHabitList(
        ghl.Params(uid: (userBloc.state as LoggedUserState).user.userID),
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
    } else {
      yield HabitState.errorHabitState(
        message: 'Unexpected state, user not logged',
      );
    }
  }
}
