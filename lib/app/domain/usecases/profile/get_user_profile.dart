import 'package:bitplus/app/data/models/user.dart';
import 'package:bitplus/app/domain/repositories/profile_repository.dart';
import 'package:meta/meta.dart';
import 'package:bitplus/core/error/failures.dart';
import 'package:bitplus/core/usecase/usecase.dart';
import 'package:dartz/dartz.dart';

class GetUserProfile implements UseCase<User, NoParams> {
  final ProfileRepository profileRepository;

  const GetUserProfile({
    @required this.profileRepository,
  });

  @override
  Future<Either<Failure, User>> call(NoParams params) {
    return profileRepository.getUserProfile();
  }
}
