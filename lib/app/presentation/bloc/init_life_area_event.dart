import 'package:super_enum/super_enum.dart';

part 'init_life_area_event.g.dart';

@superEnum
enum _InitLifeAreaEvent {
  @Data(fields: [
    DataField('lifeAreaID', int),
  ])
  AddPointInitLifeAreaEvent,
  @Data(fields: [
    DataField('lifeAreaID', int),
  ])
  RemovePointInitLifeAreaEvent,
}
