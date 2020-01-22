import 'dart:async';
import 'dart:math';
import 'package:bitplus/app/data/models/api/habit_api.dart';
import 'package:bitplus/app/data/models/user.dart';
import 'package:bitplus/core/services/area_value_algorithm.dart';
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
  final AreaValueAlgorithm areaValueAlgorithm;
  StreamSubscription habitListSub;

  AreaOverviewBloc({
    @required this.authBloc,
    @required this.habitListBloc,
    @required this.areaValueAlgorithm,
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
    final BuiltList<HabitApi> habitList =
        event.habitList as BuiltList<HabitApi>;
    final sumUserAreas = user.areas.reduce((v1, v2) => v1 + v2);
    final maxUserAreas = user.areas.reduce(max);

    final areaList = _buildLifeAreaList(
      habitList,
      user,
      sumUserAreas,
      maxUserAreas,
    );

    final maxAreaValue = areaList
        .map(
          (a) => a.value,
        )
        .reduce(max);

    yield areaList
        .asMap()
        .map(
          (index, area) => MapEntry(
            index,
            area.rebuild(
              (a) => a..percentageActivity = a.value / maxAreaValue,
            ),
          ),
        )
        .values
        .toBuiltList();
  }

  BuiltList<LifeArea> _buildLifeAreaList(
    BuiltList<HabitApi> habitList,
    User user,
    int sumUserAreas,
    int maxUserAreas,
  ) =>
      state
          .asMap()
          .map(
            (index, area) => MapEntry(
              index,
              area.rebuild(
                (a) => a
                  ..value = areaValueAlgorithm.buildValue(
                    index,
                    user.areas[index],
                    habitList,
                  )
                  ..history = areaValueAlgorithm
                      .buildHistory(
                        index,
                        habitList,
                      )
                      .toBuilder()
                  ..countChecksPositive =
                      areaValueAlgorithm.buildCountChecksPositive(
                    index,
                    habitList,
                  )
                  ..countChecksNegative =
                      areaValueAlgorithm.buildCountChecksNegative(
                    index,
                    habitList,
                  )
                  ..habitChecks = areaValueAlgorithm
                      .buildHabitActivity(
                        index,
                        habitList,
                      )
                      .toBuilder()
                  ..percentageArea =
                      ((user.areas[index] + sumUserAreas) / user.areas.length) /
                          maxUserAreas,
              ),
            ),
          )
          .values
          .toBuiltList();

  @override
  Future<void> close() {
    habitListSub.cancel();
    return super.close();
  }
}
