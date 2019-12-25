import 'package:bitplus/app/data/models/api/habit_api.dart';
import 'package:super_enum/super_enum.dart';

part 'creation_habit_event.g.dart';

@superEnum
enum _CreationHabitEvent {
  @Data(fields: [
    DataField('name', String),
  ])
  UpdateNameCreationHabitEvent,
  @Data(fields: [
    DataField('isPositive', bool),
  ])
  UpdateIsPositiveCreationHabitEvent,
  @Data(fields: [
    DataField('indexSelected', int),
  ])
  UpdateValueCreationHabitEvent,
  @Data(fields: [
    DataField('indexToUpdate', int),
  ])
  UpdateAreasCreationHabitEvent,
  @Data(fields: [
    DataField('habit', HabitApi),
  ])
  InitializeHabitCreationHabitEvent,
}
