import 'package:bitplus/app/data/models/life_area_stat.dart';
import 'package:bitplus/core/error/failures.dart';
import 'package:dartz/dartz.dart';

abstract class LifeAreaRepository {
  Future<Either<Failure, LifeAreaStat>> getLifeAreaStat(
    String uid,
    String lifeAreaID,
    DateTime startDay,
    DateTime endDay,
  );
}
