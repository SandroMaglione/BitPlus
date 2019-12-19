import 'package:bitplus/app/data/models/user.dart';
import 'package:bitplus/core/error/error_messages.dart';
import 'package:bitplus/core/error/failures.dart';
import 'package:dartz/dartz.dart';
import 'package:meta/meta.dart';
import 'package:shared_preferences/shared_preferences.dart';

const String SHARED_PREF_USER_LOCAL = "USER_LOCAL";

abstract class ProfileLocalDataSource {
  Future<Either<Failure, User>> getUserLocal();
}

class ProfileLocalDataSourceImpl implements ProfileLocalDataSource {
  final SharedPreferences sharedPreferences;

  const ProfileLocalDataSourceImpl({
    @required this.sharedPreferences,
  });

  @override
  Future<Either<Failure, User>> getUserLocal() async {
    try {
      final userJson = sharedPreferences.getString(SHARED_PREF_USER_LOCAL);
      final user = User.fromJson(userJson);
      return Right(user);
    } catch (e) {
      return Left(
        GettingLocalDataFailure(
          message: ERROR_GET_LOCAL_USER,
        ),
      );
    }
  }
}
