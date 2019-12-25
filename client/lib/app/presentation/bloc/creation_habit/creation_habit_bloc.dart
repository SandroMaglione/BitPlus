import 'dart:async';
import 'package:bitplus/app/data/models/api/habit_api.dart';
import 'package:bitplus/app/data/models/creation_habit.dart';
import 'package:bloc/bloc.dart';
import 'package:built_collection/built_collection.dart';
import '../bloc.dart';

const List<int> SELECTABLE_VALUES = [3, 5, 8, 13, 21];
const int INIT_SELECTED_VALUE_INDEX = 0;

class CreationHabitBloc extends Bloc<CreationHabitEvent, CreationHabit> {
  @override
  CreationHabit get initialState => CreationHabit(
        (h) => h
          ..name = ''
          ..isPositive = true
          ..value = SELECTABLE_VALUES[INIT_SELECTED_VALUE_INDEX]
          ..valueSelectedIndex = INIT_SELECTED_VALUE_INDEX
          ..valueSelected = ListBuilder<bool>(
            List<bool>.generate(
              5,
              (index) => index == INIT_SELECTED_VALUE_INDEX,
            ),
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
      initializeHabitCreationHabitEvent: (e) =>
          _mapInitializeHabitCreationHabitEvent(
        e.habit,
      ),
      updateNameCreationHabitEvent: (e) => _mapUpdateNameCreationHabitEvent(e),
      updateIsPositiveCreationHabitEvent: (e) =>
          _mapUpdateIsPositiveCreationHabitEvent(e),
      updateValueCreationHabitEvent: (e) =>
          _mapUpdateValueCreationHabitEvent(e),
      updateAreasCreationHabitEvent: (e) =>
          _mapUpdateAreasCreationHabitEvent(e),
    );
  }

  Stream<CreationHabit> _mapInitializeHabitCreationHabitEvent(
    HabitApi habit,
  ) async* {
    final indexOfValueSelected = SELECTABLE_VALUES.indexOf(habit.value);
    final indexValueSelected =
        indexOfValueSelected != -1 ? indexOfValueSelected : 0;

    yield state.rebuild(
      (h) => h
        ..name = habit.name
        ..isPositive = habit.isPositive
        ..value = habit.value
        ..valueSelectedIndex = indexValueSelected
        ..valueSelected = ListBuilder<bool>(
          List<bool>.generate(
            5,
            (index) => index == indexValueSelected,
          ),
        )
        ..lifeAreas = habit.areas.toBuilder(),
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
