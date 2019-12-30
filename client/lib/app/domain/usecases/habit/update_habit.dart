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
      params.color,
      params.history,
      params.streak,
      params.countChecks,
      params.areas,
      params.checked,
    );
  }
}

class Params extends Equatable {
  final String uid;
  final String habitID;
  final String name;
  final bool checked;
  final int color;
  final BuiltList<bool> history;
  final int streak;
  final int countChecks;
  final BuiltList<int> areas;

  const Params({
    @required this.name,
    @required this.habitID,
    @required this.uid,
    @required this.checked,
    @required this.color,
    @required this.areas,
    @required this.history,
    @required this.streak,
    @required this.countChecks,
  });

  @override
  List<Object> get props => [
        uid,
        checked,
        habitID,
        name,
        color,
        areas,
        history,
        streak,
        countChecks,
      ];
}
