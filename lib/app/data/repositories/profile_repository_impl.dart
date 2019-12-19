import 'package:bitplus/app/data/datasources/profile_local_data_source.dart';
import 'package:bitplus/app/data/datasources/profile_remote_data_source.dart';
import 'package:bitplus/app/data/models/user.dart';
import 'package:meta/meta.dart';
import 'package:bitplus/app/domain/repositories/profile_repository.dart';
import 'package:bitplus/core/error/failures.dart';
import 'package:dartz/dartz.dart';

class ProfileRepositoryImpl implements ProfileRepository {
  final ProfileRemoteDataSource profileRemoteDataSource;
  final ProfileLocalDataSource profileLocalDataSource;

  const ProfileRepositoryImpl({
    @required this.profileLocalDataSource,
    @required this.profileRemoteDataSource,
  });

  @override
  Future<Either<Failure, User>> addExperienceProfile(int experience) async {
    final user = await profileRemoteDataSource.addExperience(experience);
    return user;
  }

  @override
  Future<Either<Failure, User>> getUserProfile() async {
    final user = await profileLocalDataSource.getUserLocal();
    return user;
  }

  @override
  Future<Either<Failure, User>> signInProfile(
    String email,
    String password,
  ) async {
    final user = await profileRemoteDataSource.signInEmailAndPassword(
      email,
      password,
    );
    return user;
  }

  @override
  Future<Either<Failure, void>> signOutProfile() async =>
      await profileRemoteDataSource.signOut();

  @override
  Future<Either<Failure, User>> signUpProfile(
    String email,
    String password,
  ) async {
    final user = await profileRemoteDataSource.signUp(
      email,
      password,
    );
    return user;
  }

  @override
  Future<Either<Failure, void>> saveUserProfile(User user) {
    final result = profileLocalDataSource.saveUserLocal(user);
    return result;
  }

  @override
  Future<Either<Failure, void>> removeUserProfile() {
    final result = profileLocalDataSource.removeUserLocal();
    return result;
  }
}
