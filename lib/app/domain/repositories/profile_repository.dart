import 'package:bitplus/app/data/models/user.dart';
import 'package:bitplus/core/error/failures.dart';
import 'package:dartz/dartz.dart';

abstract class ProfileRepository {
  Future<Either<Failure, User>> signInProfile(
    String email,
    String password,
  );
  Future<Either<Failure, void>> signOutProfile();
  Future<Either<Failure, User>> signUpProfile(
    String email,
    String password,
  );
  Future<Either<Failure, User>> addExperienceProfile(int experience);

  /// Get [User] model if an instance exist locally
  Future<Either<Failure, User>> getUserProfile();

  /// Delete the [User] model stored locally
  Future<Either<Failure, void>> removeUserProfile();

  /// Save a [User] model locally for successive access
  Future<Either<Failure, void>> saveUserProfile(User user);
}
