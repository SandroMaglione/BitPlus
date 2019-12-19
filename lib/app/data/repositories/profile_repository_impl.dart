import 'package:bitplus/app/data/models/user.dart';
import 'package:bitplus/app/domain/repositories/profile_repository.dart';
import 'package:bitplus/core/error/failures.dart';
import 'package:dartz/dartz.dart';

class ProfileRepositoryImpl implements ProfileRepository {
  @override
  Future<Either<Failure, User>> addExperienceProfile(int experience) {
    // TODO: implement addExperienceProfile
    return null;
  }

  @override
  Future<Either<Failure, User>> getUserProfile(String uid) {
    // TODO: implement getUserProfile
    return null;
  }

  @override
  Future<Either<Failure, User>> signInProfile(String email, String password) {
    // TODO: implement signInProfile
    return null;
  }

  @override
  Future<Either<Failure, void>> signOutProfile() {
    // TODO: implement signOutProfile
    return null;
  }

  @override
  Future<Either<Failure, User>> signUpProfile(String email, String password) {
    // TODO: implement signUpProfile
    return null;
  }
}
