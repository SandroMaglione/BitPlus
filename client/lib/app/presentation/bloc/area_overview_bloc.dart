import 'dart:async';
import 'package:bitplus/app/domain/usecases/life_area/update_areas_from_habit_list.dart';
import 'package:bitplus/app/data/models/user.dart';
import 'package:meta/meta.dart';
import 'package:bitplus/app/data/models/life_area.dart';
import 'package:bitplus/core/constants/life_areas.dart';
import 'package:bloc/bloc.dart';
import 'package:built_collection/built_collection.dart';
import 'package:bitplus/core/extensions/bloc_extension.dart';
import 'package:bitplus/core/extensions/date_time_extension.dart';
import './bloc.dart';

/// Store [LifeArea] list, based on the [Habit] list fetched on startup
/// and updated when user toggle and habit
class AreaOverviewBloc extends Bloc<AreaOverviewEvent, BuiltList<LifeArea>> {
  final AuthBloc authBloc;
  final HabitListBloc habitListBloc;
  final UpdateAreasFromHabitList updateAreasFromHabitList;
  StreamSubscription habitListSub;

  AreaOverviewBloc({
    @required this.authBloc,
    @required this.habitListBloc,
    @required this.updateAreasFromHabitList,
  }) {
    habitListSub = habitListBloc.listen(
      (state) => add(
        AreaOverviewEvent.areaOverviewInitialize(
          habitList: state,
        ),
      ),
    );
  }

  @override
  BuiltList<LifeArea> get initialState => LIFE_AREAS;

  @override
  Stream<BuiltList<LifeArea>> mapEventToState(
    AreaOverviewEvent event,
  ) async* {
    yield* event.when(
      areaOverviewInitialize: (e) => checkFullUserLogged(
        authBloc.state,
        _mapAreaOverviewInitialize,
        e,
        state,
      ),
    );
  }

  /// Update or initialize [LifeArea] list
  Stream<BuiltList<LifeArea>> _mapAreaOverviewInitialize(
    AreaOverviewInitialize event,
    User user,
  ) async* {
    yield updateAreasFromHabitList(
      Params(
        previousState: state,
        user: user,
        habitList: event.habitList,
      ),
    );
  }

  int getCountNegativeInDay(int areaIndex, DateTime day) =>
      _getCountInDay(areaIndex, day, false);

  int getCountPositiveInDay(int areaIndex, DateTime day) =>
      _getCountInDay(areaIndex, day, true);

  int _getCountInDay(int areaIndex, DateTime day, bool positiveCounts) =>
      state[areaIndex]
          .historyHabit
          .where(
            (habit) =>
                (positiveCounts
                    ? habit.habit.areas[areaIndex] > 0
                    : habit.habit.areas[areaIndex] < 0) &&
                habit.historyDayCheck.day.isSameDay(day),
          )
          .fold(
            0,
            (prev, habit) =>
                prev +
                (habit.historyDayCheck.isChecked
                    ? habit.habit.areas[areaIndex].abs()
                    : 0),
          );

  @override
  Future<void> close() {
    habitListSub.cancel();
    return super.close();
  }
}
