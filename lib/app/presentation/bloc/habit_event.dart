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
}
