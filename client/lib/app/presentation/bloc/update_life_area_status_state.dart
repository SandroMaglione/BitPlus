import 'package:super_enum/super_enum.dart';

part 'update_life_area_status_state.g.dart';

@superEnum
enum _UpdateLifeAreaStatusState {
  @object
  UpdateLifeAreaStatusLoading,
  @object
  UpdateLifeAreaStatusInitial,
  @object
  UpdateLifeAreaStatusSuccess,
  @Data(fields: [
    DataField('message', String),
  ])
  UpdateLifeAreaStatusFailure,
}
