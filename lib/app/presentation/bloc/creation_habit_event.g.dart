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

  factory CreationHabitEvent.updateIsPositiveCreationHabitEvent(
      {@required bool isPositive}) = UpdateIsPositiveCreationHabitEvent;

  factory CreationHabitEvent.updateValueCreationHabitEvent(
      {@required int indexSelected}) = UpdateValueCreationHabitEvent;

  factory CreationHabitEvent.updateAreasCreationHabitEvent(
      {@required int indexToUpdate}) = UpdateAreasCreationHabitEvent;

  final _CreationHabitEvent _type;

//ignore: missing_return
  R when<R>(
      {@required
          R Function(UpdateNameCreationHabitEvent) updateNameCreationHabitEvent,
      @required
          R Function(UpdateIsPositiveCreationHabitEvent)
              updateIsPositiveCreationHabitEvent,
      @required
          R Function(UpdateValueCreationHabitEvent)
              updateValueCreationHabitEvent,
      @required
          R Function(UpdateAreasCreationHabitEvent)
              updateAreasCreationHabitEvent}) {
    switch (this._type) {
      case _CreationHabitEvent.UpdateNameCreationHabitEvent:
        return updateNameCreationHabitEvent(
            this as UpdateNameCreationHabitEvent);
      case _CreationHabitEvent.UpdateIsPositiveCreationHabitEvent:
        return updateIsPositiveCreationHabitEvent(
            this as UpdateIsPositiveCreationHabitEvent);
      case _CreationHabitEvent.UpdateValueCreationHabitEvent:
        return updateValueCreationHabitEvent(
            this as UpdateValueCreationHabitEvent);
      case _CreationHabitEvent.UpdateAreasCreationHabitEvent:
        return updateAreasCreationHabitEvent(
            this as UpdateAreasCreationHabitEvent);
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
class UpdateIsPositiveCreationHabitEvent extends CreationHabitEvent {
  const UpdateIsPositiveCreationHabitEvent({@required this.isPositive})
      : super(_CreationHabitEvent.UpdateIsPositiveCreationHabitEvent);

  final bool isPositive;

  @override
  String toString() =>
      'UpdateIsPositiveCreationHabitEvent(isPositive:${this.isPositive})';
  @override
  List get props => [isPositive];
}

@immutable
class UpdateValueCreationHabitEvent extends CreationHabitEvent {
  const UpdateValueCreationHabitEvent({@required this.indexSelected})
      : super(_CreationHabitEvent.UpdateValueCreationHabitEvent);

  final int indexSelected;

  @override
  String toString() =>
      'UpdateValueCreationHabitEvent(indexSelected:${this.indexSelected})';
  @override
  List get props => [indexSelected];
}

@immutable
class UpdateAreasCreationHabitEvent extends CreationHabitEvent {
  const UpdateAreasCreationHabitEvent({@required this.indexToUpdate})
      : super(_CreationHabitEvent.UpdateAreasCreationHabitEvent);

  final int indexToUpdate;

  @override
  String toString() =>
      'UpdateAreasCreationHabitEvent(indexToUpdate:${this.indexToUpdate})';
  @override
  List get props => [indexToUpdate];
}
