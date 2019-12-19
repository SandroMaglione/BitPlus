// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'habit_event.dart';

// **************************************************************************
// SuperEnumGenerator
// **************************************************************************

@immutable
abstract class HabitEvent extends Equatable {
  const HabitEvent(this._type);

  factory HabitEvent.getHabitListHabitEvent() = GetHabitListHabitEvent;

  factory HabitEvent.checkHabitEvent() = CheckHabitEvent;

  factory HabitEvent.uncheckHabitEvent() = UncheckHabitEvent;

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
  const GetHabitListHabitEvent._() : super(_HabitEvent.GetHabitListHabitEvent);

  factory GetHabitListHabitEvent() {
    _instance ??= GetHabitListHabitEvent._();
    return _instance;
  }

  static GetHabitListHabitEvent _instance;
}

@immutable
class CheckHabitEvent extends HabitEvent {
  const CheckHabitEvent._() : super(_HabitEvent.CheckHabitEvent);

  factory CheckHabitEvent() {
    _instance ??= CheckHabitEvent._();
    return _instance;
  }

  static CheckHabitEvent _instance;
}

@immutable
class UncheckHabitEvent extends HabitEvent {
  const UncheckHabitEvent._() : super(_HabitEvent.UncheckHabitEvent);

  factory UncheckHabitEvent() {
    _instance ??= UncheckHabitEvent._();
    return _instance;
  }

  static UncheckHabitEvent _instance;
}
