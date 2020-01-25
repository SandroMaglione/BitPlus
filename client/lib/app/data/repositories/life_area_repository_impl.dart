import 'package:bitplus/app/data/datasources/life_area_remote_data_source.dart';
import 'package:bitplus/app/data/models/habit.dart';
import 'package:bitplus/app/data/models/life_area.dart';
import 'package:bitplus/app/data/models/user.dart';
import 'package:bitplus/app/domain/repositories/life_area_repository.dart';
import 'package:bitplus/core/error/failures.dart';
import 'package:bitplus/core/services/area_value_algorithm.dart';
import 'package:meta/meta.dart';
import 'package:built_collection/built_collection.dart';
import 'package:dartz/dartz.dart';
import 'package:dartx/dartx.dart';
import 'package:supercharged/supercharged.dart';
import 'package:bitplus/core/extensions/task_extension.dart';

class LifeAreaRepositoryImpl implements LifeAreaRepository {
  final LifeAreaRemoteDataSource lifeAreaRemoteDataSource;
  final AreaValueAlgorithm areaValueAlgorithm;

  const LifeAreaRepositoryImpl({
    @required this.lifeAreaRemoteDataSource,
    @required this.areaValueAlgorithm,
  });

  @override
  Future<Either<Failure, void>> updateAreas(
    String uid,
    BuiltList<int> areas,
  ) async =>
      Task(
        () => lifeAreaRemoteDataSource.updateAreas(
          uid,
          areas,
        ),
      ).runAll();

  @override
  BuiltList<LifeArea> updateAreasFromHabitList(
    BuiltList<LifeArea> previousState,
    User user,
    BuiltList<Habit> habitList,
  ) {
    final areaList = _buildLifeAreaList(
      previousState,
      habitList,
      user,
    );

    final maxAreaValue = areaList.map((a) => a.value).max();

    return areaList
        .mapIndexed(
          (index, area) => area.rebuild(
            (a) => a..percentageActivity = a.value / maxAreaValue,
          ),
        )
        .sortedByNum((a) => a.userWeight)
        .reversed
        .toBuiltList();
  }

  BuiltList<LifeArea> _buildLifeAreaList(
    BuiltList<LifeArea> previousState,
    BuiltList<Habit> habitList,
    User user,
  ) {
    final sumUserAreas = user.areas.sum();
    final maxUserAreas = user.areas.max();

    return previousState
        .mapIndexed(
          (index, area) => area.rebuild(
            (a) => a
              ..userWeight = user.areas[index]
              ..value = areaValueAlgorithm.getUserValue(
                index,
                user.areas[index],
                habitList,
              )
              ..history = areaValueAlgorithm
                  .getDailyChecksCount(
                    index,
                    habitList,
                  )
                  .toBuilder()
              ..countChecksPositive = areaValueAlgorithm.getCountChecksPositive(
                index,
                habitList,
              )
              ..countChecksNegative = areaValueAlgorithm.getCountChecksNegative(
                index,
                habitList,
              )
              ..historyHabit = areaValueAlgorithm
                  .buildHabitActivity(
                    index,
                    habitList,
                  )
                  .toBuilder()
              ..percentageArea =
                  ((user.areas[index] + sumUserAreas) / user.areas.length) /
                      maxUserAreas,
          ),
        )
        .toBuiltList();
  }
}
