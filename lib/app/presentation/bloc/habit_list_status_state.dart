import 'package:super_enum/super_enum.dart';

part 'habit_list_status_state.g.dart';

@superEnum
enum _HabitListStatusState {
  @object
  HabitListStatusLoading,
  @object
  HabitListStatusInitial,
  @object
  HabitListStatusSuccess,
  @Data(fields: [
    DataField('message', String),
  ])
  HabitListStatusFailure,
}
