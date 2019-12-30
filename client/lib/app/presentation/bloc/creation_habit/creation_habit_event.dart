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
    DataField('color', int),
  ])
  UpdateColorCreationHabitEvent,
  @Data(fields: [
    DataField('indexToUpdate', int),
  ])
  AddAreasCreationHabitEvent,
  @Data(fields: [
    DataField('indexToUpdate', int),
  ])
  SubtractAreasCreationHabitEvent,
  @Data(fields: [
    DataField('habit', HabitApi),
  ])
  InitializeHabitCreationHabitEvent,
}
