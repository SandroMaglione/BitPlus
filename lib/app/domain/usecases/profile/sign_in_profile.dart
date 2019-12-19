import 'package:bitplus/app/data/models/user.dart';
import 'package:bitplus/app/domain/repositories/profile_repository.dart';
import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';
import 'package:bitplus/core/error/failures.dart';
import 'package:bitplus/core/usecase/usecase.dart';
import 'package:dartz/dartz.dart';

class SignInProfile implements UseCase<User, Params> {
  final ProfileRepository profileRepository;

  const SignInProfile({
    @required this.profileRepository,
  });

  @override
  Future<Either<Failure, User>> call(Params params) {
    return profileRepository.signInProfile(
      params.email,
      params.password,
    );
  }
}

class Params extends Equatable {
  final String email;
  final String password;

  const Params({
    @required this.email,
    @required this.password,
  });

  @override
  List<Object> get props => [
        email,
        password,
      ];
}
