import 'package:bitplus/app/data/datasources/profile_local_data_source.dart';
import 'package:bitplus/app/data/datasources/profile_remote_data_source.dart';
import 'package:bitplus/app/data/models/user.dart';
import 'package:built_collection/built_collection.dart';
import 'package:meta/meta.dart';
import 'package:bitplus/app/domain/repositories/profile_repository.dart';
import 'package:bitplus/core/error/failures.dart';
import 'package:dartz/dartz.dart';
import 'package:bitplus/core/extensions/task_extension.dart';

class ProfileRepositoryImpl implements ProfileRepository {
  final ProfileRemoteDataSource profileRemoteDataSource;
  final ProfileLocalDataSource profileLocalDataSource;

  const ProfileRepositoryImpl({
    @required this.profileLocalDataSource,
    @required this.profileRemoteDataSource,
  });

  @override
  Future<Either<Failure, User>> addExperience(int experience) {
    // TODO: implement addExperience
    return null;
  }

  @override
  Future<Either<Failure, User>> getUser() async => await Task<User>(
        () => profileRemoteDataSource.getSignedInUser(),
      ).attempt().mapLeftToFailure().run();

  @override
  Future<Either<Failure, bool>> isSignedInUser() async => await Task<bool>(
        () => profileRemoteDataSource.isSignedInUser(),
      ).attempt().mapLeftToFailure().run();

  @override
  Future<Either<Failure, User>> signInCredentials(
    String email,
    String password,
  ) async =>
      await Task<User>(
        () async {
          await profileRemoteDataSource.signInEmailAndPassword(email, password);
          return profileRemoteDataSource.getSignedInUser();
        },
      ).attempt().mapLeftToFailure().run();

  @override
  Future<Either<Failure, User>> signInGoogle() async => await Task<User>(
        () async {
          await profileRemoteDataSource.signInGoogle();
          return profileRemoteDataSource.getSignedInUser();
        },
      ).attempt().mapLeftToFailure().run();

  @override
  Future<Either<Failure, void>> signOut() async => await Task<void>(
        () => profileRemoteDataSource.signOut(),
      ).attempt().mapLeftToFailure().run();

  @override
  Future<Either<Failure, User>> signUpGoogle(
    BuiltList<int> areas,
  ) async =>
      await Task<User>(() async {
        final firebaseUser = await profileRemoteDataSource.signInGoogle();
        return await profileRemoteDataSource.createAccount(
          firebaseUser.uid,
          firebaseUser.email,
          areas,
        );
      }).attempt().mapLeftToFailure().run();

  @override
  Future<Either<Failure, User>> signUpCredentials(
    String email,
    String password,
    BuiltList<int> areas,
  ) async =>
      await Task<User>(() async {
        final uid = await profileRemoteDataSource.signUpCredentials(
          email,
          password,
        );
        return await profileRemoteDataSource.createAccount(
          uid,
          email,
          areas,
        );
      }).attempt().mapLeftToFailure().run();
}
