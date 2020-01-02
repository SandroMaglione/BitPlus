import 'package:bitplus/app/data/datasources/life_area_remote_data_source.dart';
import 'package:bitplus/app/domain/repositories/life_area_repository.dart';
import 'package:bitplus/core/error/failures.dart';
import 'package:meta/meta.dart';
import 'package:built_collection/built_collection.dart';
import 'package:dartz/dartz.dart';
import 'package:bitplus/core/extensions/task_extension.dart';

class LifeAreaRepositoryImpl implements LifeAreaRepository {
  final LifeAreaRemoteDataSource lifeAreaRemoteDataSource;

  const LifeAreaRepositoryImpl({
    @required this.lifeAreaRemoteDataSource,
  });

  @override
  Future<Either<Failure, void>> updateAreas(
    String uid,
    BuiltList<int> areas,
  ) async =>
      await Task<void>(
        () => lifeAreaRemoteDataSource.updateAreas(
          uid,
          areas,
        ),
      ).attempt().mapLeftToFailure().run();
}
