import 'package:bitplus/app/data/models/life_area_stat.dart';

abstract class LifeAreaRemoteDataSource {
  Future<LifeAreaStat> getLifeAreaStat(
    String uid,
    String lifeAreaID,
    DateTime startDay,
    DateTime endDay,
  );
}

class LifeAreaRemoteDataSourceImpl implements LifeAreaRemoteDataSource {
  @override
  Future<LifeAreaStat> getLifeAreaStat(
    String uid,
    String lifeAreaID,
    DateTime startDay,
    DateTime endDay,
  ) {
    // TODO: implement getLifeAreaStat
    return null;
  }
}
