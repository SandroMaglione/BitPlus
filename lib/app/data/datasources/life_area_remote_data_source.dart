import 'package:bitplus/app/data/models/life_area_stat.dart';
import 'package:bitplus/core/error/failures.dart';
import 'package:dartz/dartz.dart';

abstract class LifeAreaRemoteDataSource {
  Future<Either<Failure, LifeAreaStat>> getLifeAreaStat(
    String uid,
    String lifeAreaID,
    DateTime startDay,
    DateTime endDay,
  );
}

class LifeAreaRemoteDataSourceImpl implements LifeAreaRemoteDataSource {
  @override
  Future<Either<Failure, LifeAreaStat>> getLifeAreaStat(
    String uid,
    String lifeAreaID,
    DateTime startDay,
    DateTime endDay,
  ) {
    // TODO: implement getLifeAreaStat
    return null;
  }
}
