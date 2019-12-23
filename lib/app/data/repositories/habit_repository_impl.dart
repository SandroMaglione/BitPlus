import 'package:bitplus/app/data/datasources/habit_remote_data_source.dart';
import 'package:bitplus/app/data/models/api/habit_api.dart';
import 'package:meta/meta.dart';
import 'package:bitplus/app/data/models/habit.dart';
import 'package:bitplus/app/domain/repositories/habit_repository.dart';
import 'package:bitplus/core/error/failures.dart';
import 'package:built_collection/built_collection.dart';
import 'package:dartz/dartz.dart';
import 'package:bitplus/core/extensions/task_extension.dart';

class HabitRepositoryImpl implements HabitRepository {
  final HabitRemoteDataSource habitRemoteDataSource;

  const HabitRepositoryImpl({
    @required this.habitRemoteDataSource,
  });

  @override
  Future<Either<Failure, void>> checkHabit(
    String uid,
    String habitID,
  ) async =>
      await Task<Habit>(
        () => habitRemoteDataSource.checkHabit(
          uid,
          habitID,
        ),
      ).attempt().mapLeftToFailure().run();

  @override
  Future<Either<Failure, HabitApi>> createHabit(
    String uid,
    String name,
    bool isPositive,
    int value,
    BuiltList<int> lifeAreaIds,
  ) async =>
      await Task<HabitApi>(
        () => habitRemoteDataSource.createHabit(
          uid,
          name,
          isPositive,
          value,
          lifeAreaIds,
        ),
      ).attempt().mapLeftToFailure().run();

  @override
  Future<Either<Failure, void>> uncheckHabit(
    String uid,
    String habitID,
  ) async =>
      await Task<Habit>(
        () => habitRemoteDataSource.uncheckHabit(
          uid,
          habitID,
        ),
      ).attempt().mapLeftToFailure().run();

  @override
  Future<Either<Failure, BuiltList<HabitApi>>> getHabitList(
    String uid,
  ) async =>
      await Task<BuiltList<HabitApi>>(
        () => habitRemoteDataSource.getHabitList(
          uid,
        ),
      ).attempt().mapLeftToFailure().run();
}
