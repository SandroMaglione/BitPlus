import 'package:bitplus/app/data/models/user.dart';
import 'package:bitplus/app/domain/repositories/profile_repository.dart';
import 'package:built_collection/built_collection.dart';
import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';
import 'package:bitplus/core/error/failures.dart';
import 'package:bitplus/core/usecase/usecase.dart';
import 'package:dartz/dartz.dart';

class SignUpCredentials implements UseCase<User, Params> {
  final ProfileRepository profileRepository;

  const SignUpCredentials({
    @required this.profileRepository,
  });

  @override
  Future<Either<Failure, User>> call(Params params) {
    return profileRepository.signUpCredentials(
      params.email,
      params.password,
      params.areas,
    );
  }
}

class Params extends Equatable {
  final String email;
  final String password;
  final BuiltList<int> areas;

  const Params({
    @required this.email,
    @required this.password,
    @required this.areas,
  });

  @override
  List<Object> get props => [
        email,
        password,
        areas,
      ];
}
