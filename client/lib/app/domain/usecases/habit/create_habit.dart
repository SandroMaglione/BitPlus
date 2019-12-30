import 'package:bitplus/app/data/models/api/habit_api.dart';
import 'package:built_collection/built_collection.dart';
import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';
import 'package:bitplus/app/domain/repositories/habit_repository.dart';
import 'package:bitplus/core/error/failures.dart';
import 'package:bitplus/core/usecase/usecase.dart';
import 'package:dartz/dartz.dart';

class CreateHabit implements UseCase<HabitApi, Params> {
  final HabitRepository habitRepository;

  const CreateHabit({
    @required this.habitRepository,
  });

  @override
  Future<Either<Failure, HabitApi>> call(Params params) {
    return habitRepository.createHabit(
      params.uid,
      params.name,
      params.color,
      params.areas,
    );
  }
}

class Params extends Equatable {
  final String uid;
  final String name;
  final int color;
  final BuiltList<int> areas;

  const Params({
    @required this.name,
    @required this.uid,
    @required this.color,
    @required this.areas,
  });

  @override
  List<Object> get props => [
        uid,
        name,
        color,
        areas,
      ];
}
