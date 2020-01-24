import 'dart:async';
import 'package:bitplus/app/domain/usecases/life_area/update_areas_from_habit_list.dart';
import 'package:bitplus/app/data/models/api/habit_api.dart';
import 'package:bitplus/app/data/models/user.dart';
import 'package:meta/meta.dart';
import 'package:bitplus/app/data/models/life_area.dart';
import 'package:bitplus/core/constants/life_areas.dart';
import 'package:bloc/bloc.dart';
import 'package:built_collection/built_collection.dart';
import 'package:bitplus/core/extensions/bloc_extension.dart';
import './bloc.dart';

/// Store [LifeArea] list, based on the [HabitApi] list fetched on startup
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

  @override
  Future<void> close() {
    habitListSub.cancel();
    return super.close();
  }
}
