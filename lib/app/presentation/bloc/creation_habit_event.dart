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
}
