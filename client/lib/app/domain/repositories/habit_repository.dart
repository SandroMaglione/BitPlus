import 'package:bitplus/app/data/models/habit.dart';
import 'package:bitplus/app/data/models/history_day_check.dart';
import 'package:bitplus/core/error/failures.dart';
import 'package:built_collection/built_collection.dart';
import 'package:dartz/dartz.dart';

abstract class HabitRepository {
  /// Get the list of all habit created by the user based on his/her uid
  Future<Either<Failure, BuiltList<Habit>>> getHabitList(
    String uid,
    int dateRange,
  );

  /// Create a new habit associated to the user based on current uid
  ///
  /// It posts an object [CreateHabit] and returns a new [Habit],
  /// to append to the current stored list
  Future<Either<Failure, Habit>> createHabit(
    String uid,
    String name,
    int color,
    BuiltList<int> areas,
  );

  /// Updates habit data associated to the user based on current uid
  ///
  /// It posts an object [CreateHabit] and returns a new [Habit],
  /// to update into the current stored list
  Future<Either<Failure, Habit>> updateHabit(
    String uid,
    String habitID,
    String name,
    int color,
    BuiltList<HistoryDayCheck> history,
    int streak,
    int countChecks,
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
