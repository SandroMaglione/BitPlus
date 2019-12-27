import 'package:built_collection/built_collection.dart';
import 'package:super_enum/super_enum.dart';

part 'area_overview_event.g.dart';

@superEnum
enum _AreaOverviewEvent {
  @Data(fields: [
    DataField('habitList', BuiltList),
  ])
  AreaOverviewInitialize,
}
