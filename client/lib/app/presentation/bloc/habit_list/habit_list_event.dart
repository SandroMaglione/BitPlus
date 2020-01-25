import 'package:bitplus/app/data/models/habit.dart';
import 'package:built_collection/built_collection.dart';
import 'package:super_enum/super_enum.dart';

part 'habit_list_event.g.dart';

@superEnum
enum _HabitListEvent {
  @Data(fields: [
    DataField('habitID', String),
  ])
  HabitListCheck,
  @Data(fields: [
    DataField('habitID', String),
  ])
  HabitListUncheck,
  @Data(fields: [
    DataField('habit', Habit),
  ])
  HabitListAddCreated,
  @Data(fields: [
    DataField('habit', Habit),
  ])
  HabitListAddUpdated,
  @Data(fields: [
    DataField('habitList', BuiltList),
  ])
  HabitListFetched,
}
