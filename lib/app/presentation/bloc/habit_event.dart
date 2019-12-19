import 'package:super_enum/super_enum.dart';

part 'habit_event.g.dart';

@superEnum
enum _HabitEvent {
  @Data(fields: [
    DataField('uid', String),
  ])
  GetHabitListHabitEvent,
  @Data(fields: [
    DataField('uid', String),
  ])
  CheckHabitEvent,
  @Data(fields: [
    DataField('uid', String),
  ])
  UncheckHabitEvent,
}
