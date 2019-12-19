import 'package:bitplus/app/data/models/habit.dart';
import 'package:bitplus/app/data/models/habit_stat.dart';
import 'package:bitplus/core/error/failures.dart';
import 'package:built_collection/built_collection.dart';
import 'package:dartz/dartz.dart';

abstract class HabitRepository {
  Future<Either<Failure, Habit>> createHabit(
    String uid,
    String name,
    bool isPositive,
    int experience,
    BuiltList<int> lifeAreaIds,
  );
  Future<Either<Failure, Habit>> updateHabit(
    String uid,
    String habitID,
    String name,
    bool isPositive,
    int experience,
    BuiltList<int> lifeAreaIds,
  );
  Future<Either<Failure, void>> checkHabit(
    String uid,
    String habitID,
    DateTime date,
  );
  Future<Either<Failure, void>> uncheckHabit(
    String uid,
    String habitID,
    DateTime date,
  );
  Future<Either<Failure, HabitStat>> getHabitStat(
    String uid,
    String habitID,
    DateTime startDay,
    DateTime endDay,
  );
}
