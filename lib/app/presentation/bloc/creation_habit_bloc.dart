import 'dart:async';
import 'package:bitplus/app/data/models/creation_habit.dart';
import 'package:bloc/bloc.dart';
import 'package:built_collection/built_collection.dart';
import './bloc.dart';

const List<int> SELECTABLE_VALUES = [3, 5, 8, 13, 21];

class CreationHabitBloc extends Bloc<CreationHabitEvent, CreationHabit> {
  @override
  CreationHabit get initialState => CreationHabit(
        (h) => h
          ..name = ''
          ..isPositive = true
          ..value = 1
          ..valueSelectedIndex = 0
          ..valueSelected = ListBuilder<bool>(
            List<bool>.generate(5, (index) => index == 0),
          )
          ..lifeAreas = ListBuilder<int>(
            List<int>.filled(12, 0),
          ),
      );

  @override
  Stream<CreationHabit> mapEventToState(
    CreationHabitEvent event,
  ) async* {
    yield* event.when(
      updateNameCreationHabitEvent: (e) => _mapUpdateNameCreationHabitEvent(e),
      updateIsPositiveCreationHabitEvent: (e) =>
          _mapUpdateIsPositiveCreationHabitEvent(e),
      updateValueCreationHabitEvent: (e) =>
          _mapUpdateValueCreationHabitEvent(e),
      updateAreasCreationHabitEvent: (e) =>
          _mapUpdateAreasCreationHabitEvent(e),
    );
  }

  Stream<CreationHabit> _mapUpdateIsPositiveCreationHabitEvent(
      UpdateIsPositiveCreationHabitEvent event) async* {
    yield state.rebuild(
      (h) => h..isPositive = event.isPositive,
    );
  }

  Stream<CreationHabit> _mapUpdateNameCreationHabitEvent(
      UpdateNameCreationHabitEvent event) async* {
    yield state.rebuild(
      (h) => h..name = event.name,
    );
  }

  Stream<CreationHabit> _mapUpdateValueCreationHabitEvent(
      UpdateValueCreationHabitEvent event) async* {
    yield state.rebuild(
      (h) => h
        ..valueSelectedIndex = event.indexSelected
        ..value = SELECTABLE_VALUES[event.indexSelected]
        ..valueSelected = ListBuilder<bool>(
          state.valueSelected.rebuild(
            (v) {
              v[state.valueSelectedIndex] = false;
              v[event.indexSelected] = true;
            },
          ),
        ),
    );
  }

  Stream<CreationHabit> _mapUpdateAreasCreationHabitEvent(
      UpdateAreasCreationHabitEvent event) async* {
    yield state.rebuild(
      (h) => h
        ..lifeAreas = ListBuilder<int>(
          state.lifeAreas.rebuild((l) => l[event.indexToUpdate] =
              l[event.indexToUpdate] >= 3 ? 0 : l[event.indexToUpdate] + 1),
        ),
    );
  }
}
