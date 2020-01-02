import 'package:bitplus/app/domain/repositories/life_area_repository.dart';
import 'package:built_collection/built_collection.dart';
import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';
import 'package:bitplus/core/error/failures.dart';
import 'package:bitplus/core/usecase/usecase.dart';
import 'package:dartz/dartz.dart';

class UpdateAreas implements UseCase<void, Params> {
  final LifeAreaRepository lifeAreaRepository;

  const UpdateAreas({
    @required this.lifeAreaRepository,
  });

  @override
  Future<Either<Failure, void>> call(Params params) {
    return lifeAreaRepository.updateAreas(
      params.uid,
      params.areas,
    );
  }
}

class Params extends Equatable {
  final String uid;
  final BuiltList<int> areas;

  const Params({
    @required this.uid,
    @required this.areas,
  });

  @override
  List<Object> get props => [
        uid,
        areas,
      ];
}
