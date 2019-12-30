// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'creation_habit_event.dart';

// **************************************************************************
// SuperEnumGenerator
// **************************************************************************

@immutable
abstract class CreationHabitEvent extends Equatable {
  const CreationHabitEvent(this._type);

  factory CreationHabitEvent.updateNameCreationHabitEvent(
      {@required String name}) = UpdateNameCreationHabitEvent;

  factory CreationHabitEvent.updateColorCreationHabitEvent(
      {@required int color}) = UpdateColorCreationHabitEvent;

  factory CreationHabitEvent.addAreasCreationHabitEvent(
      {@required int indexToUpdate}) = AddAreasCreationHabitEvent;

  factory CreationHabitEvent.subtractAreasCreationHabitEvent(
      {@required int indexToUpdate}) = SubtractAreasCreationHabitEvent;

  factory CreationHabitEvent.initializeHabitCreationHabitEvent(
      {@required HabitApi habit}) = InitializeHabitCreationHabitEvent;

  final _CreationHabitEvent _type;

//ignore: missing_return
  R when<R>(
      {@required
          R Function(UpdateNameCreationHabitEvent) updateNameCreationHabitEvent,
      @required
          R Function(UpdateColorCreationHabitEvent)
              updateColorCreationHabitEvent,
      @required
          R Function(AddAreasCreationHabitEvent) addAreasCreationHabitEvent,
      @required
          R Function(SubtractAreasCreationHabitEvent)
              subtractAreasCreationHabitEvent,
      @required
          R Function(InitializeHabitCreationHabitEvent)
              initializeHabitCreationHabitEvent}) {
    switch (this._type) {
      case _CreationHabitEvent.UpdateNameCreationHabitEvent:
        return updateNameCreationHabitEvent(
            this as UpdateNameCreationHabitEvent);
      case _CreationHabitEvent.UpdateColorCreationHabitEvent:
        return updateColorCreationHabitEvent(
            this as UpdateColorCreationHabitEvent);
      case _CreationHabitEvent.AddAreasCreationHabitEvent:
        return addAreasCreationHabitEvent(this as AddAreasCreationHabitEvent);
      case _CreationHabitEvent.SubtractAreasCreationHabitEvent:
        return subtractAreasCreationHabitEvent(
            this as SubtractAreasCreationHabitEvent);
      case _CreationHabitEvent.InitializeHabitCreationHabitEvent:
        return initializeHabitCreationHabitEvent(
            this as InitializeHabitCreationHabitEvent);
    }
  }

  @override
  List get props => null;
}

@immutable
class UpdateNameCreationHabitEvent extends CreationHabitEvent {
  const UpdateNameCreationHabitEvent({@required this.name})
      : super(_CreationHabitEvent.UpdateNameCreationHabitEvent);

  final String name;

  @override
  String toString() => 'UpdateNameCreationHabitEvent(name:${this.name})';
  @override
  List get props => [name];
}

@immutable
class UpdateColorCreationHabitEvent extends CreationHabitEvent {
  const UpdateColorCreationHabitEvent({@required this.color})
      : super(_CreationHabitEvent.UpdateColorCreationHabitEvent);

  final int color;

  @override
  String toString() => 'UpdateColorCreationHabitEvent(color:${this.color})';
  @override
  List get props => [color];
}

@immutable
class AddAreasCreationHabitEvent extends CreationHabitEvent {
  const AddAreasCreationHabitEvent({@required this.indexToUpdate})
      : super(_CreationHabitEvent.AddAreasCreationHabitEvent);

  final int indexToUpdate;

  @override
  String toString() =>
      'AddAreasCreationHabitEvent(indexToUpdate:${this.indexToUpdate})';
  @override
  List get props => [indexToUpdate];
}

@immutable
class SubtractAreasCreationHabitEvent extends CreationHabitEvent {
  const SubtractAreasCreationHabitEvent({@required this.indexToUpdate})
      : super(_CreationHabitEvent.SubtractAreasCreationHabitEvent);

  final int indexToUpdate;

  @override
  String toString() =>
      'SubtractAreasCreationHabitEvent(indexToUpdate:${this.indexToUpdate})';
  @override
  List get props => [indexToUpdate];
}

@immutable
class InitializeHabitCreationHabitEvent extends CreationHabitEvent {
  const InitializeHabitCreationHabitEvent({@required this.habit})
      : super(_CreationHabitEvent.InitializeHabitCreationHabitEvent);

  final HabitApi habit;

  @override
  String toString() => 'InitializeHabitCreationHabitEvent(habit:${this.habit})';
  @override
  List get props => [habit];
}
