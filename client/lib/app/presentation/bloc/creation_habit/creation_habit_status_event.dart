import 'package:built_collection/built_collection.dart';
import 'package:super_enum/super_enum.dart';

part 'creation_habit_status_event.g.dart';

@superEnum
enum _CreationHabitStatusEvent {
  @Data(fields: [
    DataField('name', String),
    DataField('color', int),
    DataField('areas', BuiltList),
  ])
  CreationHabitStatusCreateHabit,
  @Data(fields: [
    DataField('habitID', String),
    DataField('name', String),
    DataField('color', int),
    DataField('history', BuiltList),
    DataField('streak', int),
    DataField('countChecks', int),
    DataField('areas', BuiltList),
    DataField('checked', bool),
  ])
  CreationHabitStatusUpdateHabit,
}
