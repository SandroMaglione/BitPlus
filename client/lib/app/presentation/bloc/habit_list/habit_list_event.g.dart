// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'habit_list_event.dart';

// **************************************************************************
// SuperEnumGenerator
// **************************************************************************

@immutable
abstract class HabitListEvent extends Equatable {
  const HabitListEvent(this._type);

  factory HabitListEvent.habitListCheck({@required String habitID}) =
      HabitListCheck;

  factory HabitListEvent.habitListUncheck({@required String habitID}) =
      HabitListUncheck;

  factory HabitListEvent.habitListAddCreated({@required Habit habit}) =
      HabitListAddCreated;

  factory HabitListEvent.habitListAddUpdated({@required Habit habit}) =
      HabitListAddUpdated;

  factory HabitListEvent.habitListFetched(
      {@required BuiltList<dynamic> habitList}) = HabitListFetched;

  final _HabitListEvent _type;

//ignore: missing_return
  R when<R>(
      {@required R Function(HabitListCheck) habitListCheck,
      @required R Function(HabitListUncheck) habitListUncheck,
      @required R Function(HabitListAddCreated) habitListAddCreated,
      @required R Function(HabitListAddUpdated) habitListAddUpdated,
      @required R Function(HabitListFetched) habitListFetched}) {
    switch (this._type) {
      case _HabitListEvent.HabitListCheck:
        return habitListCheck(this as HabitListCheck);
      case _HabitListEvent.HabitListUncheck:
        return habitListUncheck(this as HabitListUncheck);
      case _HabitListEvent.HabitListAddCreated:
        return habitListAddCreated(this as HabitListAddCreated);
      case _HabitListEvent.HabitListAddUpdated:
        return habitListAddUpdated(this as HabitListAddUpdated);
      case _HabitListEvent.HabitListFetched:
        return habitListFetched(this as HabitListFetched);
    }
  }

  @override
  List get props => null;
}

@immutable
class HabitListCheck extends HabitListEvent {
  const HabitListCheck({@required this.habitID})
      : super(_HabitListEvent.HabitListCheck);

  final String habitID;

  @override
  String toString() => 'HabitListCheck(habitID:${this.habitID})';
  @override
  List get props => [habitID];
}

@immutable
class HabitListUncheck extends HabitListEvent {
  const HabitListUncheck({@required this.habitID})
      : super(_HabitListEvent.HabitListUncheck);

  final String habitID;

  @override
  String toString() => 'HabitListUncheck(habitID:${this.habitID})';
  @override
  List get props => [habitID];
}

@immutable
class HabitListAddCreated extends HabitListEvent {
  const HabitListAddCreated({@required this.habit})
      : super(_HabitListEvent.HabitListAddCreated);

  final Habit habit;

  @override
  String toString() => 'HabitListAddCreated(habit:${this.habit})';
  @override
  List get props => [habit];
}

@immutable
class HabitListAddUpdated extends HabitListEvent {
  const HabitListAddUpdated({@required this.habit})
      : super(_HabitListEvent.HabitListAddUpdated);

  final Habit habit;

  @override
  String toString() => 'HabitListAddUpdated(habit:${this.habit})';
  @override
  List get props => [habit];
}

@immutable
class HabitListFetched extends HabitListEvent {
  const HabitListFetched({@required this.habitList})
      : super(_HabitListEvent.HabitListFetched);

  final BuiltList<dynamic> habitList;

  @override
  String toString() => 'HabitListFetched(habitList:${this.habitList})';
  @override
  List get props => [habitList];
}
