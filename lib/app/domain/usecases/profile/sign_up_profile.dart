import 'package:bitplus/app/data/models/sign_up_user.dart';
import 'package:bitplus/app/data/models/user.dart';
import 'package:bitplus/app/domain/repositories/profile_repository.dart';
import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';
import 'package:bitplus/core/error/failures.dart';
import 'package:bitplus/core/usecase/usecase.dart';
import 'package:dartz/dartz.dart';

class SignUpProfile implements UseCase<User, Params> {
  final ProfileRepository profileRepository;

  const SignUpProfile({
    @required this.profileRepository,
  });

  @override
  Future<Either<Failure, User>> call(Params params) {
    return profileRepository.signUpProfile(
      params.signUpUser,
    );
  }
}

class Params extends Equatable {
  final SignUpUser signUpUser;

  const Params({
    @required this.signUpUser,
  });

  @override
  List<Object> get props => [signUpUser];
}
