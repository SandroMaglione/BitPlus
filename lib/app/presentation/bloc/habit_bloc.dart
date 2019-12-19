import 'dart:async';
import 'package:bitplus/app/data/models/habit.dart';
import 'package:bitplus/core/error/failures.dart';
import 'package:built_collection/built_collection.dart';
import 'package:meta/meta.dart';
import 'package:bitplus/app/domain/usecases/habit/get_habit_list.dart' as ghl;
import 'package:bloc/bloc.dart';
import './bloc.dart';

class HabitBloc extends Bloc<HabitEvent, HabitState> {
  final UserBloc userBloc;
  final ghl.GetHabitList getHabitList;

  HabitBloc({
    @required this.userBloc,
    @required this.getHabitList,
  });

  @override
  HabitState get initialState => HabitState.initialHabitState();

  @override
  Stream<HabitState> mapEventToState(
    HabitEvent event,
  ) async* {
    // TODO: Impl checkHabitEvent
    // TODO: Impl uncheckHabitEvent
    yield* event.when(
      getHabitListHabitEvent: (e) => _mapGetHabitListHabitEvent(e),
      checkHabitEvent: null,
      uncheckHabitEvent: null,
    );
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
        (BuiltList<Habit> habitList) async* {
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
