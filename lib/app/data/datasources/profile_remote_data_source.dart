import 'package:bitplus/app/data/models/user.dart';
import 'package:bitplus/core/error/failures.dart';
import 'package:dartz/dartz.dart';

abstract class ProfileRemoteDataSource {
  Future<Either<Failure, User>> signInEmailAndPassword(
      String email, String password);
  Future<Either<Failure, User>> signInGoogle();
  Future<Either<Failure, User>> signInFacebook();
  void signOut();
  Future<Either<Failure, User>> signUp(String email, String password);
  Future<Either<Failure, User>> signUpGoogle();
  Future<Either<Failure, User>> signUpFacebook();
  Future<Either<Failure, User>> addExperience(int experience);
  Future<Either<Failure, User>> getUserRemote(String uid);
}

class ProfileRemoteDataSourceImpl implements ProfileRemoteDataSource {
  @override
  Future<Either<Failure, User>> addExperience(int experience) {
    // TODO: implement addExperience
    return null;
  }

  @override
  Future<Either<Failure, User>> getUserRemote(String uid) {
    // TODO: implement getUserRemote
    return null;
  }

  @override
  Future<Either<Failure, User>> signInEmailAndPassword(
      String email, String password) {
    // TODO: implement signInEmailAndPassword
    return null;
  }

  @override
  Future<Either<Failure, User>> signInFacebook() {
    // TODO: implement signInFacebook
    return null;
  }

  @override
  Future<Either<Failure, User>> signInGoogle() {
    // TODO: implement signInGoogle
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

  @override
  Future<Either<Failure, User>> signUpFacebook() {
    // TODO: implement signUpFacebook
    return null;
  }

  @override
  Future<Either<Failure, User>> signUpGoogle() {
    // TODO: implement signUpGoogle
    return null;
  }
}
