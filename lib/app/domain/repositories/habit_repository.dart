import 'package:bitplus/app/data/models/api/habit_api.dart';
import 'package:bitplus/core/error/failures.dart';
import 'package:built_collection/built_collection.dart';
import 'package:dartz/dartz.dart';

abstract class HabitRepository {
  Future<Either<Failure, BuiltList<HabitApi>>> getHabitList(String uid);
  Future<Either<Failure, HabitApi>> createHabit(
    String uid,
    String name,
    bool isPositive,
    int value,
    BuiltList<int> lifeAreaIds,
  );
  Future<Either<Failure, void>> checkHabit(
    String uid,
    String habitID,
  );
  Future<Either<Failure, void>> uncheckHabit(
    String uid,
    String habitID,
  );
}
