// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'habit_event.dart';

// **************************************************************************
// SuperEnumGenerator
// **************************************************************************

@immutable
abstract class HabitEvent extends Equatable {
  const HabitEvent(this._type);

  factory HabitEvent.getHabitListHabitEvent({@required String uid}) =
      GetHabitListHabitEvent;

  factory HabitEvent.checkHabitEvent({@required String uid}) = CheckHabitEvent;

  factory HabitEvent.uncheckHabitEvent({@required String uid}) =
      UncheckHabitEvent;

  final _HabitEvent _type;

//ignore: missing_return
  R when<R>(
      {@required R Function(GetHabitListHabitEvent) getHabitListHabitEvent,
      @required R Function(CheckHabitEvent) checkHabitEvent,
      @required R Function(UncheckHabitEvent) uncheckHabitEvent}) {
    switch (this._type) {
      case _HabitEvent.GetHabitListHabitEvent:
        return getHabitListHabitEvent(this as GetHabitListHabitEvent);
      case _HabitEvent.CheckHabitEvent:
        return checkHabitEvent(this as CheckHabitEvent);
      case _HabitEvent.UncheckHabitEvent:
        return uncheckHabitEvent(this as UncheckHabitEvent);
    }
  }

  @override
  List get props => null;
}

@immutable
class GetHabitListHabitEvent extends HabitEvent {
  const GetHabitListHabitEvent({@required this.uid})
      : super(_HabitEvent.GetHabitListHabitEvent);

  final String uid;

  @override
  String toString() => 'GetHabitListHabitEvent(uid:${this.uid})';
  @override
  List get props => [uid];
}

@immutable
class CheckHabitEvent extends HabitEvent {
  const CheckHabitEvent({@required this.uid})
      : super(_HabitEvent.CheckHabitEvent);

  final String uid;

  @override
  String toString() => 'CheckHabitEvent(uid:${this.uid})';
  @override
  List get props => [uid];
}

@immutable
class UncheckHabitEvent extends HabitEvent {
  const UncheckHabitEvent({@required this.uid})
      : super(_HabitEvent.UncheckHabitEvent);

  final String uid;

  @override
  String toString() => 'UncheckHabitEvent(uid:${this.uid})';
  @override
  List get props => [uid];
}
