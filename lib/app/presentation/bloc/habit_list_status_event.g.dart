// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'habit_list_status_event.dart';

// **************************************************************************
// SuperEnumGenerator
// **************************************************************************

@immutable
abstract class HabitListStatusEvent extends Equatable {
  const HabitListStatusEvent(this._type);

  factory HabitListStatusEvent.habitListStatusGetHabitList() =
      HabitListStatusGetHabitList;

  final _HabitListStatusEvent _type;

//ignore: missing_return
  R when<R>(
      {@required
          R Function(HabitListStatusGetHabitList)
              habitListStatusGetHabitList}) {
    switch (this._type) {
      case _HabitListStatusEvent.HabitListStatusGetHabitList:
        return habitListStatusGetHabitList(this as HabitListStatusGetHabitList);
    }
  }

  @override
  List get props => null;
}

@immutable
class HabitListStatusGetHabitList extends HabitListStatusEvent {
  const HabitListStatusGetHabitList._()
      : super(_HabitListStatusEvent.HabitListStatusGetHabitList);

  factory HabitListStatusGetHabitList() {
    _instance ??= HabitListStatusGetHabitList._();
    return _instance;
  }

  static HabitListStatusGetHabitList _instance;
}
