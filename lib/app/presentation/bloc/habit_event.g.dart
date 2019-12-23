// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'habit_event.dart';

// **************************************************************************
// SuperEnumGenerator
// **************************************************************************

@immutable
abstract class HabitEvent extends Equatable {
  const HabitEvent(this._type);

  factory HabitEvent.getHabitListHabitEvent() = GetHabitListHabitEvent;

  factory HabitEvent.checkHabitEvent({@required String habitID}) =
      CheckHabitEvent;

  factory HabitEvent.uncheckHabitEvent({@required String habitID}) =
      UncheckHabitEvent;

  factory HabitEvent.createHabitEvent(
      {@required String name,
      @required bool isPositive,
      @required int value,
      @required BuiltList<dynamic> areas}) = CreateHabitEvent;

  final _HabitEvent _type;

//ignore: missing_return
  R when<R>(
      {@required R Function(GetHabitListHabitEvent) getHabitListHabitEvent,
      @required R Function(CheckHabitEvent) checkHabitEvent,
      @required R Function(UncheckHabitEvent) uncheckHabitEvent,
      @required R Function(CreateHabitEvent) createHabitEvent}) {
    switch (this._type) {
      case _HabitEvent.GetHabitListHabitEvent:
        return getHabitListHabitEvent(this as GetHabitListHabitEvent);
      case _HabitEvent.CheckHabitEvent:
        return checkHabitEvent(this as CheckHabitEvent);
      case _HabitEvent.UncheckHabitEvent:
        return uncheckHabitEvent(this as UncheckHabitEvent);
      case _HabitEvent.CreateHabitEvent:
        return createHabitEvent(this as CreateHabitEvent);
    }
  }

  @override
  List get props => null;
}

@immutable
class GetHabitListHabitEvent extends HabitEvent {
  const GetHabitListHabitEvent._() : super(_HabitEvent.GetHabitListHabitEvent);

  factory GetHabitListHabitEvent() {
    _instance ??= GetHabitListHabitEvent._();
    return _instance;
  }

  static GetHabitListHabitEvent _instance;
}

@immutable
class CheckHabitEvent extends HabitEvent {
  const CheckHabitEvent({@required this.habitID})
      : super(_HabitEvent.CheckHabitEvent);

  final String habitID;

  @override
  String toString() => 'CheckHabitEvent(habitID:${this.habitID})';
  @override
  List get props => [habitID];
}

@immutable
class UncheckHabitEvent extends HabitEvent {
  const UncheckHabitEvent({@required this.habitID})
      : super(_HabitEvent.UncheckHabitEvent);

  final String habitID;

  @override
  String toString() => 'UncheckHabitEvent(habitID:${this.habitID})';
  @override
  List get props => [habitID];
}

@immutable
class CreateHabitEvent extends HabitEvent {
  const CreateHabitEvent(
      {@required this.name,
      @required this.isPositive,
      @required this.value,
      @required this.areas})
      : super(_HabitEvent.CreateHabitEvent);

  final String name;

  final bool isPositive;

  final int value;

  final BuiltList<dynamic> areas;

  @override
  String toString() =>
      'CreateHabitEvent(name:${this.name},isPositive:${this.isPositive},value:${this.value},areas:${this.areas})';
  @override
  List get props => [name, isPositive, value, areas];
}
