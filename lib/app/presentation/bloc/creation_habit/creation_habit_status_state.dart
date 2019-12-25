import 'package:super_enum/super_enum.dart';

part 'creation_habit_status_state.g.dart';

@superEnum
enum _CreationHabitStatusState {
  @object
  CreationHabitStatusLoading,
  @object
  CreationHabitStatusInProgress,
  @object
  CreationHabitStatusSuccess,
  @Data(fields: [
    DataField('message', String),
  ])
  CreationHabitStatusFailure,
}
