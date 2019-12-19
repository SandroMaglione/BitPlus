import 'package:bitplus/app/data/models/habit.dart';
import 'package:built_collection/built_collection.dart';
import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';
import 'package:bitplus/app/domain/repositories/habit_repository.dart';
import 'package:bitplus/core/error/failures.dart';
import 'package:bitplus/core/usecase/usecase.dart';
import 'package:dartz/dartz.dart';

class GetHabitList implements UseCase<BuiltList<Habit>, Params> {
  final HabitRepository habitRepository;

  const GetHabitList({
    @required this.habitRepository,
  });

  @override
  Future<Either<Failure, BuiltList<Habit>>> call(Params params) {
    // TODO: Should the logic to convert to ViewModel go here?
    return habitRepository.getHabitList(
      params.uid,
    );
  }
}

class Params extends Equatable {
  final String uid;

  const Params({
    @required this.uid,
  });

  @override
  List<Object> get props => [uid];
}
