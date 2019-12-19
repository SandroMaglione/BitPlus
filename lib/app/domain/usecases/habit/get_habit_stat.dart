import 'package:bitplus/app/data/models/habit_stat.dart';
import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';
import 'package:bitplus/app/domain/repositories/habit_repository.dart';
import 'package:bitplus/core/error/failures.dart';
import 'package:bitplus/core/usecase/usecase.dart';
import 'package:dartz/dartz.dart';

class GetHabitStat implements UseCase<HabitStat, Params> {
  final HabitRepository habitRepository;

  const GetHabitStat({
    @required this.habitRepository,
  });

  @override
  Future<Either<Failure, HabitStat>> call(Params params) {
    return habitRepository.getHabitStat(
      params.uid,
      params.habitID,
      params.startDay,
      params.endDay,
    );
  }
}

class Params extends Equatable {
  final String uid;
  final String habitID;
  final DateTime startDay;
  final DateTime endDay;

  const Params({
    @required this.habitID,
    @required this.uid,
    @required this.startDay,
    @required this.endDay,
  });

  @override
  List<Object> get props => [
        uid,
        habitID,
        startDay,
        endDay,
      ];
}
