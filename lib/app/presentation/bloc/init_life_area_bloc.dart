import 'dart:async';
import 'package:bloc/bloc.dart';
import 'package:bitplus/app/data/models/init_life_area.dart';
import 'package:built_collection/built_collection.dart';
import './bloc.dart';

// TODO: Define max possible points to assign to life areas
const int MAX_POINTS = 20;

class InitLifeAreaBloc extends Bloc<InitLifeAreaEvent, InitLifeArea> {
  @override
  InitLifeArea get initialState => InitLifeArea(
        (i) => i
          ..pointsLeft = MAX_POINTS
          ..values = ListBuilder<int>([0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0]),
      );

  @override
  Stream<InitLifeArea> mapEventToState(
    InitLifeAreaEvent event,
  ) async* {
    yield* event.when(
      addPointInitLifeAreaEvent: (e) => _mapAddPointInitLifeAreaEvent(e),
      removePointInitLifeAreaEvent: (e) => _mapRemovePointInitLifeAreaEvent(e),
    );
  }

  Stream<InitLifeArea> _mapAddPointInitLifeAreaEvent(
      AddPointInitLifeAreaEvent event) async* {
    if (state.pointsLeft > 0) {
      yield state.rebuild(
        (i) => i
          ..pointsLeft = state.pointsLeft - 1
          ..values = ListBuilder<int>(
            state.values.rebuild(
              (l) => l[event.lifeAreaID] += 1,
            ),
          ),
      );
    }
  }

  Stream<InitLifeArea> _mapRemovePointInitLifeAreaEvent(
      RemovePointInitLifeAreaEvent event) async* {
    if (state.pointsLeft <= MAX_POINTS && state.values[event.lifeAreaID] > 0) {
      yield state.rebuild(
        (i) => i
          ..pointsLeft = state.pointsLeft + 1
          ..values = ListBuilder<int>(
            state.values.rebuild(
              (l) => l[event.lifeAreaID] -= 1,
            ),
          ),
      );
    }
  }
}
