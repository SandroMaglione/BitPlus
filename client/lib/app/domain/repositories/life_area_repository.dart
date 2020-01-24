import 'package:bitplus/app/data/models/api/habit_api.dart';
import 'package:bitplus/app/data/models/life_area.dart';
import 'package:bitplus/app/data/models/user.dart';
import 'package:bitplus/core/error/failures.dart';
import 'package:built_collection/built_collection.dart';
import 'package:dartz/dartz.dart';

abstract class LifeAreaRepository {
  /// Update current user life areas points
  Future<Either<Failure, void>> updateAreas(
    String uid,
    BuiltList<int> areas,
  );

  /// Update or initialize areas after each update of the habit list
  BuiltList<LifeArea> updateAreasFromHabitList(
    BuiltList<LifeArea> previousState,
    User user,
    BuiltList<HabitApi> habitList,
  );
}
