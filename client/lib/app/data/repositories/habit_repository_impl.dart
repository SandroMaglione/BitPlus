import 'package:bitplus/app/data/datasources/habit_remote_data_source.dart';
import 'package:bitplus/app/data/models/api/habit_api.dart';
import 'package:bitplus/app/data/models/history_check.dart';
import 'package:meta/meta.dart';
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
      await Task<void>(
        () => habitRemoteDataSource.checkHabit(
          uid,
          habitID,
        ),
      ).attempt().mapLeftToFailure().run();

  @override
  Future<Either<Failure, HabitApi>> createHabit(
    String uid,
    String name,
    int color,
    BuiltList<int> areas,
  ) async =>
      await Task<HabitApi>(
        () => habitRemoteDataSource.createHabit(
          uid,
          name,
          color,
          areas,
        ),
      ).attempt().mapLeftToFailure().run();

  @override
  Future<Either<Failure, void>> uncheckHabit(
    String uid,
    String habitID,
  ) async =>
      await Task<void>(
        () => habitRemoteDataSource.uncheckHabit(
          uid,
          habitID,
        ),
      ).attempt().mapLeftToFailure().run();

  @override
  Future<Either<Failure, BuiltList<HabitApi>>> getHabitList(
    String uid,
    int dateRange,
  ) async =>
      await Task<BuiltList<HabitApi>>(
        () => habitRemoteDataSource.getHabitList(
          uid,
          dateRange,
        ),
      ).attempt().mapLeftToFailure().run();

  @override
  Future<Either<Failure, HabitApi>> updateHabit(
    String uid,
    String habitID,
    String name,
    int color,
    BuiltList<HistoryCheck> history,
    int streak,
    int countChecks,
    BuiltList<int> areas,
    bool checked,
  ) async =>
      await Task<HabitApi>(
        () => habitRemoteDataSource.updateHabit(
          uid,
          habitID,
          name,
          color,
          history,
          streak,
          countChecks,
          areas,
          checked,
        ),
      ).attempt().mapLeftToFailure().run();
}
