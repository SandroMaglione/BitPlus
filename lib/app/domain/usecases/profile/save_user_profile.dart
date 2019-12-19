import 'package:bitplus/app/data/models/user.dart';
import 'package:bitplus/app/domain/repositories/profile_repository.dart';
import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';
import 'package:bitplus/core/error/failures.dart';
import 'package:bitplus/core/usecase/usecase.dart';
import 'package:dartz/dartz.dart';

class SaveUserProfile implements UseCase<void, Params> {
  final ProfileRepository profileRepository;

  const SaveUserProfile({
    @required this.profileRepository,
  });

  @override
  Future<Either<Failure, void>> call(Params params) {
    return profileRepository.saveUserProfile(params.user);
  }
}

class Params extends Equatable {
  final User user;

  const Params({
    @required this.user,
  });

  @override
  List<Object> get props => [user];
}
