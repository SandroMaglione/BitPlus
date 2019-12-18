import 'package:bitplus/app/data/models/user.dart';
import 'package:bitplus/app/domain/repositories/profile_repository.dart';
import 'package:bitplus/core/error/failures.dart';
import 'package:dartz/dartz.dart';

class ProfileRepositoryImpl implements ProfileRepository {
  @override
  Future<Either<Failure, User>> addExperience(int experience) {
    // TODO: implement addExperience
    return null;
  }

  @override
  Future<Either<Failure, User>> getUser(String uid) {
    // TODO: implement getUser
    return null;
  }

  @override
  Future<Either<Failure, User>> signIn(String email, String password) {
    // TODO: implement signIn
    return null;
  }

  @override
  void signOut() {
    // TODO: implement signOut
  }

  @override
  Future<Either<Failure, User>> signUp(String email, String password) {
    // TODO: implement signUp
    return null;
  }
}
