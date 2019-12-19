import 'package:bitplus/app/data/models/habit.dart';
import 'package:bitplus/app/data/models/habit_stat.dart';
import 'package:bitplus/core/error/failures.dart';
import 'package:dartz/dartz.dart';

abstract class HabitRemoteDataSource {
  Future<Either<Failure, Habit>> createHabit(String uid, String name,
      bool isPositive, int experience, List<int> lifeAreaIds);
  Future<Either<Failure, Habit>> updateHabit(String uid, String habitID,
      String name, bool isPositive, int experience, List<int> lifeArea);
  Future<Either<Failure, void>> checkHabit(
      String uid, String habitID, DateTime date);
  Future<Either<Failure, void>> uncheckHabit(
      String uid, String habitID, DateTime date);
  Future<Either<Failure, HabitStat>> getHabitStat(
      String uid, String habitID, DateTime startDay, DateTime endDay);
}

class HabitRemoteDataSourceImpl implements HabitRemoteDataSource {
  @override
  Future<Either<Failure, void>> checkHabit(
      String uid, String habitID, DateTime date) {
    // TODO: implement checkHabit
    return null;
  }

  @override
  Future<Either<Failure, Habit>> createHabit(String uid, String name,
      bool isPositive, int experience, List<int> lifeAreaIds) {
    // TODO: implement createHabit
    return null;
  }

  @override
  Future<Either<Failure, HabitStat>> getHabitStat(
      String uid, String habitID, DateTime startDay, DateTime endDay) {
    // TODO: implement getHabitStat
    return null;
  }

  @override
  Future<Either<Failure, void>> uncheckHabit(
      String uid, String habitID, DateTime date) {
    // TODO: implement uncheckHabit
    return null;
  }

  @override
  Future<Either<Failure, Habit>> updateHabit(String uid, String habitID,
      String name, bool isPositive, int experience, List<int> lifeArea) {
    // TODO: implement updateHabit
    return null;
  }
}
