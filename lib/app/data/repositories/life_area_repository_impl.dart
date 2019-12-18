import 'package:bitplus/app/data/models/life_area_stat.dart';
import 'package:bitplus/app/domain/repositories/life_area_repository.dart';
import 'package:bitplus/core/error/failures.dart';
import 'package:dartz/dartz.dart';

class LifeAreaRepositoryImpl implements LifeAreaRepository {
  @override
  Future<Either<Failure, LifeAreaStat>> getLifeAreaStat(
      String uid, String lifeAreaID, DateTime startDay, DateTime endDay) {
    // TODO: implement getLifeAreaStat
    return null;
  }
}
