import 'package:bitplus/app/data/models/habit.dart';
import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';
import 'package:bitplus/app/domain/repositories/habit_repository.dart';
import 'package:bitplus/core/error/failures.dart';
import 'package:bitplus/core/usecase/usecase.dart';
import 'package:dartz/dartz.dart';

class CheckHabit implements UseCase<Habit, Params> {
  final HabitRepository habitRepository;

  const CheckHabit({
    @required this.habitRepository,
  });

  @override
  Future<Either<Failure, Habit>> call(Params params) {
    return habitRepository.checkHabit(
      params.uid,
      params.habitID,
    );
  }
}

class Params extends Equatable {
  final String uid;
  final String habitID;

  const Params({
    @required this.uid,
    @required this.habitID,
  });

  @override
  List<Object> get props => [
        uid,
        habitID,
      ];
}
