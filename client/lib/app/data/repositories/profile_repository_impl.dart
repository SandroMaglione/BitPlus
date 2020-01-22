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
  Future<Either<Failure, User>> getUser() async => Task(
        () => profileRemoteDataSource.getSignedInUser(),
      ).runAll();

  @override
  Future<Either<Failure, bool>> isSignedInUser() async => Task(
        () => profileRemoteDataSource.isSignedInUser(),
      ).runAll();

  @override
  Future<Either<Failure, User>> signInCredentials(
    String email,
    String password,
  ) async =>
      Task(
        () async {
          await profileRemoteDataSource.signInEmailAndPassword(email, password);
          return profileRemoteDataSource.getSignedInUser();
        },
      ).runAll();

  @override
  Future<Either<Failure, User>> signInGoogle() async => Task(
        () async {
          await profileRemoteDataSource.signInGoogle();
          return profileRemoteDataSource.getSignedInUser();
        },
      ).runAll();

  @override
  Future<Either<Failure, void>> signOut() async => Task(
        () => profileRemoteDataSource.signOut(),
      ).runAll();

  @override
  Future<Either<Failure, User>> signUpGoogle(
    BuiltList<int> areas,
  ) async =>
      Task(() async {
        final firebaseUser = await profileRemoteDataSource.signInGoogle();
        return profileRemoteDataSource.createAccount(
          firebaseUser.uid,
          firebaseUser.email,
          areas,
        );
      }).runAll();

  @override
  Future<Either<Failure, User>> signUpCredentials(
    String email,
    String password,
    BuiltList<int> areas,
  ) =>
      Task(() async {
        final uid = await profileRemoteDataSource.signUpCredentials(
          email,
          password,
        );
        return profileRemoteDataSource.createAccount(
          uid,
          email,
          areas,
        );
      }).runAll();
}
