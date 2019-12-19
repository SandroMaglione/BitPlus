import 'package:bitplus/app/data/models/user.dart';
import 'package:bitplus/core/error/error_messages.dart';
import 'package:bitplus/core/error/failures.dart';
import 'package:dartz/dartz.dart';
import 'package:firebase_crashlytics/firebase_crashlytics.dart';
import 'package:meta/meta.dart';
import 'package:shared_preferences/shared_preferences.dart';

const String SHARED_PREF_USER_LOCAL = "USER_LOCAL";

abstract class ProfileLocalDataSource {
  Future<Either<Failure, User>> getUserLocal();
  Future<Either<Failure, void>> saveUserLocal(User user);
}

class ProfileLocalDataSourceImpl implements ProfileLocalDataSource {
  final SharedPreferences sharedPreferences;
  final Crashlytics crashlytics;

  const ProfileLocalDataSourceImpl({
    @required this.sharedPreferences,
    @required this.crashlytics,
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

  @override
  Future<Either<Failure, void>> saveUserLocal(User user) async {
    try {
      final userString = user.toJsonString();
      final result = await sharedPreferences.setString(
        SHARED_PREF_USER_LOCAL,
        userString,
      );

      if (!result) {
        return Left(
          GettingLocalDataFailure(
            message: ERROR_SAVE_LOCAL_USER,
          ),
        );
      }

      return Right(result);
    } catch (e) {
      return Left(
        GettingLocalDataFailure(
          message: ERROR_SAVE_LOCAL_USER,
        ),
      );
    }
  }
}
