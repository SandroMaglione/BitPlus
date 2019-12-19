import 'package:bitplus/app/domain/repositories/profile_repository.dart';
import 'package:meta/meta.dart';
import 'package:bitplus/core/error/failures.dart';
import 'package:bitplus/core/usecase/usecase.dart';
import 'package:dartz/dartz.dart';

class SignOutProfile implements UseCase<void, NoParams> {
  final ProfileRepository profileRepository;

  const SignOutProfile({
    @required this.profileRepository,
  });

  @override
  Future<Either<Failure, void>> call(NoParams params) {
    return profileRepository.signOutProfile();
  }
}
