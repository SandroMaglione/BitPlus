import 'package:bitplus/app/data/models/api/habit_api.dart';
import 'package:bitplus/core/error/failures.dart';
import 'package:built_collection/built_collection.dart';
import 'package:dartz/dartz.dart';

abstract class HabitRepository {
  /// Get the list of all habit created by the user based on his/her uid
  Future<Either<Failure, BuiltList<HabitApi>>> getHabitList(
    String uid,
    int dateRange,
  );

  /// Create a new habit associated to the user based on current uid
  ///
  /// It posts an object [CreateHabitApi] and returns a new [HabitApi],
  /// to append to the current stored list
  Future<Either<Failure, HabitApi>> createHabit(
    String uid,
    String name,
    bool isPositive,
    int value,
    BuiltList<int> areas,
  );

  /// Updates habit data associated to the user based on current uid
  ///
  /// It posts an object [CreateHabitApi] and returns a new [HabitApi],
  /// to update into the current stored list
  Future<Either<Failure, HabitApi>> updateHabit(
    String uid,
    String habitID,
    String name,
    bool isPositive,
    int value,
    BuiltList<int> areas,
    bool checked,
  );

  /// Makes the attribute `checked` of the habit true
  Future<Either<Failure, void>> checkHabit(
    String uid,
    String habitID,
  );

  /// Makes the attribute `checked` of the habit false
  Future<Either<Failure, void>> uncheckHabit(
    String uid,
    String habitID,
  );
}
