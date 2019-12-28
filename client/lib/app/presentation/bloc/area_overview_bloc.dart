import 'dart:async';
import 'package:bitplus/app/data/models/api/habit_api.dart';
import 'package:bitplus/app/data/models/user.dart';
import 'package:bitplus/core/constants/parameters.dart';
import 'package:meta/meta.dart';
import 'package:bitplus/app/data/models/life_area.dart';
import 'package:bitplus/core/constants/life_areas.dart';
import 'package:bloc/bloc.dart';
import 'package:built_collection/built_collection.dart';
import 'package:bitplus/core/extensions/bloc_extension.dart';
import './bloc.dart';

class AreaOverviewBloc extends Bloc<AreaOverviewEvent, BuiltList<LifeArea>> {
  final AuthBloc authBloc;
  final HabitListBloc habitListBloc;
  StreamSubscription habitListSub;

  AreaOverviewBloc({
    @required this.authBloc,
    @required this.habitListBloc,
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

  Stream<BuiltList<LifeArea>> _mapAreaOverviewInitialize(
    AreaOverviewInitialize event,
    User user,
  ) async* {
    final BuiltList<HabitApi> habitList = event.habitList;

    yield BuiltList<LifeArea>(
      state
          .asMap()
          .map(
            (index, area) => MapEntry(
              index,
              area.rebuild(
                (a) => a
                  ..value = _getLifeAreaValue(
                    index,
                    user.areas[index],
                    habitList,
                  )
                  ..history = _getLifeAreaHistory(
                    index,
                    habitList,
                  ).toBuilder()
                  ..countChecks = _getLifeAreaCountChecks(
                    index,
                    habitList,
                  ),
              ),
            ),
          )
          .values
          .toList(),
    );
  }

  BuiltList<int> _getLifeAreaHistory(
    int areaIndex,
    BuiltList<HabitApi> habitList,
  ) =>
      BuiltList<int>(
        List<int>.filled(DEFAULT_DATE_RANGE, 0)
            .asMap()
            .map(
              (dayIndex, count) => MapEntry(
                dayIndex,
                habitList
                    .map(
                      (habit) =>
                          habit.history[dayIndex] && habit.areas[areaIndex] > 0
                              ? 1
                              : 0,
                    )
                    .reduce((v, e) => v + e),
              ),
            )
            .values
            .toList(),
      );

  int _getLifeAreaCountChecks(
    int areaIndex,
    BuiltList<HabitApi> habitList,
  ) =>
      habitList
          .asMap()
          .map(
            (index, habit) => MapEntry(
              index,
              habit.areas[areaIndex] > 0 ? habit.countChecks : 0,
            ),
          )
          .values
          .toList()
          .reduce((v, e) => v + e);

  double _getLifeAreaValue(
    int areaIndex,
    int userWeight,
    BuiltList<HabitApi> habitList,
  ) =>
      habitList
          .asMap()
          .map(
            (index, habit) => MapEntry(
                index,
                habit.countChecks *
                    (habit.areas[areaIndex] * (userWeight + 1) / 4)),
          )
          .values
          .toList()
          .reduce((v, e) => v + e) /
      (userWeight + 1);

  @override
  Future<void> close() {
    habitListSub.cancel();
    return super.close();
  }
}
