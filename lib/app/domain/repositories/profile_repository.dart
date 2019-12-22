import 'package:bitplus/app/data/models/sign_up_user.dart';
import 'package:bitplus/app/data/models/user.dart';
import 'package:bitplus/core/error/failures.dart';
import 'package:dartz/dartz.dart';

abstract class ProfileRepository {
  /// Try to sign in the user from the email and password.
  /// If successful, then get user data from database to create [User] model,
  /// and create local user reference. Then sign in.
  Future<Either<Failure, User>> signInProfile(
    String email,
    String password,
  );

  /// Remove user local reference and sign out from the account
  Future<Either<Failure, void>> signOutProfile();

  /// Given email, password, and life areas points i.e. [SignUpUser],
  /// try to sign up the user.
  /// If successful, then also sign the user in.
  ///
  /// It stores the user email and areas; Plus it initialize
  /// experience, level and stores date created.
  Future<Either<Failure, User>> signUpProfile(
    SignUpUser signUpUser,
  );

  Future<Either<Failure, User>> addExperienceProfile(int experience);

  /// Get [User] model if an instance exist locally
  ///
  /// Used to check if a user is signed in after app startup
  Future<Either<Failure, User>> getUserProfile();

  /// Delete the [User] model stored locally
  ///
  /// Once delete, the user is considered signed out
  Future<Either<Failure, void>> removeUserProfile();

  /// Save a [User] model locally for successive access
  ///
  /// If a [User] is found, at startup is displayed [HomeScreen],
  /// otherwise [InitLifeAreaScreen] is shown
  Future<Either<Failure, void>> saveUserProfile(User user);
}
