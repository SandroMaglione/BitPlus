import 'package:bitplus/app/data/datasources/habit_remote_data_source.dart';
import 'package:bitplus/app/data/datasources/profile_local_data_source.dart';
import 'package:bitplus/app/data/datasources/profile_remote_data_source.dart';
import 'package:bitplus/app/data/repositories/habit_repository_impl.dart';
import 'package:bitplus/app/data/repositories/profile_repository_impl.dart';
import 'package:bitplus/app/domain/repositories/habit_repository.dart';
import 'package:bitplus/app/domain/repositories/profile_repository.dart';
import 'package:bitplus/app/domain/usecases/habit/check_habit.dart';
import 'package:bitplus/app/domain/usecases/habit/create_habit.dart';
import 'package:bitplus/app/domain/usecases/habit/get_habit_list.dart';
import 'package:bitplus/app/domain/usecases/habit/get_habit_stat.dart';
import 'package:bitplus/app/domain/usecases/habit/uncheck_habit.dart';
import 'package:bitplus/app/domain/usecases/habit/update_habit.dart';
import 'package:bitplus/app/domain/usecases/profile/add_experience_profile.dart';
import 'package:bitplus/app/domain/usecases/profile/get_user_profile.dart';
import 'package:bitplus/app/domain/usecases/profile/remove_user_profile.dart';
import 'package:bitplus/app/domain/usecases/profile/save_user_profile.dart';
import 'package:bitplus/app/domain/usecases/profile/sign_in_profile.dart';
import 'package:bitplus/app/domain/usecases/profile/sign_out_profile.dart';
import 'package:bitplus/app/domain/usecases/profile/sign_up_profile.dart';
import 'package:bitplus/app/presentation/bloc/bloc.dart';
import 'package:bitplus/core/network/network_info.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:data_connection_checker/data_connection_checker.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_crashlytics/firebase_crashlytics.dart';
import 'package:get_it/get_it.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:shared_preferences/shared_preferences.dart';

final serviceLocator = GetIt.instance;

Future<void> init() async {
  // Bloc
  serviceLocator.registerLazySingleton<UserBloc>(
    () => UserBloc(
      getUserProfile: serviceLocator(),
      saveUserProfile: serviceLocator(),
      signInProfile: serviceLocator(),
      signOutProfile: serviceLocator(),
      signUpProfile: serviceLocator(),
      removeUserProfile: serviceLocator(),
    ),
  );

  // Repositories
  serviceLocator.registerLazySingleton<ProfileRepository>(
    () => ProfileRepositoryImpl(
      profileLocalDataSource: serviceLocator(),
      profileRemoteDataSource: serviceLocator(),
    ),
  );

  serviceLocator.registerLazySingleton<HabitRepository>(
    () => HabitRepositoryImpl(
      habitRemoteDataSource: serviceLocator(),
    ),
  );

  // Usecases
  // Profile
  serviceLocator.registerLazySingleton(
    () => AddExperienceProfile(
      profileRepository: serviceLocator(),
    ),
  );

  serviceLocator.registerLazySingleton(
    () => GetUserProfile(
      profileRepository: serviceLocator(),
    ),
  );

  serviceLocator.registerLazySingleton(
    () => SaveUserProfile(
      profileRepository: serviceLocator(),
    ),
  );

  serviceLocator.registerLazySingleton(
    () => SignInProfile(
      profileRepository: serviceLocator(),
    ),
  );

  serviceLocator.registerLazySingleton(
    () => SignOutProfile(
      profileRepository: serviceLocator(),
    ),
  );

  serviceLocator.registerLazySingleton(
    () => SignUpProfile(
      profileRepository: serviceLocator(),
    ),
  );

  serviceLocator.registerLazySingleton(
    () => RemoveUserProfile(
      profileRepository: serviceLocator(),
    ),
  );

  // Habit
  serviceLocator.registerLazySingleton(
    () => CheckHabit(
      habitRepository: serviceLocator(),
    ),
  );

  serviceLocator.registerLazySingleton(
    () => CreateHabit(
      habitRepository: serviceLocator(),
    ),
  );

  serviceLocator.registerLazySingleton(
    () => GetHabitList(
      habitRepository: serviceLocator(),
    ),
  );

  serviceLocator.registerLazySingleton(
    () => GetHabitStat(
      habitRepository: serviceLocator(),
    ),
  );

  serviceLocator.registerLazySingleton(
    () => UncheckHabit(
      habitRepository: serviceLocator(),
    ),
  );

  serviceLocator.registerLazySingleton(
    () => UpdateHabit(
      habitRepository: serviceLocator(),
    ),
  );

  // Data sources
  serviceLocator.registerLazySingleton<NetworkInfo>(
    () => NetworkInfoImpl(
      connectionChecker: serviceLocator(),
    ),
  );

  serviceLocator.registerLazySingleton<ProfileRemoteDataSource>(
    () => ProfileRemoteDataSourceImpl(
      firebaseAuth: serviceLocator(),
      firestore: serviceLocator(),
      googleSignIn: serviceLocator(),
    ),
  );

  serviceLocator.registerLazySingleton<ProfileLocalDataSource>(
    () => ProfileLocalDataSourceImpl(
      crashlytics: serviceLocator(),
      sharedPreferences: serviceLocator(),
    ),
  );

  serviceLocator.registerLazySingleton<HabitRemoteDataSource>(
    () => HabitRemoteDataSourceImpl(
      firestore: serviceLocator(),
      crashlytics: serviceLocator(),
    ),
  );

  // Services

  // External
  serviceLocator.registerLazySingleton(
    () => GoogleSignIn(
      scopes: [
        'email',
        'https://www.googleapis.com/auth/contacts.readonly',
      ],
    ),
  );

  serviceLocator.registerLazySingleton<FirebaseAuth>(
    () => FirebaseAuth.instance,
  );

  serviceLocator.registerLazySingleton<Firestore>(
    () => Firestore.instance,
  );

  serviceLocator.registerLazySingleton<Crashlytics>(
    () => Crashlytics.instance,
  );

  serviceLocator.registerLazySingleton(
    () => DataConnectionChecker(),
  );

  final sharedPreferences = await SharedPreferences.getInstance();
  serviceLocator.registerLazySingleton<SharedPreferences>(
    () => sharedPreferences,
  );
}
