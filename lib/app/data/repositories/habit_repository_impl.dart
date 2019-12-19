import 'package:bitplus/app/data/datasources/habit_remote_data_source.dart';
import 'package:meta/meta.dart';
import 'package:bitplus/app/data/models/habit.dart';
import 'package:bitplus/app/data/models/habit_stat.dart';
import 'package:bitplus/app/domain/repositories/habit_repository.dart';
import 'package:bitplus/core/error/failures.dart';
import 'package:built_collection/built_collection.dart';
import 'package:dartz/dartz.dart';

class HabitRepositoryImpl implements HabitRepository {
  final HabitRemoteDataSource habitRemoteDataSource;

  const HabitRepositoryImpl({
    @required this.habitRemoteDataSource,
  });

  @override
  Future<Either<Failure, void>> checkHabit(
      String uid, String habitID, DateTime date) {
    // TODO: implement checkHabit
    return null;
  }

  @override
  Future<Either<Failure, Habit>> createHabit(
    String uid,
    String name,
    bool isPositive,
    int experience,
    BuiltList<int> lifeAreaIds,
  ) {
    final habit = habitRemoteDataSource.createHabit(
      uid,
      name,
      isPositive,
      experience,
      lifeAreaIds,
    );
    return habit;
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
  Future<Either<Failure, Habit>> updateHabit(
      String uid,
      String habitID,
      String name,
      bool isPositive,
      int experience,
      BuiltList<int> lifeAreaIds) {
    // TODO: implement updateHabit
    return null;
  }

  @override
  Future<Either<Failure, BuiltList<Habit>>> getHabitList(String uid) {
    final habitList = habitRemoteDataSource.getHabitList(uid);
    return habitList;
  }
}
