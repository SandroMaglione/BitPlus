import 'package:bitplus/app/data/models/api/habit_api.dart';
import 'package:built_collection/built_collection.dart';
import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';
import 'package:bitplus/app/domain/repositories/habit_repository.dart';
import 'package:bitplus/core/error/failures.dart';
import 'package:bitplus/core/usecase/usecase.dart';
import 'package:dartz/dartz.dart';

class UpdateHabit implements UseCase<HabitApi, Params> {
  final HabitRepository habitRepository;

  const UpdateHabit({
    @required this.habitRepository,
  });

  @override
  Future<Either<Failure, HabitApi>> call(Params params) {
    return habitRepository.updateHabit(
      params.uid,
      params.habitID,
      params.name,
      params.isPositive,
      params.experience,
      params.lifeAreaIds,
    );
  }
}

class Params extends Equatable {
  final String uid;
  final String habitID;
  final String name;
  final bool isPositive;
  final int experience;
  final BuiltList<int> lifeAreaIds;

  const Params({
    @required this.name,
    @required this.habitID,
    @required this.uid,
    @required this.isPositive,
    @required this.experience,
    @required this.lifeAreaIds,
  });

  @override
  List<Object> get props => [
        uid,
        habitID,
        name,
        isPositive,
        experience,
        lifeAreaIds,
      ];
}
