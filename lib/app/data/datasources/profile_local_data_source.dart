import 'package:bitplus/app/data/models/user.dart';
import 'package:bitplus/core/error/exceptions.dart';
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
    try {
      final userJson = sharedPreferences.getString(
        SHARED_PREF_USER_LOCAL,
      );
      final user = User.fromJson(userJson);
      return user;
    } catch (e, s) {
      crashlytics.recordError(e, s);
      throw LocalDataException(602);
    }
  }

  @override
  Future<void> saveUserLocal(User user) async {
    try {
      final userString = user.toJsonString();
      final result = await sharedPreferences.setString(
        SHARED_PREF_USER_LOCAL,
        userString,
      );

      if (!result) {
        throw LocalDataException(601);
      }

      return result;
    } catch (e, s) {
      crashlytics.recordError(e, s);
      throw LocalDataException(601);
    }
  }

  @override
  Future<void> removeUserLocal() async {
    try {
      final result = await sharedPreferences.remove(
        SHARED_PREF_USER_LOCAL,
      );

      if (!result) {
        throw LocalDataException(600);
      }

      return result;
    } catch (e, s) {
      crashlytics.recordError(e, s);
      return LocalDataException(600);
    }
  }
}
