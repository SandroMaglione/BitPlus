import 'package:bitplus/app/data/models/habit.dart';
import 'package:bitplus/app/data/models/life_area.dart';
import 'package:bitplus/app/data/models/user.dart';
import 'package:bitplus/app/domain/repositories/life_area_repository.dart';
import 'package:built_collection/built_collection.dart';
import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';
import 'package:bitplus/core/usecase/usecase.dart';

class UpdateAreasFromHabitList implements UseCaseSync<void, Params> {
  final LifeAreaRepository lifeAreaRepository;

  const UpdateAreasFromHabitList({
    @required this.lifeAreaRepository,
  });

  @override
  BuiltList<LifeArea> call(Params params) {
    return lifeAreaRepository.updateAreasFromHabitList(
      params.previousState,
      params.user,
      params.habitList,
    );
  }
}

class Params extends Equatable {
  final BuiltList<LifeArea> previousState;
  final User user;
  final BuiltList<Habit> habitList;

  const Params({
    @required this.previousState,
    @required this.user,
    @required this.habitList,
  });

  @override
  List<Object> get props => [previousState, user, habitList];
}
