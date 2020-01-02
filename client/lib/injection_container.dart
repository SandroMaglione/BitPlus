import 'package:bitplus/app/data/datasources/habit_remote_data_source.dart';
import 'package:bitplus/app/data/datasources/life_area_remote_data_source.dart';
import 'package:bitplus/app/data/datasources/profile_local_data_source.dart';
import 'package:bitplus/app/data/datasources/profile_remote_data_source.dart';
import 'package:bitplus/app/data/repositories/habit_repository_impl.dart';
import 'package:bitplus/app/data/repositories/life_area_repository_impl.dart';
import 'package:bitplus/app/data/repositories/profile_repository_impl.dart';
import 'package:bitplus/app/domain/repositories/habit_repository.dart';
import 'package:bitplus/app/domain/repositories/life_area_repository.dart';
import 'package:bitplus/app/domain/repositories/profile_repository.dart';
import 'package:bitplus/app/domain/usecases/habit/check_habit.dart';
import 'package:bitplus/app/domain/usecases/habit/create_habit.dart';
import 'package:bitplus/app/domain/usecases/habit/get_habit_list.dart';
import 'package:bitplus/app/domain/usecases/habit/uncheck_habit.dart';
import 'package:bitplus/app/domain/usecases/habit/update_habit.dart';
import 'package:bitplus/app/domain/usecases/life_area/update_areas.dart';
import 'package:bitplus/app/domain/usecases/profile/get_user.dart';
import 'package:bitplus/app/domain/usecases/profile/is_signed_in_user.dart';
import 'package:bitplus/app/domain/usecases/profile/sign_in_credentials.dart';
import 'package:bitplus/app/domain/usecases/profile/sign_in_google.dart';
import 'package:bitplus/app/domain/usecases/profile/sign_out.dart';
import 'package:bitplus/app/domain/usecases/profile/sign_up_credentials.dart';
import 'package:bitplus/app/domain/usecases/profile/sign_up_google.dart';
import 'package:bitplus/app/presentation/bloc/bloc.dart';
import 'package:bitplus/core/constants/parameters.dart';
import 'package:bitplus/core/network/network_info.dart';
import 'package:bitplus/core/services/area_value_algorithm.dart';
import 'package:bitplus/core/utils/login_validator.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:data_connection_checker/data_connection_checker.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_crashlytics/firebase_crashlytics.dart';
import 'package:get_it/get_it.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:http/http.dart' as http;

final serviceLocator = GetIt.instance;

Future<void> init() async {
  // Bloc
  serviceLocator.registerLazySingleton<AuthBloc>(
    () => AuthBloc(
      getUser: serviceLocator(),
      isSignedInUser: serviceLocator(),
      signOut: serviceLocator(),
    ),
  );

  serviceLocator.registerFactory<LoginCredentialsBloc>(
    () => LoginCredentialsBloc(
      loginValidator: serviceLocator(),
    ),
  );

  serviceLocator.registerFactory<LoginBloc>(
    () => LoginBloc(
      authBloc: serviceLocator(),
      signInCredentials: serviceLocator(),
      signInGoogle: serviceLocator(),
      signUpCredentials: serviceLocator(),
      signUpGoogle: serviceLocator(),
    ),
  );

  serviceLocator.registerFactory<InitLifeAreaBloc>(
    () => InitLifeAreaBloc(),
  );

  serviceLocator.registerLazySingleton<HabitListBloc>(
    () => HabitListBloc(
      authBloc: serviceLocator(),
      checkHabit: serviceLocator(),
      uncheckHabit: serviceLocator(),
    ),
  );

  serviceLocator.registerLazySingleton<HabitListStatusBloc>(
    () => HabitListStatusBloc(
      getHabitList: serviceLocator(),
      habitListBloc: serviceLocator(),
      authBloc: serviceLocator(),
    ),
  );

  serviceLocator.registerFactory<AreaOverviewBloc>(
    () => AreaOverviewBloc(
      authBloc: serviceLocator(),
      habitListBloc: serviceLocator(),
      areaValueAlgorithm: serviceLocator(),
    ),
  );

  serviceLocator.registerFactory<UpdateLifeAreaStatusBloc>(
    () => UpdateLifeAreaStatusBloc(
      authBloc: serviceLocator(),
      updateAreas: serviceLocator(),
    ),
  );

  serviceLocator.registerFactory<CreationHabitBloc>(
    () => CreationHabitBloc(),
  );

  serviceLocator.registerFactory<CreationHabitStatusBloc>(
    () => CreationHabitStatusBloc(
      authBloc: serviceLocator(),
      createHabit: serviceLocator(),
      updateHabit: serviceLocator(),
      habitListBloc: serviceLocator(),
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

  serviceLocator.registerLazySingleton<LifeAreaRepository>(
    () => LifeAreaRepositoryImpl(
      lifeAreaRemoteDataSource: serviceLocator(),
    ),
  );

  // Usecases
  // Profile
  serviceLocator.registerLazySingleton(
    () => SignInCredentials(
      profileRepository: serviceLocator(),
    ),
  );

  serviceLocator.registerLazySingleton(
    () => SignInGoogle(
      profileRepository: serviceLocator(),
    ),
  );

  serviceLocator.registerLazySingleton(
    () => SignUpGoogle(
      profileRepository: serviceLocator(),
    ),
  );

  serviceLocator.registerLazySingleton(
    () => SignUpCredentials(
      profileRepository: serviceLocator(),
    ),
  );

  serviceLocator.registerLazySingleton(
    () => IsSignedInUser(
      profileRepository: serviceLocator(),
    ),
  );

  serviceLocator.registerLazySingleton(
    () => GetUser(
      profileRepository: serviceLocator(),
    ),
  );

  serviceLocator.registerLazySingleton(
    () => SignOut(
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
    () => UpdateHabit(
      habitRepository: serviceLocator(),
    ),
  );

  serviceLocator.registerLazySingleton(
    () => GetHabitList(
      habitRepository: serviceLocator(),
    ),
  );

  serviceLocator.registerLazySingleton(
    () => UncheckHabit(
      habitRepository: serviceLocator(),
    ),
  );

  // Life area
  serviceLocator.registerLazySingleton(
    () => UpdateAreas(
      lifeAreaRepository: serviceLocator(),
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
      client: serviceLocator(),
      firebaseAuth: serviceLocator(),
      firestore: serviceLocator(),
      googleSignIn: serviceLocator(),
    ),
  );

  serviceLocator.registerLazySingleton<LifeAreaRemoteDataSource>(
    () => LifeAreaRemoteDataSourceImpl(
      client: serviceLocator(),
    ),
  );

  serviceLocator.registerLazySingleton<ProfileLocalDataSource>(
    () => ProfileLocalDataSourceImpl(),
  );

  serviceLocator.registerLazySingleton<HabitRemoteDataSource>(
    () => HabitRemoteDataSourceImpl(
      client: serviceLocator(),
      firestore: serviceLocator(),
    ),
  );

  // Services
  serviceLocator.registerLazySingleton<LoginValidator>(
    () => LoginValidator(),
  );

  serviceLocator.registerLazySingleton<AreaValueAlgorithm>(
    () => ValueAlgorithmV1(
      DEFAULT_DATE_RANGE,
    ),
  );

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

  serviceLocator.registerLazySingleton<http.Client>(
    () => http.Client(),
  );

  serviceLocator.registerLazySingleton<DataConnectionChecker>(
    () => DataConnectionChecker(),
  );

  final sharedPreferences = await SharedPreferences.getInstance();
  serviceLocator.registerLazySingleton<SharedPreferences>(
    () => sharedPreferences,
  );
}
