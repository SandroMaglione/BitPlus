import 'package:bitplus/app/data/models/user.dart';
import 'package:bitplus/core/error/failures.dart';
import 'package:built_collection/built_collection.dart';
import 'package:dartz/dartz.dart';

abstract class ProfileRepository {
  /// Try to sign in the user from the email and password.
  /// If successful, then get user data from database to create [User] model,
  /// and create local user reference. Then sign in.
  Future<Either<Failure, User>> signInCredentials(
    String email,
    String password,
  );

  /// Try to sign in the user with Google.
  /// If successful, then get user data from database to create [User] model,
  /// and create local user reference. Then sign in.
  Future<Either<Failure, User>> signInGoogle();

  /// Given email, password, and life areas points
  /// try to sign up the user.
  /// If successful, then also sign the user in.
  ///
  /// It stores the user email and areas; Plus it initialize
  /// experience, level and stores date created.
  Future<Either<Failure, User>> signUpGoogle(
    BuiltList<int> areas,
  );

  /// Sign out from google and auth
  Future<Either<Failure, void>> signOut();

  /// Given email, password, and life areas points
  /// try to sign up the user.
  /// If successful, then also sign the user in.
  ///
  /// It stores the user email and areas; Plus it initialize
  /// experience, level and stores date created.
  Future<Either<Failure, User>> signUpCredentials(
    String email,
    String password,
    BuiltList<int> areas,
  );

  Future<Either<Failure, User>> addExperience(int experience);

  /// Get [User] model if an instance exist locally
  ///
  /// Used to check if a user is signed in after app startup
  Future<Either<Failure, User>> getUser();

  /// Return [bool] true if user currently signed in
  Future<Either<Failure, bool>> isSignedInUser();
}
