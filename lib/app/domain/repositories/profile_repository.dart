import 'package:bitplus/app/data/models/user.dart';
import 'package:bitplus/core/error/failures.dart';
import 'package:dartz/dartz.dart';

abstract class ProfileRepository {
  Future<Either<Failure, User>> signInProfile(
    String email,
    String password,
  );
  void signOutProfile();
  Future<Either<Failure, User>> signUpProfile(
    String email,
    String password,
  );
  Future<Either<Failure, User>> addExperienceProfile(int experience);
  Future<Either<Failure, User>> getUserProfile(String uid);
}
