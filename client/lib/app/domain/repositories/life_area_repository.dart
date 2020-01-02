import 'package:bitplus/core/error/failures.dart';
import 'package:built_collection/built_collection.dart';
import 'package:dartz/dartz.dart';

abstract class LifeAreaRepository {
  /// Update current user life areas points
  Future<Either<Failure, void>> updateAreas(
    String uid,
    BuiltList<int> areas,
  );
}
