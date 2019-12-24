import 'package:bitplus/app/data/models/user.dart';
import 'package:bitplus/app/domain/repositories/profile_repository.dart';
import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';
import 'package:bitplus/core/error/failures.dart';
import 'package:bitplus/core/usecase/usecase.dart';
import 'package:dartz/dartz.dart';

class SignInCredentials implements UseCase<User, Params> {
  final ProfileRepository profileRepository;

  const SignInCredentials({
    @required this.profileRepository,
  });

  @override
  Future<Either<Failure, User>> call(Params params) {
    return profileRepository.signInCredentials(
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
