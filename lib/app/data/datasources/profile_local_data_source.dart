import 'package:bitplus/app/data/models/user.dart';
import 'package:bitplus/core/error/failures.dart';
import 'package:firebase_crashlytics/firebase_crashlytics.dart';
import 'package:meta/meta.dart';
import 'package:shared_preferences/shared_preferences.dart';

const String SHARED_PREF_USER_LOCAL = "USER_LOCAL";

abstract class ProfileLocalDataSource {
  Future<User> getUserLocal();
  Future<void> saveUserLocal(User user);
  Future<void> removeUserLocal();
}

class ProfileLocalDataSourceImpl implements ProfileLocalDataSource {
  final SharedPreferences sharedPreferences;
  final Crashlytics crashlytics;

  const ProfileLocalDataSourceImpl({
    @required this.sharedPreferences,
    @required this.crashlytics,
  });

  @override
  Future<User> getUserLocal() async {
    final userJson = sharedPreferences.getString(
      SHARED_PREF_USER_LOCAL,
    );

    if (userJson != null) {
      return User.fromJson(userJson);
    } else {
      return null;
    }
  }

  @override
  Future<void> saveUserLocal(User user) async {
    final userString = user.toJsonString();
    final result = await sharedPreferences.setString(
      SHARED_PREF_USER_LOCAL,
      userString,
    );

    if (!result) {
      throw GettingLocalDataFailure(
        message: 'No saved user exist',
      );
    }

    return result;
  }

  @override
  Future<void> removeUserLocal() async {
    final result = await sharedPreferences.remove(
      SHARED_PREF_USER_LOCAL,
    );

    if (!result) {
      throw GettingLocalDataFailure(
        message: 'Impossible to remove current user',
      );
    }

    return result;
  }
}
