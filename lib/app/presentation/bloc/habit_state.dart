import 'package:built_collection/built_collection.dart';
import 'package:super_enum/super_enum.dart';

part 'habit_state.g.dart';

@superEnum
enum _HabitState {
  @object
  InitialHabitState,
  @object
  LoadingHabitState,
  @object
  EmptyHabitState,
  @Data(fields: [
    DataField('message', String),
  ])
  ErrorHabitState,
  @Data(fields: [
    DataField('habits', BuiltList),
  ])
  LoadedHabitState,
}
