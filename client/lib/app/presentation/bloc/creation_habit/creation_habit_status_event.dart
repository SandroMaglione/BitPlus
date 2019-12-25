import 'package:built_collection/built_collection.dart';
import 'package:super_enum/super_enum.dart';

part 'creation_habit_status_event.g.dart';

@superEnum
enum _CreationHabitStatusEvent {
  @Data(fields: [
    DataField('name', String),
    DataField('isPositive', bool),
    DataField('value', int),
    DataField('areas', BuiltList),
  ])
  CreationHabitStatusCreateHabit,
  @Data(fields: [
    DataField('habitID', String),
    DataField('name', String),
    DataField('isPositive', bool),
    DataField('value', int),
    DataField('areas', BuiltList),
    DataField('checked', bool),
  ])
  CreationHabitStatusUpdateHabit,
}
