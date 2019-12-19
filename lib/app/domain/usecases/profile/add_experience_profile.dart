import 'package:bitplus/app/data/models/user.dart';
import 'package:bitplus/app/domain/repositories/profile_repository.dart';
import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';
import 'package:bitplus/core/error/failures.dart';
import 'package:bitplus/core/usecase/usecase.dart';
import 'package:dartz/dartz.dart';

class AddExperienceProfile implements UseCase<User, Params> {
  final ProfileRepository profileRepository;

  const AddExperienceProfile({
    @required this.profileRepository,
  });

  @override
  Future<Either<Failure, User>> call(Params params) {
    return profileRepository.addExperienceProfile(params.experience);
  }
}

class Params extends Equatable {
  final int experience;

  const Params({
    @required this.experience,
  });

  @override
  List<Object> get props => [experience];
}
