import 'package:built_collection/built_collection.dart';
import 'package:super_enum/super_enum.dart';

part 'update_life_area_status_event.g.dart';

@superEnum
enum _UpdateLifeAreaStatusEvent {
  @Data(fields: [
    DataField('areas', BuiltList),
  ])
  UpdateLifeAreaStatusPostUpdate,
}
