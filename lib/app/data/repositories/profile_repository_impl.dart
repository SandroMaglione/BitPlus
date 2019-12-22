import 'package:bitplus/app/data/datasources/profile_local_data_source.dart';
import 'package:bitplus/app/data/datasources/profile_remote_data_source.dart';
import 'package:bitplus/app/data/models/sign_up_user.dart';
import 'package:bitplus/app/data/models/user.dart';
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
  Future<Either<Failure, User>> addExperienceProfile(int experience) async =>
      await Task<User>(
        () => profileRemoteDataSource.addExperience(
          experience,
        ),
      ).attempt().mapLeftToFailure().run();

  @override
  Future<Either<Failure, User>> getUserProfile() async => await Task<User>(
        () => profileLocalDataSource.getUserLocal(),
      ).attempt().mapLeftToFailure().run();

  @override
  Future<Either<Failure, User>> signInProfile(
    String email,
    String password,
  ) async =>
      await Task<User>(() async {
        final uid = await profileRemoteDataSource.signInEmailAndPassword(
          email,
          password,
        );
        final user = await profileRemoteDataSource.getSignedInUser(uid);
        await profileLocalDataSource.saveUserLocal(user);
        return user;
      }).attempt().mapLeftToFailure().run();

  @override
  Future<Either<Failure, void>> signOutProfile() async => await Task<void>(() {
        profileRemoteDataSource.signOut();
        profileLocalDataSource.removeUserLocal();
        return Future.value();
      }).attempt().mapLeftToFailure().run();

  @override
  Future<Either<Failure, User>> signUpProfile(
    SignUpUser signUpUser,
  ) async =>
      await Task<User>(() async {
        final user = await profileRemoteDataSource.signUp(
          signUpUser,
        );
        await profileRemoteDataSource.signInEmailAndPassword(
          signUpUser.email,
          signUpUser.password,
        );
        await profileLocalDataSource.saveUserLocal(user);
        return user;
      }).attempt().mapLeftToFailure().run();

  @override
  Future<Either<Failure, void>> saveUserProfile(User user) async =>
      await Task<void>(
        () => profileLocalDataSource.saveUserLocal(
          user,
        ),
      ).attempt().mapLeftToFailure().run();

  @override
  Future<Either<Failure, void>> removeUserProfile() async => await Task<void>(
        () => profileLocalDataSource.removeUserLocal(),
      ).attempt().mapLeftToFailure().run();
}
