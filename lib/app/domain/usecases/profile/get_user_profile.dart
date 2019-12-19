import 'package:bitplus/app/data/models/user.dart';
import 'package:bitplus/app/domain/repositories/profile_repository.dart';
import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';
import 'package:bitplus/core/error/failures.dart';
import 'package:bitplus/core/usecase/usecase.dart';
import 'package:dartz/dartz.dart';

class GetUserProfile implements UseCase<User, Params> {
  final ProfileRepository profileRepository;

  const GetUserProfile({
    @required this.profileRepository,
  });

  @override
  Future<Either<Failure, User>> call(Params params) {
    return profileRepository.getUserProfile(params.uid);
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
