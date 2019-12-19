import 'package:bitplus/app/data/models/habit.dart';
import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';
import 'package:bitplus/app/domain/repositories/habit_repository.dart';
import 'package:bitplus/core/error/failures.dart';
import 'package:bitplus/core/usecase/usecase.dart';
import 'package:dartz/dartz.dart';

class UncheckHabit implements UseCase<Habit, Params> {
  final HabitRepository habitRepository;

  const UncheckHabit({
    @required this.habitRepository,
  });

  @override
  Future<Either<Failure, Habit>> call(Params params) {
    return habitRepository.uncheckHabit(
      params.uid,
      params.habitID,
      params.date,
    );
  }
}

class Params extends Equatable {
  final String uid;
  final String habitID;
  final DateTime date;

  const Params({
    @required this.habitID,
    @required this.uid,
    @required this.date,
  });

  @override
  List<Object> get props => [
        uid,
        habitID,
        date,
      ];
}
