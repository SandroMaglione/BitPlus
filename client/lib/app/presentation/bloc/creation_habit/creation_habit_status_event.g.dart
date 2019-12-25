// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'creation_habit_status_event.dart';

// **************************************************************************
// SuperEnumGenerator
// **************************************************************************

@immutable
abstract class CreationHabitStatusEvent extends Equatable {
  const CreationHabitStatusEvent(this._type);

  factory CreationHabitStatusEvent.creationHabitStatusCreateHabit(
      {@required String name,
      @required bool isPositive,
      @required int value,
      @required BuiltList<dynamic> areas}) = CreationHabitStatusCreateHabit;

  factory CreationHabitStatusEvent.creationHabitStatusUpdateHabit(
      {@required String habitID,
      @required String name,
      @required bool isPositive,
      @required int value,
      @required BuiltList<dynamic> areas,
      @required bool checked}) = CreationHabitStatusUpdateHabit;

  final _CreationHabitStatusEvent _type;

//ignore: missing_return
  R when<R>(
      {@required
          R Function(CreationHabitStatusCreateHabit)
              creationHabitStatusCreateHabit,
      @required
          R Function(CreationHabitStatusUpdateHabit)
              creationHabitStatusUpdateHabit}) {
    switch (this._type) {
      case _CreationHabitStatusEvent.CreationHabitStatusCreateHabit:
        return creationHabitStatusCreateHabit(
            this as CreationHabitStatusCreateHabit);
      case _CreationHabitStatusEvent.CreationHabitStatusUpdateHabit:
        return creationHabitStatusUpdateHabit(
            this as CreationHabitStatusUpdateHabit);
    }
  }

  @override
  List get props => null;
}

@immutable
class CreationHabitStatusCreateHabit extends CreationHabitStatusEvent {
  const CreationHabitStatusCreateHabit(
      {@required this.name,
      @required this.isPositive,
      @required this.value,
      @required this.areas})
      : super(_CreationHabitStatusEvent.CreationHabitStatusCreateHabit);

  final String name;

  final bool isPositive;

  final int value;

  final BuiltList<dynamic> areas;

  @override
  String toString() =>
      'CreationHabitStatusCreateHabit(name:${this.name},isPositive:${this.isPositive},value:${this.value},areas:${this.areas})';
  @override
  List get props => [name, isPositive, value, areas];
}

@immutable
class CreationHabitStatusUpdateHabit extends CreationHabitStatusEvent {
  const CreationHabitStatusUpdateHabit(
      {@required this.habitID,
      @required this.name,
      @required this.isPositive,
      @required this.value,
      @required this.areas,
      @required this.checked})
      : super(_CreationHabitStatusEvent.CreationHabitStatusUpdateHabit);

  final String habitID;

  final String name;

  final bool isPositive;

  final int value;

  final BuiltList<dynamic> areas;

  final bool checked;

  @override
  String toString() =>
      'CreationHabitStatusUpdateHabit(habitID:${this.habitID},name:${this.name},isPositive:${this.isPositive},value:${this.value},areas:${this.areas},checked:${this.checked})';
  @override
  List get props => [habitID, name, isPositive, value, areas, checked];
}
