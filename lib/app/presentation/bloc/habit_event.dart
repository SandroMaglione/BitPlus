import 'package:built_collection/built_collection.dart';
import 'package:super_enum/super_enum.dart';

part 'habit_event.g.dart';

@superEnum
enum _HabitEvent {
  @object
  GetHabitListHabitEvent,
  @object
  CheckHabitEvent,
  @object
  UncheckHabitEvent,
  @Data(fields: [
    DataField('name', String),
    DataField('isPositive', bool),
    DataField('value', int),
    DataField('areas', BuiltList),
  ])
  CreateHabitEvent,
}
