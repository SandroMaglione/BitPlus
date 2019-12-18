import 'package:bitplus/app/data/models/user.dart';
import 'package:bitplus/core/error/failures.dart';
import 'package:dartz/dartz.dart';

abstract class ProfileRepository {
  Future<Either<Failure, User>> signIn(
    String email,
    String password,
  );
  void signOut();
  Future<Either<Failure, User>> signUp(
    String email,
    String password,
  );
  Future<Either<Failure, User>> addExperience(int experience);
  Future<Either<Failure, User>> getUser(String uid);
}
