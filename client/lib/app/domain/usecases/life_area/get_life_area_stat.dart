import 'package:bitplus/app/data/models/life_area_stat.dart';
import 'package:bitplus/app/domain/repositories/life_area_repository.dart';
import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';
import 'package:bitplus/core/error/failures.dart';
import 'package:bitplus/core/usecase/usecase.dart';
import 'package:dartz/dartz.dart';

class GetLifeAreaStat implements UseCase<LifeAreaStat, Params> {
  final LifeAreaRepository lifeAreaRepository;

  const GetLifeAreaStat({
    @required this.lifeAreaRepository,
  });

  @override
  Future<Either<Failure, LifeAreaStat>> call(Params params) {
    return lifeAreaRepository.getLifeAreaStat(
      params.uid,
      params.lifeAreaID,
      params.startDay,
      params.endDay,
    );
  }
}

class Params extends Equatable {
  final String uid;
  final String lifeAreaID;
  final DateTime startDay;
  final DateTime endDay;

  const Params({
    @required this.uid,
    @required this.lifeAreaID,
    @required this.startDay,
    @required this.endDay,
  });

  @override
  List<Object> get props => [
        uid,
        startDay,
        lifeAreaID,
        endDay,
      ];
}
