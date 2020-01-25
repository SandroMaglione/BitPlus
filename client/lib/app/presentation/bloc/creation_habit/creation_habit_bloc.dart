import 'dart:async';
import 'package:bitplus/app/data/models/creation_habit.dart';
import 'package:bitplus/app/data/models/habit.dart';
import 'package:bitplus/core/constants/parameters.dart';
import 'package:bloc/bloc.dart';
import 'package:built_collection/built_collection.dart';
import '../bloc.dart';

class CreationHabitBloc extends Bloc<CreationHabitEvent, CreationHabit> {
  @override
  CreationHabit get initialState => CreationHabit(
        (h) => h
          ..name = ''
          ..color = 0
          ..lifeAreas = ListBuilder<int>(
            List<int>.filled(12, 0),
          ),
      );

  @override
  Stream<CreationHabit> mapEventToState(
    CreationHabitEvent event,
  ) async* {
    yield* event.when(
      initializeHabitCreationHabitEvent: (e) =>
          _mapInitializeHabitCreationHabitEvent(
        e.habit,
      ),
      updateNameCreationHabitEvent: (e) => _mapUpdateNameCreationHabitEvent(e),
      updateColorCreationHabitEvent: (e) =>
          _mapUpdateColorCreationHabitEvent(e),
      addAreasCreationHabitEvent: (e) => _mapAddAreasCreationHabitEvent(e),
      subtractAreasCreationHabitEvent: (e) =>
          _mapSubtractAreasCreationHabitEvent(e),
    );
  }

  Stream<CreationHabit> _mapInitializeHabitCreationHabitEvent(
    Habit habit,
  ) async* {
    if (habit != null) {
      yield state.rebuild(
        (h) => h
          ..name = habit.name
          ..color = habit.color
          ..lifeAreas = habit.areas.toBuilder(),
      );
    }
  }

  Stream<CreationHabit> _mapUpdateNameCreationHabitEvent(
      UpdateNameCreationHabitEvent event) async* {
    yield state.rebuild(
      (h) => h..name = event.name,
    );
  }

  Stream<CreationHabit> _mapUpdateColorCreationHabitEvent(
      UpdateColorCreationHabitEvent event) async* {
    yield state.rebuild(
      (h) => h..color = event.color,
    );
  }

  Stream<CreationHabit> _mapAddAreasCreationHabitEvent(
      AddAreasCreationHabitEvent event) async* {
    yield state.rebuild(
      (h) => h
        ..lifeAreas = ListBuilder<int>(
          state.lifeAreas.rebuild((l) => l[event.indexToUpdate] +=
              l[event.indexToUpdate] >= MAX_AREA_VALUE ? 0 : 1),
        ),
    );
  }

  Stream<CreationHabit> _mapSubtractAreasCreationHabitEvent(
      SubtractAreasCreationHabitEvent event) async* {
    yield state.rebuild(
      (h) => h
        ..lifeAreas = ListBuilder<int>(
          state.lifeAreas.rebuild((l) => l[event.indexToUpdate] -=
              l[event.indexToUpdate] <= -MAX_AREA_VALUE ? 0 : 1),
        ),
    );
  }
}
